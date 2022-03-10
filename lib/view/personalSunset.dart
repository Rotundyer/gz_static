import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gz_static/api/models/all_data_rep.dart';
import 'package:gz_static/api/repository/main_rep.dart';
import 'package:gz_static/view/widgets/app_bar.dart';

import '../assets/CustomColors.dart';
import '../units/units.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalSunset extends StatefulWidget {
  const PersonalSunset({Key? key}) : super(key: key);

  @override
  _PersonalSunsetState createState() => _PersonalSunsetState();
}

class _PersonalSunsetState extends State<PersonalSunset> {
  late Future<RecordAllData> futureRecord;

  @override
  void initState() {
    super.initState();
    futureRecord = getRecordAllDataJson();
    futureRecord.then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    final number = ((ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map)['number'];
    return Scaffold(
        backgroundColor: CustomColors.light_grey,
        appBar: const CustomAppBar(height: 70),
        body: FutureBuilder<RecordAllData>(
          future: futureRecord,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final sunset = giveSunset(number, snapshot.data?.sunset);
              if (sunset != null) {
                return LabelPersonalSunset(sunset: sunset);
              } else {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.data_not_found,
                    style: const TextStyle(
                        fontSize: 30,
                        color: CustomColors.black,
                        fontFamily: 'Nunito'),
                  ),
                );
              }
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
        ));
  }
}

class LabelPersonalSunset extends StatelessWidget {
  const LabelPersonalSunset({Key? key, required this.sunset}) : super(key: key);
  final Sunset sunset;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      children: [
        CardPersonalSunset(
          planet: sunset.planet,
          mission: sunset.mission,
          date: sunset.date,
          sp: sunset.sp,
          number: sunset.number,
        ),
        TablePersonalSunset(resources: upperListResource(sunset.resources)),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          child: Text(
            AppLocalizations.of(context)!.mission_time +
                " : ${sunset.timeFarm}",
            style: const TextStyle(
                fontSize: 20,
                color: CustomColors.light_purple,
                fontFamily: 'Nunito_bold'),
          ),
        ),
        TableResInTimePersonalSunset(
          resources: sunset.resources,
        ),
        TableNicknamesPersonalSunset(
          players: sunset.players,
        )
      ],
    );
  }
}

class CardPersonalSunset extends StatelessWidget {
  const CardPersonalSunset(
      {Key? key,
      required this.planet,
      required this.mission,
      required this.date,
      required this.sp,
      required this.number})
      : super(key: key);
  final String planet;
  final String mission;
  final String date;
  final bool sp;
  final int number;

  @override
  Widget build(BuildContext context) {
    Color yesViewColor = CustomColors.light_black;
    Color noViewColor = CustomColors.light_black;
    if (sp) {
      yesViewColor = CustomColors.light_purple;
    } else {
      noViewColor = CustomColors.light_purple;
    }

    return Card(
        shadowColor: CustomColors.black_50,
        elevation: 1,
        color: CustomColors.light_purple,
        child: Row(children: [
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
                      color: CustomColors.white,
                      fontFamily: 'Nunito_extra_bold'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.mission.toUpperCase() +
                            ": " +
                            mission,
                        style: const TextStyle(
                            fontSize: 16,
                            color: CustomColors.white,
                            fontFamily: 'Nunito_bold'),
                      ),
                      Text(
                        "№ $number",
                        style: const TextStyle(
                            fontSize: 20,
                            color: CustomColors.white,
                            fontFamily: 'Nunito_bold'),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.date + ": " + date,
                      style: const TextStyle(
                          fontSize: 14,
                          color: CustomColors.white,
                          fontFamily: 'Nunito'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.sp.toUpperCase() + ":",
                          style: const TextStyle(
                              fontSize: 16,
                              color: CustomColors.white,
                              fontFamily: 'Nunito_bold'),
                        ),
                        ButtonYesOrNo(
                            text:
                                AppLocalizations.of(context)!.yes.toUpperCase(),
                            color: yesViewColor),
                        ButtonYesOrNo(
                            text:
                                AppLocalizations.of(context)!.no.toUpperCase(),
                            color: noViewColor),
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
        ]));
  }
}

class ButtonYesOrNo extends StatelessWidget {
  const ButtonYesOrNo({Key? key, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5),
        width: 30,
        height: 20,
        color: CustomColors.white,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14, color: color, fontFamily: 'Nunito_bold'),
          ),
        ));
  }
}

class TablePersonalSunset extends StatelessWidget {
  const TablePersonalSunset({Key? key, required this.resources})
      : super(key: key);
  final List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: IntrinsicHeight(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: ColumnNamedPersonalSunset()),
            const VerticalDivider(
              color: CustomColors.light_purple,
              thickness: 1,
              width: 1,
            ),
            Expanded(
                child: ColumnResourcesPersonalSunset(resource: resources[0])),
            const VerticalDivider(
              color: CustomColors.light_purple,
              thickness: 0.5,
              width: 1,
            ),
            Expanded(
                child: ColumnResourcesPersonalSunset(resource: resources[1])),
            const VerticalDivider(
              color: CustomColors.light_purple,
              thickness: 0.5,
              width: 1,
            ),
            Expanded(
                child: ColumnResourcesPersonalSunset(resource: resources[2])),
            const VerticalDivider(
              color: CustomColors.light_purple,
              thickness: 0.5,
              width: 1,
            ),
            Expanded(
                child: ColumnResourcesPersonalSunset(resource: resources[3])),
          ],
        )));
  }
}

class ColumnNamedPersonalSunset extends StatelessWidget {
  const ColumnNamedPersonalSunset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBoxPersonalSunset(
          height: 30,
          width: 75,
          text: AppLocalizations.of(context)!.resources,
          fontSize: 18,
          fontFamily: 'Nunito_bold',
          color: CustomColors.light_purple,
        ),
        const Divider(color: CustomColors.light_purple, thickness: 1),
        SizedBoxPersonalSunset(
          height: 15,
          width: 75,
          text: AppLocalizations.of(context)!.player1,
          fontSize: 14,
          fontFamily: 'Nunito_bold',
          color: CustomColors.light_purple,
        ),
        const Divider(color: CustomColors.light_purple, thickness: 0.5),
        SizedBoxPersonalSunset(
          height: 15,
          width: 75,
          text: AppLocalizations.of(context)!.player2,
          fontSize: 14,
          fontFamily: 'Nunito_bold',
          color: CustomColors.light_purple,
        ),
        const Divider(color: CustomColors.light_purple, thickness: 0.5),
        SizedBoxPersonalSunset(
          height: 15,
          width: 75,
          text: AppLocalizations.of(context)!.player3,
          fontSize: 14,
          fontFamily: 'Nunito_bold',
          color: CustomColors.light_purple,
        ),
        const Divider(color: CustomColors.light_purple, thickness: 0.5),
        SizedBoxPersonalSunset(
          height: 15,
          width: 75,
          text: AppLocalizations.of(context)!.player4,
          fontSize: 14,
          fontFamily: 'Nunito_bold',
          color: CustomColors.light_purple,
        ),
        const Divider(color: CustomColors.light_purple, thickness: 1),
        SizedBox(
            height: 25,
            width: 75,
            child: Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Center(
                    child: Text(
                  AppLocalizations.of(context)!.total.toUpperCase() + ":",
                  style: const TextStyle(
                      fontSize: 16,
                      color: CustomColors.light_purple,
                      fontFamily: 'Nunito_bold'),
                )))),
        const Divider(
            color: CustomColors.light_purple, thickness: 0.5, height: 1),
      ],
    ));
  }
}

class ColumnResourcesPersonalSunset extends StatelessWidget {
  const ColumnResourcesPersonalSunset({Key? key, required this.resource})
      : super(key: key);
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 30,
              width: getScreenWidth(context) / 7,
              child: Center(
                  child: Text(
                resource.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    color: setResourceColor(resource.name),
                    fontFamily: 'Nunito'),
              ))),
          const Divider(color: CustomColors.light_purple, thickness: 1),
          SizedBoxPersonalSunset(
            height: 15,
            text: resource.player1.toString(),
            fontSize: 14,
            fontFamily: 'Nunito',
            color: CustomColors.black,
          ),
          const Divider(color: CustomColors.light_purple, thickness: 0.5),
          SizedBoxPersonalSunset(
            height: 15,
            text: resource.player2.toString(),
            fontSize: 14,
            fontFamily: 'Nunito',
            color: CustomColors.black,
          ),
          const Divider(color: CustomColors.light_purple, thickness: 0.5),
          SizedBoxPersonalSunset(
            height: 15,
            text: resource.player3.toString(),
            fontSize: 14,
            fontFamily: 'Nunito',
            color: CustomColors.black,
          ),
          const Divider(color: CustomColors.light_purple, thickness: 0.5),
          SizedBoxPersonalSunset(
            height: 15,
            text: resource.player4.toString(),
            fontSize: 14,
            fontFamily: 'Nunito',
            color: CustomColors.black,
          ),
          const Divider(color: CustomColors.light_purple, thickness: 1),
          SizedBox(
              height: 25,
              child: Text(
                resource.total.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    color: CustomColors.light_purple,
                    fontFamily: 'Nunito'),
              )),
          const Divider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class SizedBoxPersonalSunset extends StatelessWidget {
  const SizedBoxPersonalSunset(
      {Key? key,
      required this.height,
      required this.text,
      required this.fontSize,
      required this.fontFamily,
      required this.color,
      this.width})
      : super(key: key);
  final double height;
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize, color: color, fontFamily: fontFamily),
        )));
  }
}

class TableResInTimePersonalSunset extends StatelessWidget {
  const TableResInTimePersonalSunset({Key? key, required this.resources})
      : super(key: key);
  final List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: IntrinsicHeight(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: IntrinsicWidth(
            child: Column(
              children: [
                const Divider(
                  color: CustomColors.light_purple,
                  thickness: 0.5,
                  height: 1,
                ),
                SizedBoxPersonalSunset(
                    height: 66,
                    text: AppLocalizations.of(context)!.unit_of_resource,
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    color: CustomColors.light_purple),
                const Divider(
                  color: CustomColors.light_purple,
                  thickness: 0.5,
                  height: 1,
                ),
              ],
            ),
          )),
          const VerticalDivider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            width: 1,
          ),
          Expanded(
              child: TableResInTimePersonalSunset_sub(
            resource: resources[0],
          )),
          const VerticalDivider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            width: 1,
          ),
          Expanded(
              child: TableResInTimePersonalSunset_sub(
            resource: resources[1],
          )),
          const VerticalDivider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            width: 1,
          ),
          Expanded(
              child: TableResInTimePersonalSunset_sub(
            resource: resources[2],
          )),
          const VerticalDivider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            width: 1,
          ),
          Expanded(
              child: TableResInTimePersonalSunset_sub(
            resource: resources[3],
          )),
        ],
      )),
    );
  }
}

class TableResInTimePersonalSunset_sub extends StatelessWidget {
  const TableResInTimePersonalSunset_sub({Key? key, required this.resource})
      : super(key: key);
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          const Divider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            height: 1,
          ),
          SizedBoxPersonalSunset(
            height: 35,
            text: resource.name,
            fontSize: 13,
            fontFamily: 'Nunito',
            color: setResourceColor(resource.name),
          ),
          const Divider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            height: 1,
          ),
          SizedBoxPersonalSunset(
            height: 30,
            text: resource.resInTime.toString(),
            fontSize: 14,
            fontFamily: 'Nunito_bold',
            color: CustomColors.black,
          ),
          const Divider(
            color: CustomColors.light_purple,
            thickness: 0.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class TableNicknamesPersonalSunset extends StatelessWidget {
  const TableNicknamesPersonalSunset({Key? key, required this.players})
      : super(key: key);
  final Players players;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: IntrinsicHeight(
          child: Row(
            children: [
              IntrinsicWidth(
                child: Column(
                  children: [
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.player1,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.light_purple,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.player2,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.light_purple,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.player3,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.light_purple,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.player4,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.light_purple,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                color: CustomColors.light_purple,
                thickness: 0.5,
                width: 1,
              ),
              Expanded(
                  child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        child: Center(
                            child: Text(
                          players.player1,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.black,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        child: Center(
                            child: Text(
                          players.player2,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.black,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        child: Center(
                            child: Text(
                          players.player3,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.black,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(
                        height: 25,
                        child: Center(
                            child: Text(
                          players.player4,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.black,
                              fontFamily: 'Nunito_bold'),
                        ))),
                    const Divider(
                      color: CustomColors.light_purple,
                      thickness: 0.5,
                      height: 1,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}