import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 70),
      body: Center(
        child: Text(""),
      ),
    );
  }
}