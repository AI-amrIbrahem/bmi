import 'package:bmi/business_logic/bmi_cubit.dart';
import 'package:bmi/resourses/app_assets.dart';
import 'package:bmi/resourses/app_colors.dart';
import 'package:bmi/resourses/app_size.dart';
import 'package:bmi/resourses/app_strings.dart';
import 'package:bmi/routes/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bProvide = BlocProvider.of<BmiCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(AppStrings.appBarTitle),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(

          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.pOutCard),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<BmiCubit, BmiState>(
                          buildWhen: (previous,
                              current) => current is ChangeState,
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: bProvide.select,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(AppAssets.male, height: 90),
                                    Text(AppStrings.male),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.borderRadiusCard),
                                    color: bProvide.isMale
                                        ? AppColors.select
                                        : AppColors.cardColor),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: BlocBuilder<BmiCubit, BmiState>(
                          buildWhen: (previous,
                              current) => current is ChangeState,
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: bProvide.select,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(AppAssets.female, height: 90),
                                    Text(AppStrings.feMale),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.borderRadiusCard),
                                    color: bProvide.isMale
                                        ? AppColors.cardColor
                                        : AppColors.select),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.pOutCard, right: AppPadding.pOutCard),
                child: Container(
                  padding: EdgeInsets.all(AppPadding.pCard),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(AppSize.borderRadiusCard),
                      color: AppColors.cardColor),
                  child: Column(
                    children: [
                      Text(AppStrings.height),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          BlocBuilder<BmiCubit, BmiState>(
                            buildWhen: (previous, current) =>
                            current is ChangeHeightState,
                            builder: (context, state) {
                              return Text(
                                bProvide.height.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppStrings.cm,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      BlocBuilder<BmiCubit, BmiState>(
                        buildWhen: (previous, current) =>
                        current is ChangeHeightState,
                        builder: (context, state) {
                          return Slider(
                            activeColor: AppColors.mainColor,
                              inactiveColor: AppColors.mainColor[100],
                              value: bProvide.height,
                              max: 220,
                              min: 80,
                              onChanged: (value) {
                                bProvide.changeHeight(value.round().toDouble());
                              });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.pOutCard),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.Age),


                              BlocBuilder<BmiCubit, BmiState>(
                                buildWhen: (previous,
                                    current) => current is ChangeAge,
                                builder: (context, state) {
                                  return Text("${bProvide.age.toInt()}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold));
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: AppColors.mainColor,
                                    onPressed: () {
                                      bProvide.changeAge(0);
                                    },
                                    child: Icon(Icons.add),
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: AppColors.mainColor,
                                    onPressed: () {
                                      bProvide.changeAge(1);
                                    },
                                    child: Icon(Icons.remove),
                                    mini: true,
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(AppSize.borderRadiusCard),
                              color: AppColors.cardColor),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.Weight),
                              BlocBuilder<BmiCubit, BmiState>(
                                buildWhen: (previous,
                                    current) => current is ChangeWeight,
                                builder: (context, state) {
                                  return Text("${bProvide.weight.toInt()}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold));
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: AppColors.mainColor,
                                    onPressed: () {
                                      bProvide.changeWeight(0);
                                    },
                                    child: Icon(Icons.add),
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: AppColors.mainColor,
                                    onPressed: () {
                                      bProvide.changeWeight(1);
                                    },
                                    child: Icon(Icons.remove,),
                                    mini: true,
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(AppSize.borderRadiusCard),
                              color: AppColors.cardColor),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 50,
              color: AppColors.backgroundColor,
              child: MaterialButton(
                color: AppColors.mainColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResultScreen(),));
                },
                child: Text(
                  AppStrings.buttonCalc,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
