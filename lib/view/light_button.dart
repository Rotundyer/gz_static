import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gz_static/assets/CustomColors.dart';

class LightButton extends StatelessWidget {
  const LightButton({Key? key, required this.routeName, required this.text})
      : super(key: key);
  final String routeName;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            const EdgeInsets.only(right: 25, left: 25, top: 12.5, bottom: 12.5),
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, routeName),
          child: Text(
            text ?? "",
            style: const TextStyle(
                fontSize: 20,
                color: CustomColors.black_grey,
                fontFamily: 'Nurito'),
          ),
          style: ElevatedButton.styleFrom(
              shadowColor: CustomColors.black_50,
              elevation: 1,
              primary: CustomColors.white,
              onPrimary: CustomColors.light_purple,
              minimumSize: const Size.fromHeight(70)),
        ));
  }
}
