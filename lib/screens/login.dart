/**
 * Author: amjad alfawal
 *
  */
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:my_app/services/navigation_service.dart';
import '../locator.dart';
import './assets/assets.dart';
import './helpers/validateors.dart';
import './assets/network_image.dart';
import 'package:my_app/constant/route_paths.dart' as routes;

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _email = TextEditingController();
    final NavigationService _navigationService = locator<NavigationService>();

  var errMsg;
  @override
  void dispose() {
     errMsg.dispose();
    _email.dispose();
    super.dispose();
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: PNetworkImage(origami),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  _navigationService.navigateTo(routes.SingUp, arguments: '\nFilledStacks');
                },
                child: Text("Sign Up",
                    style: TextStyle(color: Colors.blue, fontSize: 18.0)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm() {

        return Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: MultipleRoundedCurveClipper(),
                child: ClipPath(
                  clipper: RoundedDiagonalPathClipper(),
                  child: Container(
                    height: 400,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 90.0,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              controller: _email,
                              style: TextStyle(color: Colors.blue),
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context).tr('Auth.email'),
                                  hintStyle: TextStyle(color: Colors.blue.shade200),
                                  errorText: errMsg,
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              )),
                        )),
                    Container(
                      child: Divider(
                        color: Colors.blue.shade400,
                      ),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                              )),
                        )),
                    Container(
                      child: Divider(
                        color: Colors.blue.shade400,
                      ),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.black45),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    errMsg = Validator.isEmail(_email.text , context);

                    //todo http request login amjad 
                  });
                     if (errMsg == null){
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (BuildContext context) => DarkDrawerPage()));
                          _navigationService.navigateTo(routes.HomeRoute, arguments: '\nFilledStacks');

                     }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text("Login", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //data.changeLocale(Locale("ar", "DZ"));
    return 
     
       Scaffold(
          body: _buildPageContent(context),
          floatingActionButton:      
         new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            setState(() {
              var data = EasyLocalizationProvider.of(context).data;
              if (Localizations.localeOf(context).languageCode == "ar")
                data.changeLocale(Locale("en", "US"));
              else
                data.changeLocale(Locale("ar", "DZ"));
            });
          },
        ));
        
  }
}
