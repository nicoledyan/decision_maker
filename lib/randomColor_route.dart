import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorRoute extends StatefulWidget {
  RandomColorRoute({Key key, this.title}) : super(key: key);
  static const String routeName = "/RandomColor";

  final String title;

  @override
  _randomColorRouteState createState() => _randomColorRouteState();
}

class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class _randomColorRouteState extends State<RandomColorRoute> {
  Color background = Colors.white;
  bool visible = false;
  String rgbColor = '';
  void _getRandomColor() {
    Color myColor = UniqueColorGenerator.getColor();
    rgbColor = "rgb: (" +
        myColor.red.toString() +
        ", " +
        myColor.blue.toString() +
        ", " +
        myColor.green.toString() +
        ")";

    setState(() {
      visible = true;
      background = myColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
              visible: visible,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$rgbColor',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    _getRandomColor();
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
                    "Get a Color",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
