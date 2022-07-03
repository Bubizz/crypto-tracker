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
      if(event is GetData)
      {
        try
        {
          var chartData = await ChartRepo().getHourPrices(event.coinCode, event.days);

          var prices = chartData.map((e) => e.open.toDouble()).toList();
      
          var time = chartData.map((e) => e.time.toDouble()).toList();

          emit(ChartState(points: chartData, minX: time.reduce((value, element) => min(value, element)), maxX: time.reduce((value, element) => max(value, element)), minY: prices.reduce((value, element) => min(value, element)), maxY: prices.reduce((value, element) => max(value, element))));

        }
        catch(e)
        {
          emit(ChartState(points: [], minX: 0, maxX: 0, minY: 0, maxY: 0));
        }
      
      }
    });
  }
}
