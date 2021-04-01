import 'package:decision_maker/randomColor_route.dart';
import 'package:decision_maker/randomNumber_route.dart';
import 'package:flutter/material.dart';
import 'package:decision_maker/yesNo_route.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 65.0,
            child: DrawerHeader(
              child: Text(
                'Decision Menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
                // image: DecorationImage(
                //     fit: BoxFit.fill, image: AssetImage('web/favicon.png'))
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('Yes or No'),
            onTap: () => {Navigator.pushNamed(context, YesNoRoute.routeName)},
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Randmon Color'),
            onTap: () =>
                {Navigator.pushNamed(context, RandomColorRoute.routeName)},
          ),
          ListTile(
            leading: Icon(Icons.calculate_rounded),
            title: Text('Random Number'),
            onTap: () =>
                {Navigator.pushNamed(context, RandomNumberRoute.routeName)},
          ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}
