import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //ui only
  String time = '';
  String flag = '';
  String url = '';
  bool isDaytime = true;

  WorldTime({required this.location,  required this.flag, required this.url});

  Future<void> getTime() async {

    Response response = await get(Uri(
        scheme: 'http',
        host: 'worldtimeapi.org',
        path: 'api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour > 6 && now.hour < 20  ? true : false;
    time = DateFormat.jm().format(now);
  }
}