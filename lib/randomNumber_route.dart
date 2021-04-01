import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool _error = false;
  String errorMessage = '';

  final rangeMinController = TextEditingController();
  final rangeMaxController = TextEditingController();

  void _getrandomNumber() {
    _error = false;
    number = '';
    if (rangeMinController.text.isEmpty || rangeMaxController.text.isEmpty) {
      print('try again');
      setState(() {
        _error = true;
        errorMessage = 'Must enter bottom and top range values';
      });
      return;
    }
    int min = num.parse(rangeMinController.text);
    int max = num.parse(rangeMaxController.text);

    if (min > max) {
      setState(() {
        _error = true;
        errorMessage = 'bottom of range must be less than top of range';
      });
    } else if (min < max) {
      var random = new Random();
      int randomNumber = min + random.nextInt(max - min);
      setState(() {
        visible = true;
        number = randomNumber.toString();
      });
    }
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
                width: 300,
                height: 50,
                child: TextField(
                  controller: rangeMinController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter any number',
                    labelText: 'Bottom of Range',
                    errorText: _error ? errorMessage : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: rangeMaxController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                      hintText: 'Enter any number', labelText: 'Top of Range'),
                ),
              ),
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
