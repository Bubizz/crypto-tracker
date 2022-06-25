part of 'home_screen_controls_bloc.dart';

enum TopListBy
{
  marketCap,
  volume
}

class HomeScreenListControlsState 
{
  final String displayedCurrency;
  final TopListBy topListBy;

  HomeScreenListControlsState(this.displayedCurrency, this.topListBy);
}

