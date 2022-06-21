
import 'dart:convert';

Coin coinFromJson(Map<String, dynamic> str) => Coin.fromJson(str);

String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
    Coin({
        required this.coinInfo,
        required this.display,
    });

    CoinInfo coinInfo;
    Display display;

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        coinInfo: CoinInfo.fromJson(json["CoinInfo"]),
        display: Display.fromJson(json["DISPLAY"]),
    );

    Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo.toJson(),
        "DISPLAY": display.toJson(),
    };
}

class CoinInfo {
    CoinInfo({
        required this.id,
        required this.name,
        required this.fullName,
        required this.internal,
        required this.imageUrl,
        required this.url,
    });

    String id;
    String name;
    String fullName;
    String internal;
    String imageUrl;
    String url;
   
    factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"],
        name: json["Name"],
        fullName: json["FullName"],
        internal: json["Internal"],
        imageUrl: json["ImageUrl"],
        url: json["Url"],
      
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "FullName": fullName,
        "Internal": internal,
        "ImageUrl": imageUrl,
        "Url": url,
    };
}



class Display {
    Display({
        required this.usd,
    });

    DisplayUsd usd;

    factory Display.fromJson(Map<String, dynamic> json) => Display(
        usd: DisplayUsd.fromJson(json["USD"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
    };
}

class DisplayUsd {
    DisplayUsd({
        required this.fromsymbol,
        required this.tosymbol,
        required this.market,
        required this.price,
        required this.lastupdate,
        required this.lastvolume,
        required this.lastvolumeto,
        required this.lasttradeid,
        required this.volumeday,
        required this.volumedayto,
        required this.volume24Hour,
        required this.volume24Hourto,
        required this.openday,
        required this.highday,
        required this.lowday,
        required this.open24Hour,
        required this.high24Hour,
        required this.low24Hour,
        required this.lastmarket,
        required this.volumehour,
        required this.volumehourto,
        required this.openhour,
        required this.highhour,
        required this.lowhour,
        required this.toptiervolume24Hour,
        required this.toptiervolume24Hourto,
        required this.change24Hour,
        required this.changepct24Hour,
        required this.changeday,
        required this.changepctday,
      
    });

    String fromsymbol;
    String tosymbol;
    String market;
    String price;
    String lastupdate;
    String lastvolume;
    String lastvolumeto;
    String lasttradeid;
    String volumeday;
    String volumedayto;
    String volume24Hour;
    String volume24Hourto;
    String openday;
    String highday;
    String lowday;
    String open24Hour;
    String high24Hour;
    String low24Hour;
    String lastmarket;
    String volumehour;
    String volumehourto;
    String openhour;
    String highhour;
    String lowhour;
    String toptiervolume24Hour;
    String toptiervolume24Hourto;
    String change24Hour;
    String changepct24Hour;
    String changeday;
    String changepctday;
   

    factory DisplayUsd.fromJson(Map<String, dynamic> json) => DisplayUsd(
        fromsymbol: json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"],
        market: json["MARKET"],
        price: json["PRICE"],
        lastupdate: json["LASTUPDATE"],
        lastvolume: json["LASTVOLUME"],
        lastvolumeto: json["LASTVOLUMETO"],
        lasttradeid: json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"],
        volumedayto: json["VOLUMEDAYTO"],
        volume24Hour: json["VOLUME24HOUR"],
        volume24Hourto: json["VOLUME24HOURTO"],
        openday: json["OPENDAY"],
        highday: json["HIGHDAY"],
        lowday: json["LOWDAY"],
        open24Hour: json["OPEN24HOUR"],
        high24Hour: json["HIGH24HOUR"],
        low24Hour: json["LOW24HOUR"],
        lastmarket: json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"],
        volumehourto: json["VOLUMEHOURTO"],
        openhour: json["OPENHOUR"],
        highhour: json["HIGHHOUR"],
        lowhour: json["LOWHOUR"],
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"],
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"],
        change24Hour: json["CHANGE24HOUR"],
        changepct24Hour: json["CHANGEPCT24HOUR"],
        changeday: json["CHANGEDAY"],
        changepctday: json["CHANGEPCTDAY"],
     
    );

    Map<String, dynamic> toJson() => {
        "FROMSYMBOL": fromsymbol,
        "TOSYMBOL": tosymbol,
        "MARKET": market,
        "PRICE": price,
        "LASTUPDATE": lastupdate,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "LASTTRADEID": lasttradeid,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "LASTMARKET": lastmarket,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
      
    };
}



