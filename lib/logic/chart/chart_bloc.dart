import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';
import 'package:track_crypto/data/repositories/chart_repo.dart';
import '../../data/models/chart_point.dart';
part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super((ChartState(points: [], minX: 0, maxX: 5, minY: 0, maxY: 0))) {

    on<ChartEvent>((event, emit) async {
      if(event is GetWeekData)
      {
        var chartData = await ChartRepo().getHourPrices();

        var lowestPrices = <double>[];
        var highiestPrices = <double>[];

        chartData.forEach((element) { 
          lowestPrices.add(element.low);
        });

        chartData.forEach((element) { 
          highiestPrices.add(element.high);
        });

        emit(ChartState(points: chartData, minX: 0, maxX: 5, minY: lowestPrices.reduce((value, element) => min(value, element)), maxY: highiestPrices.reduce((value, element) => max(value, element))));
      }
    });
  }
}
