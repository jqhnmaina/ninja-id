import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getDate() async {

    // simulate a network request
    await Future.delayed(Duration(seconds: 3), () {
      print('yoshi');
    });

    // simulate a network request to get bio of the username
    Future.delayed(Duration(seconds: 2), () {
      print('vega, musician & egg collector');
    });

    print('Statement');
  }

  @override
  void initState() {
    super.initState();

    getDate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text(' Choose location screen'),
    );
  }
}
