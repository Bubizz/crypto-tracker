import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:track_crypto/data/models/global_info.dart';
import 'package:track_crypto/data/repositories/general_info_repo.dart';
part 'globalinfo_event.dart';
part 'globalinfo_state.dart';

class GlobalinfoBloc extends Bloc<GlobalinfoEvent, GlobalinfoState> {
  GlobalinfoBloc() : super(GlobalInfoLoading()) 
  
  {
    on<GlobalinfoEvent>((event, emit) async {

      if(event is GetGlobalInfo)
      {
        emit(GlobalInfoLoading());

        final globalInfo = await HomeInfoRepo().getGlobalInfo();

        

        emit(GlobalInfoLoaded(globalInfo));

        
      }

   
      
    });
  }

  
}
