import 'dart:convert';

import 'package:track_crypto/data/API_providers/crypto_compare_api.dart';
import '../models/coin.dart';
import '../models/global_info.dart';
import '../API_providers/binance_api.dart';

class HomeInfoRepo
{
  var binanceApi  = BinanceAPI();

  var cryptoApi = CryptoCompareAPI();

  Future<GlobalInfo> getGlobalInfo() async 
  {
    try
    {
      var rawData = await binanceApi.fetchGlobalInfo();

      return globalInfoFromJson(rawData);
    }
    catch(e)
    {
      rethrow;
    }

  }

  Future<List<Coin>> getTopCurrencies(int page, String currencyIso) async 
  {
    var list = <Coin>[];
      try
      {
        var rawData = await cryptoApi.fetchTopCurrencies(page, currencyIso);  

      var mapFromRawData = jsonDecode(rawData) as Map<String, dynamic>;

      for(var coin in mapFromRawData["Data"])
      {
        if((coin as Map<String,dynamic>).containsKey("DISPLAY"))
        {
           list.add(Coin.fromJson(coin, currencyIso));
        }
        
      }

      }
      catch(e)
      {
        rethrow;
      }
    
    return list;
  }

  Future<List<Coin>> getTopCurrenciesByVolume(int page, String currencyIso) async 
  {
    var list = <Coin>[];
      try
      {
        var rawData = await cryptoApi.fetchTopCurrenciesBy24hVolume(page, currencyIso);  

        var mapFromRawData = jsonDecode(rawData) as Map<String, dynamic>;

      for(var coin in mapFromRawData["Data"])
      {
        if((coin as Map<String,dynamic>).containsKey("DISPLAY"))
        {
           list.add(Coin.fromJson(coin, currencyIso));
        }
        
      }

      }
      catch(e)
      {
        rethrow;
      }
    
    return list;
  }

}