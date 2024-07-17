// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    data = (data?.isEmpty ?? true) ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String bgImage = data?['isDayTime']? 'day.jpg' : 'night.png'; //day.jpg or night.jpg
    Color? bgColor = data?['isDayTime']? Colors.blue : Colors.indigo; //blue or indigo




    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
              ),
              ),
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag': result['flag']
                    };
                });
              },
              icon: Icon(Icons.edit_location),
              label: Text('Change Location'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data?['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              data?['time'],
              style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
      ),
    );
  }
}
