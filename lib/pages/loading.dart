import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Africa Nairobi", url: 'Africa/Nairobi', flag: 'kenya.png');
    await instance.getTime();

    setState(() {
      if (instance.time != null) {
        time = instance.time;

        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'time': instance.time,
          'location': instance.location,
          'flag': instance.flag
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      )),
    );
  }
}
