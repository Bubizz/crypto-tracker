import 'dart:convert';
import 'package:track_crypto/data/models/chart_point.dart';

import '../API_providers/crypto_compare_api.dart';

class ChartRepo
{
   final api = CryptoCompareAPI();

  Future<List<ChartPoint>> getHourPrices() async
  {
   
    var list = <ChartPoint>[];

    final prices = await api.fetchHourPricePoints();
    
    final map = jsonDecode(prices) as Map<String,dynamic>;

    for(var a in map['Data']['Data'])
    {
      list.add(ChartPoint.fromJson(a));
    }

    return list;


  }







}