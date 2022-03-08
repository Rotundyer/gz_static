import 'package:flutter/cupertino.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String listInString(List<String> arguments) {
  String string = "";
  for (var i in arguments){
    string += i;
    if (arguments.last != i) string += "/ ";
  }
  return string;
}
