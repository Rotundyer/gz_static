import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/units/units.dart';

import '../api/models/sunset_model.dart';
import '../api/repository/main_rep.dart';
import '../assets/CustomColors.dart';
import 'widgets/app_bar.dart';

class Sunsets extends StatefulWidget {
  const Sunsets({Key? key}) : super(key: key);

  @override
  _SunsetsState createState() => _SunsetsState();
}

class _SunsetsState extends State<Sunsets> {
  late Future<RecordSunsets> futureRecord;

  @override
  void initState() {
    super.initState();
    futureRecord = getRecordSunsetsJson();
    futureRecord.then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.light_grey,
      appBar: const CustomAppBar(height: 70),
      body: FutureBuilder<RecordSunsets>(
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
                    number: snapshot.data!.sunset[position].number,
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              '${snapshot.error}',
              style: const TextStyle(
                  fontSize: 18,
                  color: CustomColors.black,
                  fontFamily: 'Nunito_bold'),
            ));
          }
          return const Center(
            child: CircularProgressIndicator(
              color: CustomColors.light_purple,
            ),
          );
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
      required this.date,
      required this.number})
      : super(key: key);
  final String planet;
  final List<String> resources;
  final String date;
  final int number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              // context.read<MainProvider>().setNumber(number),
              Navigator.pushNamed(context, 'personal sunset',
                  arguments: {"number": number})
            },
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
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: CustomColors.light_purple,
                          size: 24,
                        ))
                  ],
                )
              ],
            ))));
  }
}
