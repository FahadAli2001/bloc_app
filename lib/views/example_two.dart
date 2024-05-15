import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Switch(value: true, onChanged: (newValue) {}),
          Container(
            width: 400,
            height: 200,
            color: Colors.red.withOpacity(.2),
          ),
          Slider(value: 5, onChanged: (val) {})
        ],
      ),
    );
  }
}
