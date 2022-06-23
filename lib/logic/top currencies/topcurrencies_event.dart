part of 'topcurrencies_bloc.dart';

@immutable
abstract class TopCurrenciesEvent {}

class GetCurrencies extends TopCurrenciesEvent {}

class ChangeDisplayedCurrency extends TopCurrenciesEvent {
  final String newDisplayedCurrency;
  ChangeDisplayedCurrency(this.newDisplayedCurrency);
}


