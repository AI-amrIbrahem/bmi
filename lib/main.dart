import 'package:bmi/business_logic/bmi_cubit.dart';
import 'package:bmi/routes/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BmiScreen(),
      ),
    );
  }
}
