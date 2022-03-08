class Data {
  final String dateToday;
  final Sunset sunset;

  const Data({required this.dateToday, required this.sunset});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        dateToday: json['date_today'], sunset: Sunset.fromJson(json['sunset']));
  }
}

class Sunset {
  final int number;
  final String date;
  final String planet;
  final bool sp;
  final String mission;
  final int party;
  final Players players;
  final int timeFarm;
  final List<Resource> resources;

  const Sunset(
      {required this.number,
      required this.date,
      required this.planet,
      required this.sp,
      required this.mission,
      required this.party,
      required this.players,
      required this.timeFarm,
      required this.resources});

  factory Sunset.fromJson(Map<String, dynamic> json) {
    return Sunset(
        number: json['number'],
        date: json['date'],
        planet: json['planet'],
        sp: json['sp'],
        mission: json['mission'],
        party: json['party'],
        players: Players.fromJson(json['party']),
        timeFarm: json['time_farm'],
        resources: List<Resource>.from(
            json['resources'].map((e) => Resource.fromJson(e))));
  }
}

class Players {
  final String player1;
  final String player2;
  final String player3;
  final String player4;

  const Players(
      {required this.player1,
      required this.player2,
      required this.player3,
      required this.player4});

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
        player1: json['player1'],
        player2: json['player2'],
        player3: json['player3'],
        player4: json['player4']);
  }
}

class Resource {
  final String name;
  final int player1;
  final int player2;
  final int player3;
  final int player4;
  final int total;
  final int resInTime;

  const Resource(
      {required this.name,
      required this.player1,
      required this.player2,
      required this.player3,
      required this.player4,
      required this.total,
      required this.resInTime});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
        name: json['name'],
        player1: json['player1'],
        player2: json['player2'],
        player3: json['player3'],
        player4: json['player4'],
        total: json['total'],
        resInTime: json['res_in_time']);
  }
}
