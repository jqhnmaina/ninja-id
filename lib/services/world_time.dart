import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; //time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint
  bool isDaytime; // true if daytime otherwise false

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    var req = Uri.https('worldtimeapi.org', '/api/timezone/$url');

    // Await the http get response, then decode the json-formatted response.
    Response response = await get(req);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create date time
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20  ? true : false;

      // set the time property
      time = DateFormat.jm().format(now);
    } else {
      print('Request Failed with status code: ${response.statusCode}');
    }
  }
}

WorldTime instance = WorldTime(
    location: "Africa Nairobi", url: 'Africa/Nairobi', flag: 'kenya.png');
