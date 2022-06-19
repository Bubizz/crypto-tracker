
import 'dart:convert';

GlobalInfo globalInfoFromJson(String str) => GlobalInfo.fromJson((json.decode(str) as Map<String,dynamic>)['data']);

String globalInfoToJson(GlobalInfo data) => json.encode(data.toJson());

class GlobalInfo {
    GlobalInfo({
        required this.activeCryptocurrencies,
        required this.totalCryptocurrencies,
        required this.activeMarketPairs,
        required this.activeExchanges,
        required this.totalExchanges,
        required this.ethDominance,
        required this.btcDominance,
        required this.ethDominanceYesterday,
        required this.btcDominanceYesterday,
        required this.ethDominance24HPercentageChange,
        required this.btcDominance24HPercentageChange,
        required this.totalMarketCap,
        required this.totalVolume24H,
        required this.totalVolume24HReported,
        required this.altcoinVolume24H,
        required this.altcoinVolume24HReported,
        required this.altcoinMarketCap,
        required this.totalMarketCapYesterday,
        required this.totalVolume24HYesterday,
        required this.totalMarketCapYesterdayPercentageChange,
        required this.totalVolume24HYesterdayPercentageChange,
    });

    int activeCryptocurrencies;
    int totalCryptocurrencies;
    int activeMarketPairs;
    int activeExchanges;
    int totalExchanges;
    double ethDominance;
    double btcDominance;
    double ethDominanceYesterday;
    double btcDominanceYesterday;
    double ethDominance24HPercentageChange;
    double btcDominance24HPercentageChange;
    double totalMarketCap;
    double totalVolume24H;
    double totalVolume24HReported;
    double altcoinVolume24H;
    double altcoinVolume24HReported;
    double altcoinMarketCap;
    double totalMarketCapYesterday;
    double totalVolume24HYesterday;
    double totalMarketCapYesterdayPercentageChange;
    double totalVolume24HYesterdayPercentageChange;



    factory GlobalInfo.fromJson(Map<String, dynamic> json) => GlobalInfo(
        activeCryptocurrencies: json["active_cryptocurrencies"],
        totalCryptocurrencies: json["total_cryptocurrencies"],
        activeMarketPairs: json["active_market_pairs"],
        activeExchanges: json["active_exchanges"],
        totalExchanges: json["total_exchanges"],
        ethDominance: json["eth_dominance"].toDouble(),
        btcDominance: json["btc_dominance"].toDouble(),
        ethDominanceYesterday: json["eth_dominance_yesterday"].toDouble(),
        btcDominanceYesterday: json["btc_dominance_yesterday"].toDouble(),
        ethDominance24HPercentageChange: json["eth_dominance_24h_percentage_change"].toDouble(),
        btcDominance24HPercentageChange: json["btc_dominance_24h_percentage_change"].toDouble(),
        totalMarketCap: json['quote']['USD']["total_market_cap"].toDouble(),
        totalVolume24H: json['quote']['USD']["total_volume_24h"].toDouble(),
        totalVolume24HReported: json['quote']['USD']["total_volume_24h_reported"].toDouble(),
        altcoinVolume24H: json['quote']['USD']["altcoin_volume_24h"].toDouble(),
        altcoinVolume24HReported: json['quote']['USD']["altcoin_volume_24h_reported"].toDouble(),
        altcoinMarketCap: json['quote']['USD']["altcoin_market_cap"].toDouble(),
        totalMarketCapYesterday: json['quote']['USD']["total_market_cap_yesterday"].toDouble(),
        totalVolume24HYesterday: json['quote']['USD']["total_volume_24h_yesterday"].toDouble(),
        totalMarketCapYesterdayPercentageChange: json['quote']['USD']["total_market_cap_yesterday_percentage_change"].toDouble(),
        totalVolume24HYesterdayPercentageChange: json['quote']['USD']["total_volume_24h_yesterday_percentage_change"].toDouble(),
    
    );

    Map<String, dynamic> toJson() => {
        "active_cryptocurrencies": activeCryptocurrencies,
        "total_cryptocurrencies": totalCryptocurrencies,
        "active_market_pairs": activeMarketPairs,
        "active_exchanges": activeExchanges,
        "total_exchanges": totalExchanges,
        "eth_dominance": ethDominance,
        "btc_dominance": btcDominance,
        "eth_dominance_yesterday": ethDominanceYesterday,
        "btc_dominance_yesterday": btcDominanceYesterday,
        "eth_dominance_24h_percentage_change": ethDominance24HPercentageChange,
        "btc_dominance_24h_percentage_change": btcDominance24HPercentageChange,
        "total_market_cap": totalMarketCap,
        "total_volume_24h": totalVolume24H,
        "total_volume_24h_reported": totalVolume24HReported,
        "altcoin_volume_24h": altcoinVolume24H,
        "altcoin_volume_24h_reported": altcoinVolume24HReported,
        "altcoin_market_cap": altcoinMarketCap,
        "total_market_cap_yesterday": totalMarketCapYesterday,
        "total_volume_24h_yesterday": totalVolume24HYesterday,
        "total_market_cap_yesterday_percentage_change": totalMarketCapYesterdayPercentageChange,
        "total_volume_24h_yesterday_percentage_change": totalVolume24HYesterdayPercentageChange,
    };
}



