import 'package:bmi/business_logic/bmi_cubit.dart';
import 'package:bmi/resourses/app_assets.dart';
import 'package:bmi/resourses/app_colors.dart';
import 'package:bmi/resourses/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bProvide = BlocProvider.of<BmiCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(AppStrings.appBarResultTitle),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Lottie.asset(bProvide.isMale ? AppAssets.male:AppAssets.female),
                Text("Gender : ${bProvide.isMale?"Male":"Female"}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Text("Result : ${bProvide.result()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Text("Age : ${bProvide.age.round()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}
