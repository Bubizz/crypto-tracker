import 'package:flutter/material.dart';
import 'package:track_crypto/data/models/coin.dart';

class CoinListTile extends StatelessWidget {
  Coin coin;
  String coinPosition;
  
  CoinListTile(this.coin, this.coinPosition);

  @override
  Widget build(BuildContext context) {
    bool isNegative = coin.display.usd.change24Hour[coin.display.usd.change24Hour.indexOf(' ') + 1] == '-';
    var coinName = coin.coinInfo.name;
    var imageUrl = 'https://cryptocompare.com${coin.coinInfo.imageUrl}';
    var priceGrow = isNegative ? coin.display.usd.change24Hour : '+ ${coin.display.usd.change24Hour}' ;
    var priceGrowPct = isNegative ? coin.display.usd.changepct24Hour : '+ ${coin.display.usd.changepct24Hour}' ;
    var currentPrice = coin.display.usd.price;

    
    
    
    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
      
        tileColor: const Color.fromARGB(255, 54, 60, 63),
        leading: Row(
          mainAxisSize : MainAxisSize.min,
          children: [
            Text(coinPosition, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 4,),
            Image.network(
              imageUrl,
              width: 35,
              height: 35,
            ),
          ],
        ),
        title: Column(
          children: [
            Text(
              coinName,
              style: const TextStyle(color: Colors.white),),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                currentPrice,
                style:
                    const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                          
                          ),
              ),
          ],
        ),
        trailing: 
          FractionallySizedBox(
          widthFactor: 2/5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              priceGrow,
              style:
                  TextStyle(color: isNegative ? Colors.red : Colors.green, fontWeight: FontWeight.w500),
            ),
            Text(
              '$priceGrowPct %',
              style: TextStyle(color: isNegative ? Colors.red : Colors.green, fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
