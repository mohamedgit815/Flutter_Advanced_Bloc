import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit_app/state.dart';

class CounterCubit extends Cubit<MainCounterState> {
  CounterCubit() : super(CounterState());

  int counter = 0;

  static CounterCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int increment() {
     emit(InitCounter());
     return counter++;
  }

   int decrement() {
     emit(DecrementCounter());
     return counter--;
  }

}