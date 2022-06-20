import '../../apikeys/apikeys.dart';
import 'package:http/http.dart' as http;

class BinanceAPI
{
  static const String binanceBaseURL = 'https://pro-api.coinmarketcap.com';

  Future<String> fetchGlobalInfo() async
  {
  
     var url = Uri.parse('$binanceBaseURL/v1/global-metrics/quotes/latest');

     var data = await http.get(url, headers: {'X-CMC_PRO_API_KEY' : APIKEYS.coinMarketcapAPIkey } );

     if(data.statusCode == 200)
     {
       return data.body;
     }
     else
     {
       throw Exception("${data.statusCode}");
     }

  }

  

}