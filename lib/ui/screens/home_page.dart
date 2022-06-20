import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_crypto/logic/bloc/globalinfo_bloc.dart';
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
      body: SafeArea(
        child:
         BlocProvider(      
        create: (context) => GlobalinfoBloc()..add(GetGlobalInfo()),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
             CustomTabBar(tabs: const  [
               Tab(text: 'Markets',),
               Tab(text: 'Watchlist',),
             ]
             ),
            Expanded(
                child: TabBarView(children: [
                  Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 20,
                    child: const GlobalInfoSectionTab()),
                  
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
