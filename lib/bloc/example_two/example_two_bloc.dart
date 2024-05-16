import 'package:bloc_app/bloc/example_two/example_two_event.dart';
import 'package:bloc_app/bloc/example_two/example_two_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(const SwitchState()){
    on<EnableOrDisableSwitch>(_enableOrDisableSwitch);
  }

  void _enableOrDisableSwitch(EnableOrDisableSwitch event , Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}