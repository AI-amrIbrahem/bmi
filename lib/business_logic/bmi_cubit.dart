import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  var isMale = true;

  var height = 180.0;

  var weight = 40.0;

  double age =30;

  int result(){
    return (weight/pow(height/100,2)).round();
  }

  void select() {
    if (isMale == true)
      isMale = false;
    else
      isMale = true;
    emit(ChangeState());
  }

  void changeHeight(h){
    height = h;
      emit(ChangeHeightState());
  }

  void changeAge(type){
    if(type==0){
      age ++;
    }else{
      age--;
    }
    emit(ChangeAge());
  }

  void changeWeight(type){
    if(type==0){
      weight ++;
    }else{
      weight--;
    }
    emit(ChangeWeight());
  }

}
