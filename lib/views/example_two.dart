import 'package:bloc_app/bloc/example_two/example_two_bloc.dart';
import 'package:bloc_app/bloc/example_two/example_two_event.dart';
import 'package:bloc_app/bloc/example_two/example_two_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<SwitchBloc,SwitchState>(builder:(context, state) {
            return Switch(value: state.isSwitch, onChanged: (newValue) {
              context.read<SwitchBloc>().add(EnableOrDisableSwitch());
            });
          },),
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
