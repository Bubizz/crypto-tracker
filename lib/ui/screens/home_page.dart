import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_crypto/data/models/coin.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';
import '../../logic/bloc/globalinfo_bloc.dart';
import '../../logic/top%20currencies/topcurrencies_bloc.dart';
import '../../ui/widgets/coin_list_tile.dart';
import '../../ui/widgets/custom_tab_bar.dart';
import '../widgets/home_page_screen/global_info_section.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  var _items = <Coin>[];

  void _fetchdata(BuildContext context) {
    BlocProvider.of<TopcoinsBloc>(context).add(GetCurrencies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GlobalinfoBloc()..add(GetGlobalInfo()),
            ),
            BlocProvider(
              create: (context) => TopcoinsBloc()..add(GetCurrencies()),
            ),
          ],
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                CustomTabBar(tabs: const [
                  Tab(
                    text: 'Markets',
                  ),
                  Tab(
                    text: 'Watchlist',
                  ),
                ]),
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        Container(
                            color: const Color.fromARGB(255, 34, 32, 32),
                            width: double.infinity,
                            child: const GlobalInfoSectionTab()),
                        Expanded(
                          child: BlocBuilder<TopcoinsBloc, TopcurrenciesState>(
                            builder: (context, state) {       
                              if (state is TopcurrenciesLoaded || state is TopcurrenciesLoading) {
                                _items = state.topcurrencies;
                                return InfiniteList(
                                    isLoading: state is TopcurrenciesLoading,
                                    itemCount: _items.length,
                                    onFetchData: () => _fetchdata(context),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          CoinListTile(
                                              _items[index], '${(index + 1)} .'),
                                          const SizedBox(
                                            height: 4,
                                          )
                                        ],
                                      );
                                    });
                              } 
                              else {
                                return Center(child: Column(
                                  children: [
                                    Image.asset('assets/cloud.png',
                                    color: Colors.white, ),
                                    TextButton(onPressed: () {
                                      BlocProvider.of<TopcoinsBloc>(context).add(GetCurrencies()); 
                                      BlocProvider.of<GlobalinfoBloc>(context).add(GetGlobalInfo());}, 
                                      child: Row(
                                      mainAxisAlignment : MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.refresh),
                                        Text('Something went wrong', style: TextStyle(color: Colors.white),),
                                      ],
                                    ))
                                  ],

                                ),);
                                
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.redAccent,
                      width: double.infinity,
                      height: 20,
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
