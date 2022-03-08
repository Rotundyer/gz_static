import 'package:flutter/material.dart';
import 'package:gz_static/view/app_bar.dart';

class PersonalSunset extends StatefulWidget {
  const PersonalSunset({Key? key}) : super(key: key);

  @override
  _PersonalSunsetState createState() => _PersonalSunsetState();
}

class _PersonalSunsetState extends State<PersonalSunset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 70),
    );
  }
}