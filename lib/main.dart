import 'package:flutter/material.dart';
import 'yesNo_route.dart';
import 'navDrawer.dart';
import 'randomColor_route.dart';
import 'randomNumber_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      YesNoRoute.routeName: (BuildContext context) =>
          new YesNoRoute(title: "Yes or No"),
      RandomColorRoute.routeName: (BuildContext context) =>
          new RandomColorRoute(title: "Random Color"),
      RandomNumberRoute.routeName: (BuildContext context) =>
          new RandomNumberRoute(title: "Random Number"),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decision Maker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Decision Maker'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Have a decision?',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, YesNoRoute.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 5,
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                    child: Text(
                      "Yes or No Question",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RandomColorRoute.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 5,
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                    child: Text(
                      "Random Color",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RandomNumberRoute.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 5,
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                    child: Text(
                      "Random Number",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
