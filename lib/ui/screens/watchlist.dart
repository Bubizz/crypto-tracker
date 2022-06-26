import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_crypto/logic/top%20currencies/topcurrencies_bloc.dart';
import 'package:track_crypto/ui/widgets/coin_list_tile.dart';
import '../../logic/favourite /preferences_bloc.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {

        var favCoinsCodes = BlocProvider.of<PreferencesBloc>(context).state.favCoins;

        var favCoins = BlocProvider.of<TopcoinsBloc>(context).state.topcurrencies.where((element) => favCoinsCodes.contains(element.coinInfo.name)).toList();
        
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 34, 32, 32),
            body: ListView.builder(
                itemCount: favCoins.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      CoinListTile(favCoins[index], (index + 1).toString()),
                      const SizedBox(
                        height: 4,
                      )
                    ],
                  );
                }));
      },
    );
  }
}
