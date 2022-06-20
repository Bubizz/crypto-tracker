part of 'globalinfo_bloc.dart';


@immutable
abstract class GlobalinfoState {}

class GlobalInfoLoading extends GlobalinfoState {}

class GlobalInfoLoaded extends GlobalinfoState {
  final GlobalInfo info;

  GlobalInfoLoaded(this.info);


}
