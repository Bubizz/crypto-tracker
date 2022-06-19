import 'package:track_crypto/data/API_providers/crypto_compare_api.dart';
import '../models/current_trading_info.dart';
import '../models/global_info.dart';
import '../API_providers/binance_api.dart';

class MainInfoRepo
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

  Future<CurrentTradingInfo> getTopCurrencies(int page) async 
  {
    try
    {
      var rawData = await cryptoApi.fetchTopCurrencies(page);

      return CurrentTradingInfo.fromJson(rawData);
    }
    catch(e)
    {
      rethrow;
    }

  }

}