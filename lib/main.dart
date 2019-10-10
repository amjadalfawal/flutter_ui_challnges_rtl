import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'screens/login.dart';

void main() => runApp(MaterialApp(home: EasyLocalization(child: MyApptest())));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var test = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      LoginTowPage(),
      new Positioned(
        child: new FloatingActionButton(
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
          backgroundColor: Colors.blueGrey,
        ),
        right: 10.0,
        bottom: 10.0,
      )
    ]);
  }
}

class MyApptest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(locale: data.locale, path: 'resources'),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp(),
      ),
    );
  }
}
