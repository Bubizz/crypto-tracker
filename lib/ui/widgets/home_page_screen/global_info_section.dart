import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/bloc/globalinfo_bloc.dart';

class GlobalInfoSectionTab extends StatelessWidget {
  const GlobalInfoSectionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalinfoBloc, GlobalinfoState>(
      builder: (context, state) {
        if (state is GlobalInfoLoaded) {
          return SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: 
                      Column(
                        children: [
                          const Text("Volume"),
                          Text(state.info.totalVolume24H.toString())
                        ],
                      ),
                    ),
                    Expanded(
                    flex: 1,
                    child: 
                      Column(
                        children: [
                          const Text("Market Cap"),
                          Text(state.info.totalMarketCap.toString())
                        ],
                      ),
                    ),
                    Expanded(
                    flex: 1,
                    child: 
                      Column(
                        children: [
                          const Text("Volume"),
                          Text(state.info.btcDominance.toString())
                        ],
                      ),
                    ),
              ],
            ),
          );
        } else {
          return const SizedBox(child: CircularProgressIndicator());
        }
      },
    );
  }
}
//Text("Market Cap"),
             // Text("BTC dominance"),