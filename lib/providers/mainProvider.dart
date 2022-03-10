import 'package:flutter/cupertino.dart';

import '../assets/CustomColors.dart';
import '../units/units.dart';

class MainProvider with ChangeNotifier {
  Color _resourcesColor = CustomColors.black_25;

  Color get getResourcesColor => _resourcesColor;

  void setResource(String name){
    _resourcesColor = setResourceColor(name);
  }

  // int _number = 0;
  //
  // int get number => _number;
  //
  // void setNumber (int num) {
  //   _number = num;
  //   print('num: $num');
  //   print('_number: $_number');
  //   print('number: $number');
  //   notifyListeners();
  // }
}