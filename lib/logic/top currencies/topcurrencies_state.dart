part of 'topcurrencies_bloc.dart';

@immutable
abstract class TopcurrenciesState {

  const TopcurrenciesState(this.page, this.topcurrencies, this.displayedCurrency );

  final int page;
  final List<Coin> topcurrencies;
  final String displayedCurrency;
}

class TopcurrenciesError extends TopcurrenciesState 
{
  const TopcurrenciesError(int page, List<Coin> list, String displayedCurrency ) : super(page, list, displayedCurrency);
}

class TopcurrenciesLoading extends TopcurrenciesState {

  const TopcurrenciesLoading(int page, List<Coin> list, String displayedCurrency ) : super(page, list, displayedCurrency);
}


class TopcurrenciesLoaded extends TopcurrenciesState
{
  const TopcurrenciesLoaded(int page, List<Coin> list, String displayedCurrency) : super(page, list, displayedCurrency);
}


