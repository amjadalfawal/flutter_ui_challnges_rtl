import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/services/navigation_service.dart';
import '../locator.dart';
import './assets/assets.dart';
import '../screens/assets/network_image.dart';

class ProfileSevenPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  @override
  Widget build(BuildContext context) {
          var lang = Localizations.localeOf(context).languageCode;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          mini: true,
          child: lang == 'ar' ?  Icon(  Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward) : Icon(  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 330,
                    color: primary,
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Icon(
                      Icons.settings,
                      color: secondary,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 90,
                          margin: EdgeInsets.only(top: 60),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: PNetworkImage(rocket),
                          )),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "Sudip Thapa",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "Kathmandu",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 77),
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text("Photos",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("5,000",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text("Followers",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("5,000",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 5),
                                      child: Text("Followings",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text("5,000",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      UserInfo()
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.school),
                        title: Row(
                          children: <Widget>[
                            Text("Universty   "),
                            GestureDetector(
                              onTap: () {
                                _navigationService.navigateTo('UniList');
                              },
                              child: Icon(Icons.edit, color: Colors.blue),
                            ),
                          ],
                        ),
                        subtitle: Text("Kathmandu"),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text("Location"),
                        subtitle: Text("Kathmandu"),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("sudeptech@gmail.com"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text("99--99876-56"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("About Me"),
                        subtitle: Text(
                            "This is a about me link and you can khow about me in this section."),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
