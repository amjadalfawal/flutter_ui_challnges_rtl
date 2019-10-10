import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Validator {
  static String isEmail(String em, BuildContext context) {
       if (em.isEmpty) 
       {

      

              return  AppLocalizations.of(context).tr('erroes.filed_not_empty',args:['email']);
       
       }

    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    if (!regExp.hasMatch(em)) return "wrong email";

    return null;
  }
}
