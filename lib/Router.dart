import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constant/route_paths.dart' as routes;
import './screens/login.dart';
import './screens/navigation/drawer1.dart';
import './screens/signup.dart';
import './main.dart';
import './screens/profile.dart';
import './screens/list_uni.dart';
import './screens/chat_ui.dart';
import './screens/chat.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.IntialRoute:
      return MaterialPageRoute(builder: (context) => MyApp());

    case routes.FrindeList:
      return MaterialPageRoute(builder: (context) => ChatUi());

    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case routes.HomeRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => DarkDrawerPage());

    case routes.ProfileRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => ProfileSevenPage());

    case routes.SingUp:
      return MaterialPageRoute(builder: (context) => SignupOnePage());

    case routes.UniList:
      return MaterialPageRoute(builder: (context) => SchoolList());
    case routes.ChatMessge:
      return MaterialPageRoute(builder: (context) => ChatTwoPage());
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
