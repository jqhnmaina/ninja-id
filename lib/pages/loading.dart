import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  Widget loader = SpinKitFadingCube(
    color: Colors.white,
    size: 50.0,
  );

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
          'flag': instance.flag,
          'isDaytime': instance.isDaytime
        });
      } else {
        setState(() {
          loader = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Failed to load time data',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, letterSpacing: 1)),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    loader = SpinKitFadingCube(
                      color: Colors.white,
                      size: 50.0,
                    );
                  });

                  // try fetching world time again using recursion
                  setUpWorldTime();
                },
                icon: Icon(
                  Icons.refresh_outlined,
                  color: Colors.grey[300],
                ),
                label: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
            ],
          );
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
      backgroundColor: Colors.blue[900],
      body: Center(child: loader),
    );
  }
}
