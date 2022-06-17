import 'package:flutter/material.dart';
import 'package:track_crypto/ui/widgets/custom_tab_bar.dart';

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
    );
  }
}
