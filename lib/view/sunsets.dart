import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/units/units.dart';

import '../assets/CustomColors.dart';
import '../repository/sunsets_rep.dart';
import 'app_bar.dart';

class Sunsets extends StatefulWidget {
  const Sunsets({Key? key}) : super(key: key);

  @override
  _SunsetsState createState() => _SunsetsState();
}

class _SunsetsState extends State<Sunsets> {
  late Future<Record> futureRecord;

  @override
  void initState() {
    super.initState();
    futureRecord = getRecordJson();
    futureRecord.then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.light_grey,
      appBar: const CustomAppBar(height: 70),
      body: FutureBuilder<Record>(
        future: futureRecord,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.sunset.length,
                itemBuilder: (context, position) {
                  return CardSunset(
                    planet: snapshot.data!.sunset[position].planet,
                    resources: snapshot.data!.sunset[position].resources,
                    date: snapshot.data!.sunset[position].date,
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class CardSunset extends StatelessWidget {
  const CardSunset(
      {Key? key,
      required this.planet,
      required this.resources,
      required this.date})
      : super(key: key);
  final String planet;
  final List<String> resources;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'personal sunset'),
        child: Card(
            shadowColor: CustomColors.black_50,
            elevation: 1,
            color: CustomColors.white,
            margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: IntrinsicHeight(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        AppLocalizations.of(context)!.planet.toUpperCase() +
                            ": " +
                            planet.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: CustomColors.light_purple,
                            fontFamily: 'Nunito_extra_bold'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        AppLocalizations.of(context)!.resources + ":",
                        style: const TextStyle(
                            fontSize: 16,
                            color: CustomColors.light_purple,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        listInString(resources),
                        style: const TextStyle(
                            fontSize: 14,
                            color: CustomColors.black,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                      child: Text(
                        AppLocalizations.of(context)!.date + ": " + date,
                        style: const TextStyle(
                            fontSize: 12,
                            color: CustomColors.light_purple,
                            fontFamily: 'Nunito'),
                      ),
                    )
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalDivider(
                      color: CustomColors.light_grey,
                      thickness: 1,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, left: 10),
                      child: Image.asset(
                        "assets/images/arrow_right_purple.png",
                        width: 16,
                        height: 16,
                      ),
                    )
                  ],
                )
              ],
            ))));
  }
}
