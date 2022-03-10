import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/all_data_rep.dart';
import '../models/sunset_model.dart';

String b_sunsetsJson = "6227f6c0061827674370e775";
String b_fullJson = "6227f6bf061827674370e773";

Map<String, String> get header => {
      "X-Master-Key":
          "\$2b\$10\$PYBf5ovG9nzHek8KnFEaI./SSX.jDonjRPCvQufmFcRcAxgF8RiNW"
    };

Future<RecordSunsets> getRecordSunsetsJson() async {
  final response = await http.get(
      Uri.parse('https://api.jsonbin.io/v3/b/$b_sunsetsJson/latest'),
      headers: header);

  if (response.statusCode == 200) {
    return RecordSunsets.fromJson(jsonDecode(response.body)['record']);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<RecordAllData> getRecordAllDataJson() async {
  final response = await http.get(
      Uri.parse('https://api.jsonbin.io/v3/b/$b_fullJson/latest'),
      headers: header);

  if (response.statusCode == 200) {
    return RecordAllData.fromJson(jsonDecode(response.body)['record']);
  } else {
    throw Exception('Failed to load album');
  }
}
