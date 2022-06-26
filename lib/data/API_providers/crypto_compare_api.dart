import '../../apikeys/apikeys.dart';
import 'package:http/http.dart' as http;

class CryptoCompareAPI
{
  static const String cryptoCompareBaseURL = 'https://min-api.cryptocompare.com/data';

 Future fetchTopCurrencies(int page, String currencyIso) async
  {
    var url = Uri.parse('$cryptoCompareBaseURL/top/mktcapfull?limit=20&tsym=$currencyIso&page=$page');

    var data = await http.get(url, headers: {'authorization': 'Apikey ${APIKEYS.cryptoCompareAPIkey}'});


     if(data.statusCode == 200)
     {
       return data.body;
     }
     else
     {
       throw Exception("${data.statusCode}");
     }

  }

  Future fetchTopCurrenciesBy24hVolume(int page, String currencyIso) async
  {
    var url = Uri.parse('$cryptoCompareBaseURL/top/totalvolfull?limit=20&tsym=$currencyIso&page=$page');

    var data = await http.get(url, headers: {'authorization': 'Apikey ${APIKEYS.cryptoCompareAPIkey}'});


     if(data.statusCode == 200)
     {
       return data.body;
     }
     else
     {
       throw Exception("${data.statusCode}");
     }

  }

  Future fetchHourPricePoints() async
  {
    var url = Uri.parse('https://min-api.cryptocompare.com/data/v2/histohour?fsym=BTC&tsym=USD&limit=120');

    var data = await http.get(url, headers: {'authorization': 'Apikey ${APIKEYS.cryptoCompareAPIkey}'});

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





