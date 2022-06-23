part of 'topcurrencies_bloc.dart';

@immutable
abstract class TopcurrenciesState {

  const TopcurrenciesState(this.page, this.topcurrencies);

  final int page;
  final List<Coin> topcurrencies;
}

class TopcurrenciesError extends TopcurrenciesState 
{
  const TopcurrenciesError(int page, List<Coin> list ) : super(page, list);
}

class TopcurrenciesLoading extends TopcurrenciesState {

  const TopcurrenciesLoading(int page, List<Coin> list ) : super(page, list);
}


class TopcurrenciesLoaded extends TopcurrenciesState
{
  const TopcurrenciesLoaded(int page, List<Coin> list) : super(page, list);
}


