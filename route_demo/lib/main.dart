import 'package:flutter/material.dart';
import 'package:route_demo/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: getRoutes(context),
    );
  }

  getRoutes(BuildContext context) {
    return {
      'new_page': (context) => NewRoute(),
      'tip_page': (context) => TipRoute(
            text: ModalRoute.of(context).settings.arguments,
          ),
      '/': (context) => MyHomePage(
            title: 'Flutter Demo Home Page',
          )
    };
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                // MaterialPageRoute
                Navigator.pushNamed(context, 'new_page');
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
              },
            ),
            FlatButton(
              child: Text('open tip route'),
              textColor: Colors.cyan,
              onPressed: () async {
                // MaterialPageRoute
                var result = await Navigator.pushNamed(context, 'tip_page',
                    arguments: 'pass something via named route');
                // var result = await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return TipRoute(text: 'pass something to route');
                // }));
                print('route return: $result');
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
