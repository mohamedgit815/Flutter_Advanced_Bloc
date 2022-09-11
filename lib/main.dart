import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit_app/cubit.dart';
import 'package:flutter_counter_cubit_app/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (context)=> CounterCubit() ,
        child: BlocConsumer<CounterCubit , MainCounterState>(
          builder:(BuildContext context,MainCounterState state)=> Column(
            children: [
               Center(
                child: Text(CounterCubit.get(context).counter.toString()),
              ),

              MaterialButton(onPressed: () {
                CounterCubit.get(context).increment();
              },child: const Text("Increment"),),
              MaterialButton(onPressed: () {
                CounterCubit.get(context).decrement();
              },child: const Text("decrement"),),
            ],
          ), listener: (BuildContext context, MainCounterState state) {},
        ),
      ),
    );
  }
}

