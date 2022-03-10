class RecordSunsets {
  final List<SingleSunset> sunset;

  const RecordSunsets({required this.sunset});

  factory RecordSunsets.fromJson(Map<String, dynamic> json) {
    return RecordSunsets(sunset: List<SingleSunset>.from(json['sunset'].map((e) => SingleSunset.fromJson(e))));
  }
}

class SingleSunset {
  final int number;
  final String date;
  final String planet;
  final bool sp;
  final String mission;
  final List<String> resources;

  const SingleSunset(
      {required this.number,
      required this.date,
      required this.planet,
      required this.sp,
      required this.mission,
      required this.resources});

  factory SingleSunset.fromJson(Map<String, dynamic> json) {
    return SingleSunset(
        number: json['number'],
        date: json['date'],
        planet: json['planet'],
        sp: json['sp'],
        mission: json['mission'],
        resources: List<String>.from(json['resources']));
  }
}
