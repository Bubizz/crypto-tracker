part of 'home_screen_controls_bloc.dart';

@immutable
abstract class HomeScreenListControlsEvent {
  final String? newDisplayedCurrency;
  final TopListBy? topListBy;
  const HomeScreenListControlsEvent({this.newDisplayedCurrency, this.topListBy});
}

class ChangeDisplayedCurrency extends HomeScreenListControlsEvent
{ 
  const ChangeDisplayedCurrency(String newDisplayedCurrency) : super(newDisplayedCurrency: newDisplayedCurrency);
}

class ChangeListData extends HomeScreenListControlsEvent
{
  const ChangeListData(TopListBy topListBy) : super(topListBy: topListBy );
}
