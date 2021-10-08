import 'package:flutter/material.dart';
class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('timer',style: TextStyle(color: Colors.white,fontSize: 30),),

    );
  }
}
