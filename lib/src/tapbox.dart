import 'dart:math';
import 'package:flutter/material.dart';

class Tapbox extends StatefulWidget {
  @override
  _TapboxState createState() => _TapboxState();
}

class _TapboxState extends State<Tapbox> {
  bool _active = false;
  Random _rand = Random(DateTime.now().millisecondsSinceEpoch.toInt());
  int _val = 400;

  void _tap() {
    setState(() {
      _active = !_active;
      _val = (_rand.nextInt(900) ~/ 100) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TapBox'),
      ),
      body: GestureDetector(
        onTap: _tap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple[_val],
            // color: _active ? Colors.purple[_val] : Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
