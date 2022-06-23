import 'package:flutter/material.dart';
import 'package:track_crypto/data/repositories/home_info_repo.dart';
import '../../data/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'topcurrencies_event.dart';
part 'topcurrencies_state.dart';


class TopcoinsBloc extends Bloc<TopCurrenciesEvent, TopcurrenciesState> {
  TopcoinsBloc() : super(const TopcurrenciesLoading(0, [])) {
    on<TopCurrenciesEvent>((event, emit) async {


      if(event is GetCurrencies)
      {
        emit(TopcurrenciesLoading(state.page, state.topcurrencies));

          try
          {

          final currencies = await HomeInfoRepo().getTopCurrencies(state.page);
          
          emit(TopcurrenciesLoaded(state.page + 1, state.topcurrencies + currencies, ));

          }
          catch(e)
          {
            emit(TopcurrenciesError(state.page, state.topcurrencies));
          }
          

      

        }
       
      }

    );
  }
}
