part of 'topcurrencies_bloc.dart';

@immutable
abstract class TopcurrenciesState {

  const TopcurrenciesState(this.page);

  final int page;
}

class TopcurrenciesError extends TopcurrenciesState 
{
  const TopcurrenciesError(int page) : super(page);
}

class TopcurrenciesLoading extends TopcurrenciesState {
  const TopcurrenciesLoading(int page) : super(page);
}


class TopcurrenciesLoaded extends TopcurrenciesState
{
  
  final List<Coin> topcurrencies;

  const TopcurrenciesLoaded(this.topcurrencies, int page) : super(page);
}


