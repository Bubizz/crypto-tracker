import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/bloc/globalinfo_bloc.dart';

class GlobalInfoSectionTab extends StatelessWidget {
  const GlobalInfoSectionTab({Key? key}) : super(key: key);

  Widget _buildTile(String title,double data,double percantage, BuildContext context) 
  {
    bool hasGrown = percantage >= 0;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, 
                colors: hasGrown ? 
                [
                Color.fromARGB(255, 94, 181, 97).withOpacity(.8),
                Color.fromARGB(255, 139, 199, 142)
                ] : 
                [
                Color.fromARGB(255, 235, 20, 20).withOpacity(.8),
                Color.fromARGB(255, 243, 52, 52).withOpacity(.75),
                Color.fromARGB(255, 211, 83, 83)
                
                ])
            ) 
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 15 ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(kmbFormatGenerator(data), style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600) , ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                '${percantage.toStringAsFixed(2)} %', style: TextStyle(fontSize: 15, color: hasGrown ? Colors.green : Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalinfoBloc, GlobalinfoState>(
      builder: (context, state) {
        if (state is GlobalInfoLoaded) {
          return Row(
            children: [
              Expanded(flex: 1, child: _buildTile("24h Volume", state.info.totalVolume24H, state.info.totalVolume24HYesterdayPercentageChange, context)),
              Expanded(flex: 1, child: _buildTile("Market Cap", state.info.totalMarketCap, state.info.totalMarketCapYesterdayPercentageChange, context)),
              Expanded(flex: 1, child: _buildTile("BTC Dominance", state.info.btcDominance, state.info.btcDominance24HPercentageChange, context)),
            ],
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: Row(
              children: const [
                Expanded(flex: 1, child: CircularProgressIndicator()),
                Expanded(flex: 1, child: CircularProgressIndicator()),
                Expanded(flex: 1, child: CircularProgressIndicator()),
              ],
            ),
          );
        }
      },
    );
  }
}

String kmbFormatGenerator(double num) {
  if(num <= 100)
  {
    return "${(num).toStringAsFixed(2)} %";
  }
  if (num > 999 && num < 99999) {
    return "\$${(num / 1000).toStringAsFixed(2)} K";
  } else if (num > 99999 && num < 999999) {
    return "\$${(num / 1000).toStringAsFixed(0)} K";
  } else if (num > 999999 && num < 999999999) {
    return "\$${(num / 1000000).toStringAsFixed(2)} M";
  } else if (num > 999999999) {
    return "\$${(num / 1000000000).toStringAsFixed(2)} B";
  } else {
    return num.toString();
  }
}
