import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_crypto/logic/bloc/globalinfo_bloc.dart';
import 'package:track_crypto/logic/top%20currencies/topcurrencies_bloc.dart';
import 'package:track_crypto/ui/widgets/custom_tab_bar.dart';
import '../widgets/home_page_screen/global_info_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                              if(state is TopcurrenciesLoaded)
                              {
                                var list = state.topcurrencies;

                                return ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                  return Image.network('https://cryptocompare.com${list[index].coinInfo.imageUrl}');
                                });
                              }
                              else
                              {
                              return const CircularProgressIndicator();
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
