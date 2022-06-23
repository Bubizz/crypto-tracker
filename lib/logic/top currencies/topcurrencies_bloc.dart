import 'dart:async';

import 'package:flutter/material.dart';
import 'package:track_crypto/data/repositories/home_info_repo.dart';
import '../../data/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'topcurrencies_event.dart';
part 'topcurrencies_state.dart';


class TopcoinsBloc extends Bloc<TopCurrenciesEvent, TopcurrenciesState> {
  TopcoinsBloc() : super(const TopcurrenciesLoading(0, [], 'USD')) {
    on<TopCurrenciesEvent>((event, emit) async {


      if(event is GetCurrencies)
      {
        emit(TopcurrenciesLoading(state.page, state.topcurrencies, state.displayedCurrency));

          try
          {

          final currencies = await HomeInfoRepo().getTopCurrencies(state.page, state.displayedCurrency);
          
          emit(TopcurrenciesLoaded(state.page + 1, state.topcurrencies + currencies, state.displayedCurrency));

          }
          catch(e)
          {
            emit(TopcurrenciesError(state.page, state.topcurrencies, state.displayedCurrency));
          }
        }
        else if(event is ChangeDisplayedCurrency)
        {
          try
          {
          emit(TopcurrenciesLoaded(0, const [], state.displayedCurrency));

          print(event.newDisplayedCurrency);

          final currencies = await HomeInfoRepo().getTopCurrencies(state.page, event.newDisplayedCurrency);

          print(currencies[0].display.usd.changeday);

          emit(TopcurrenciesLoaded(state.page + 1, state.topcurrencies + currencies, state.displayedCurrency));

          print(state.displayedCurrency);


          }
          catch(e)
          {
            emit(TopcurrenciesError(state.page, state.topcurrencies, state.displayedCurrency));
          }
          






        }
       
      }

    );
  }
}
