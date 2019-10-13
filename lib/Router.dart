import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constant/route_paths.dart' as routes;
import './screens/login.dart';
import './screens/navigation/drawer1.dart' ;
import './screens/signup.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case routes.HomeRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => DarkDrawerPage());

    case routes.SingUp:
     return MaterialPageRoute(
          builder: (context) => SignupOnePage());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}