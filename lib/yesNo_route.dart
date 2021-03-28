import 'dart:math';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'navDrawer.dart';

class YesNoRoute extends StatefulWidget {
  YesNoRoute({Key key, this.title}) : super(key: key);
  static const String routeName = "/YesOrNo";

  final String title;

  @override
  _yesNoRouteState createState() => _yesNoRouteState();
}

class _yesNoRouteState extends State<YesNoRoute> {
  String result = '';
  String text = '';
  bool visible = false;

  Future<void> _yesOrNo() async {
    setState(() {
      result = '';
      text = '';
      visible = true;
    });
    await new Future.delayed(const Duration(seconds: 2));

    var random = new Random();
    int randomNumber = random.nextInt(100);
    print(randomNumber);
    setState(() {
      visible = false;
      text = 'The answer is ...';
      if (randomNumber.isEven) {
        result = 'Yes';
      } else {
        result = 'No';
      }
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
            Text(
              '$text',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$result',
              style: Theme.of(context).textTheme.headline4,
            ),
            Visibility(
              child: LoadingBouncingLine.circle(
                borderColor: Colors.grey,
                borderSize: 3.0,
                size: 100.0,
                backgroundColor: Colors.teal,
                duration: Duration(seconds: 2),
              ),
              visible: visible,
            ),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  _yesOrNo();
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
                  "Ask",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
