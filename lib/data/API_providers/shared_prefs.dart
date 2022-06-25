import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs
{
  

  Future<List<String>> getFavouriteCoins() async
  {
    final prefs = await SharedPreferences.getInstance();

    final List<String> items = prefs.getStringList('favCoins') ?? [];

    return items;

  }


  void setFavouriteCoin(String coin) async
  {
    final prefs = await SharedPreferences.getInstance();

    final List<String> items = prefs.getStringList('favCoins') ?? [];

    items.add(coin);

    prefs.setStringList('favCoins', items);
  }

  void removeFavouriteCoin(String coin) async
  {
    final prefs = await SharedPreferences.getInstance();

    final List<String> items = prefs.getStringList('favCoins') ?? [];

    items.remove(coin);

    prefs.setStringList('favCoins', items);
  }

}