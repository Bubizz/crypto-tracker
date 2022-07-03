import 'package:fl_chart/fl_chart.dart';
import '../../logic/chart/chart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/line_chart.dart';

class ChartDetailPage extends StatelessWidget {
  ChartDetailPage({Key? key, required this.imageUrl, required this.coinName}) : super(key: key);
  String imageUrl;
  String coinName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ChartBloc()..add(GetData(coinName, 96)),
        child: Scaffold(
          appBar: AppBar(backgroundColor: Color.fromARGB(251, 59, 59, 59),),
          backgroundColor: const Color.fromARGB(255, 34, 32, 32),
          body: Column(
            children: [
              Image.network(imageUrl, width: 60, height: 60,),
              Text(coinName, style: const TextStyle(color: Colors.white)),
              BlocBuilder<ChartBloc, ChartState>(
                builder: (context, state) 
                {
                  if(state.points.isEmpty)
                  {
                    return Center(
                      child: Column(
                        children: const [
                          Text("Oooops", style: TextStyle(fontSize: 24, color: Colors.red),),
                          Text("We couldn't get the data you asked for", style: TextStyle(fontSize: 19, color: Colors.white),)
                        ],
                      ),
                    );
                  }
                  return MyChart(Colors.pink, state.points.map((e) => FlSpot(e.time.toDouble(), e.open)).toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
