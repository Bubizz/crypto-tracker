import 'package:flutter/material.dart';
import 'package:track_crypto/data/repositories/home_info_repo.dart';
import '../../data/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'topcurrencies_event.dart';
part 'topcurrencies_state.dart';


class TopcoinsBloc extends Bloc<TopCurrenciesEvent, TopcurrenciesState> {
  TopcoinsBloc() : super(const TopcurrenciesLoading(0)) {
    on<TopCurrenciesEvent>((event, emit) async {


      if(event is GetCurrencies)
      {
        emit(TopcurrenciesLoading(state.page));

        try
        {
          print("www");
          final currencies = await HomeInfoRepo().getTopCurrencies(state.page);
          print(currencies.toString() + "rrrrrrrrrrrrrrrrrrrrrrrrr");
          emit(TopcurrenciesLoaded(currencies, state.page + 1));


        }
        catch(e)
        {
          print("error");
          emit(TopcurrenciesError(state.page));
        }
        
      }

    });
  }
}
