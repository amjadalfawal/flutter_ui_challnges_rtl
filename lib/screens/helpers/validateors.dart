// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Validator {
  static String isEmail(String em, BuildContext context) {
    if (em.isEmpty) {
      if (Localizations.localeOf(context).languageCode == "ar")
        return "لا يمكن ان يكون البريد الإلكتروني فارغا";
      else
        return "Email can't be empty";
    }

    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    if (!regExp.hasMatch(em)) {
      if (Localizations.localeOf(context).languageCode == "ar")
        return "البريد الإلكتروني خاطئ";
      else
        return "Wrong Email";
      
    }

    return null;
  }
}
