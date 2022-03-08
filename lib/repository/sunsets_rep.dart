import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

Future<Record> getRecordJson() async {
  final response = await http.get(
      Uri.parse('https://api.jsonbin.io/v3/b/62278bc7a703bb6749255efb/latest'),
      headers: header);

  if (response.statusCode == 200) {
    return Record.fromJson(jsonDecode(response.body)['record']);
  } else {
    throw Exception('Failed to load album');
  }
}

Map<String, String> get header => {
      "X-Master-Key":
          "\$2b\$10\$PYBf5ovG9nzHek8KnFEaI./SSX.jDonjRPCvQufmFcRcAxgF8RiNW"
    };


class Record {
  final List<SingleSunset> sunset;

  const Record({required this.sunset});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(sunset: List<SingleSunset>.from(json['sunset'].map((e) => SingleSunset.fromJson(e))));
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
