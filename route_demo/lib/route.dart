import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Route'),),
      body: Center(child: Text('This is new route'),),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }): super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('value pass via route: $text'),
              RaisedButton(
                onPressed: ()=> Navigator.pop(context, 'I am return value'),
                child: Text('back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}