import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_crypto/data/models/coin.dart';
import 'package:track_crypto/logic/home%20list%20controls/home_screen_controls_bloc.dart';
import 'package:track_crypto/ui/screens/watchlist.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';
import '../../logic/home list controls/home_screen_controls_bloc.dart';
import '../../logic/globalinfo/globalinfo_bloc.dart';
import '../../logic/top%20currencies/topcurrencies_bloc.dart';
import '../../ui/widgets/coin_list_tile.dart';
import '../../ui/widgets/custom_tab_bar.dart';
import '../widgets/home_page_screen/global_info_section.dart';
import '../../logic/favourite /preferences_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var _items = <Coin>[];
  TopListBy dropdownValue = TopListBy.marketCap;
  String displayedCurrency = 'USD';

  void _fetchdata(BuildContext context) {
    BlocProvider.of<TopcoinsBloc>(context).add(GetCurrencies());
  }

  Widget _buildErrorUI(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/cloud.png',
            color: Colors.white,
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<TopcoinsBloc>(context).add(GetCurrencies());
                BlocProvider.of<GlobalinfoBloc>(context).add(GetGlobalInfo());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.refresh),
                  Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildDropDown(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return DropdownButton<TopListBy>(
            value: dropdownValue,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
            underline: Container(
              height: 0.5,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue!;
                BlocProvider.of<HomeScreenListControlsBloc>(context)
                    .add(ChangeListData(newValue));
              });
            },
            items: const [
              DropdownMenuItem(
                  value: TopListBy.volume, child: Text('24h Volume')),
              DropdownMenuItem(
                  value: TopListBy.marketCap, child: Text('Market Cap'))
            ]);
      },
    );
  }

  Widget _changeCurrencyDropDown(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return DropdownButton<String>(
            value: displayedCurrency,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
            underline: Container(
              height: 0.5,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              if (displayedCurrency != newValue) {
                setState(() {
                  displayedCurrency = newValue!;
                  BlocProvider.of<HomeScreenListControlsBloc>(context)
                      .add(ChangeDisplayedCurrency(displayedCurrency));
                });
              }
            },
            items: const [
              DropdownMenuItem(value: 'PLN', child: Text('PLN')),
              DropdownMenuItem(value: 'GBP', child: Text('GBP')),
              DropdownMenuItem(value: 'CNY', child: Text('CNY')),
              DropdownMenuItem(value: 'USD', child: Text('USD')),
              DropdownMenuItem(value: 'EUR', child: Text('EUR')),
              DropdownMenuItem(value: 'BTC', child: Text('BTC')),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PreferencesBloc(),
            ),
            BlocProvider(
              create: (context) => GlobalinfoBloc()..add(GetGlobalInfo()),
            ),
            BlocProvider(create: (context) => HomeScreenListControlsBloc()),

            BlocProvider(
                create: (context) => TopcoinsBloc(
                    BlocProvider.of<HomeScreenListControlsBloc>(context))
                  ..add(GetCurrencies())),
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.28,
                          color: const Color.fromARGB(255, 34, 32, 32),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Toplist by ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                _buildDropDown(context),
                                const Text(
                                  'Displayed Currency',
                                  style: TextStyle(color: Colors.white),
                                ),
                                _changeCurrencyDropDown(context)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<TopcoinsBloc, TopcurrenciesState>(
                            builder: (context, state) {
                              if (state is TopcurrenciesLoaded ||
                                  state is TopcurrenciesLoading) {
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
                                          CoinListTile(_items[index],
                                              '${(index + 1)} .'),
                                          const SizedBox(
                                            height: 4,
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                return _buildErrorUI(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                   const Watchlist()
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
