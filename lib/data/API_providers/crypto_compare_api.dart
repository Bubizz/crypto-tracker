import '../../apikeys/apikeys.dart';
import 'package:http/http.dart' as http;

class CryptoCompareAPI
{
  static const String cryptoCompareBaseURL = 'https://min-api.cryptocompare.com/data';

 Future fetchTopCurrencies(int page) async
  {
    var url = Uri.parse('$cryptoCompareBaseURL/top/mktcapfull?limit=20&tsym=USD&page=$page');

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



