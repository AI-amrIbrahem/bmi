part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}
class ChangeState extends BmiState {}
class ChangeHeightState extends BmiState {}
class ChangeAge extends BmiState {}
class ChangeWeight extends BmiState {}


