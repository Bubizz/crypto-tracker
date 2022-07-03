part of 'chart_bloc.dart';

@immutable
abstract class ChartEvent {}

class GetData extends ChartEvent
{
  String coinCode;
  int days;

  GetData(this.coinCode, this.days);
}


