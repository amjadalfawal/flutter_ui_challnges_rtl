/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:my_app/services/navigation_service.dart';
import '../../locator.dart';
import './animation1.dart';

import './oval-right-clipper.dart';
import './oval-left-clipper.dart';
import '../../screens/feed.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DarkDrawerPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Color(0xff291747);
  final Color active = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Dark Drawer Navigation'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
      ),
      drawer: buildDrawer(context),
      body:HomePage(),
    );
  }

 dynamic buildDrawer(BuildContext context) {
    final String image = images[0];
    return ClipPath(
      clipper: Localizations.localeOf(context).languageCode == 'ar'
          ? OvalLeftBorderClipper()
          : OvalRightBorderClipper(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.52, //20.0,

        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: BoxDecoration(
                color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: active,
                        ),
                        onPressed: () {
                          _navigationService.navigateTo('Login');
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.pink, Colors.deepPurple])),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: CachedNetworkImageProvider(image),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "erika costell",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    Text(
                      "@erika07",
                      style: TextStyle(color: active, fontSize: 16.0),
                    ),
                    SizedBox(height: 30.0),
                    _buildRow(Icons.home, "Home"),
                    _buildDivider(),
                    GestureDetector(
                      onTap: () {
                          _navigationService.navigateTo('Prfoile');
                      },
                      child: _buildRow(Icons.person_pin, "Your profile"),
                    ),
                    _buildDivider(),
                    _buildRow(Icons.email, "Contact us"),
                    _buildDivider(),
                    _buildRow(Icons.info_outline, "Help"),
                    _buildDivider(),
                    _buildRow(Icons.settings, "Settings"),
                    _buildDivider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ]),
    );
  }
}
