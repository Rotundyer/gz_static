import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class Check {
  final List<Album> album;

  Check({required this.album});

  factory Check.fromJson(List<dynamic> json){
    return Check(album: List<Album>.from(json.map((e) => Album.fromJson(e))));
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Album(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}

Future<Check> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    return Check.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
