import 'package:flutter/material.dart';
import '../../data/repositories/home_info_repo.dart';
import '../home list controls/home_screen_controls_bloc.dart';
import '../../data/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'topcurrencies_event.dart';
part 'topcurrencies_state.dart';

class TopcoinsBloc extends Bloc<TopCurrenciesEvent, TopcurrenciesState> {
  final HomeScreenListControlsBloc homeScreenListControlsBloc;

  TopcoinsBloc(this.homeScreenListControlsBloc)
      : super(const TopcurrenciesLoading(0, [])) {
    homeScreenListControlsBloc.stream
        .listen((HomeScreenListControlsState event) 
      {

        emit(const TopcurrenciesLoading(0, []));

        add(GetCurrencies());
    });

    on<TopCurrenciesEvent>((event, emit) async {
      if (event is GetCurrencies) 
      {

        emit(TopcurrenciesLoading(state.page, state.topcurrencies));

        try 
        {

          if (homeScreenListControlsBloc.state.topListBy == TopListBy.marketCap)
          {

            final coins = await HomeInfoRepo().getTopCurrencies( state.page, homeScreenListControlsBloc.state.displayedCurrency);

            emit(TopcurrenciesLoaded(state.page + 1, state.topcurrencies + coins));

          } else if(homeScreenListControlsBloc.state.topListBy == TopListBy.volume)
          {

            final coins = await HomeInfoRepo().getTopCurrenciesByVolume(state.page, homeScreenListControlsBloc.state.displayedCurrency);

            emit(TopcurrenciesLoaded(state.page + 1, state.topcurrencies + coins));

          }
        } 
        catch (e) 
        {

          emit(TopcurrenciesError(state.page, state.topcurrencies));
        }
      } 
    });
  }
}
