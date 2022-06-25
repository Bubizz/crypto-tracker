part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesEvent {
  final String coinCode;
  PreferencesEvent(this.coinCode);
}

class AddCoinToFav extends PreferencesEvent
{
  AddCoinToFav(String coinCode) : super(coinCode);


}

class RemoveCoinFromFav extends PreferencesEvent
{
  RemoveCoinFromFav(String coinCode) : super(coinCode);
  
}
