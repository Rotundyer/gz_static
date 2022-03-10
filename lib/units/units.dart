import 'package:flutter/cupertino.dart';
import 'package:gz_static/assets/CustomColors.dart';

import '../api/models/all_data_rep.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String listInString(List<String> arguments) {
  String string = "";
  for (var i in arguments) {
    string += i;
    if (arguments.last != i) string += ", ";
  }
  return string;
}

Sunset? giveSunset(int number, List<Sunset>? sunset) {
  if (sunset != null)
    for (var i in sunset) {
      if (i.number == number) return i;
    }
  return null;
}

List<Resource> upperListResource(List<Resource> resources) {
  for (var i = 0; i < 4 - resources.length; i++) {
    resources.add(const Resource(
        name: "-",
        player1: 0,
        player2: 0,
        player3: 0,
        player4: 0,
        total: 0,
        resInTime: 0));
  }
  return resources;
}

Color setResourceColor(String name){
  List<String> resources = [
    'пластиды',
    'феррит',
    'рубедо',
    'схемы',
    'сплавы'
  ];
  // if (resources.every((element) => element == name.toLowerCase())) {
  if(resources.contains(name)){
    return CustomColors.light_purple;
  } else {
    return CustomColors.black_25;
  }
}
