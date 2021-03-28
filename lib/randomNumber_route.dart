import 'dart:math';
import 'package:flutter/material.dart';

class RandomNumberRoute extends StatefulWidget {
  RandomNumberRoute({Key key, this.title}) : super(key: key);
  static const String routeName = "/randomNumber";

  final String title;

  @override
  _randomNumberRouteState createState() => _randomNumberRouteState();
}

class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class _randomNumberRouteState extends State<RandomNumberRoute> {
  Color background = Colors.white;
  bool visible = false;
  String number = '';
  void _getrandomNumber() {
    var random = new Random();
    int randomNumber = random.nextInt(100);
    print(randomNumber);

    setState(() {
      visible = true;
      number = randomNumber.toString();
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
              child: Text(
                '$number',
                style: Theme.of(context).textTheme.headline1,
              ),
              visible: visible,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    _getrandomNumber();
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
                    "Get a Number",
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
