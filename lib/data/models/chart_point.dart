class ChartPoint {
    ChartPoint({
        required this.time,
        required this.high,
        required this.low,
        required this.open,
        required this.volumefrom,
        required this.volumeto,
        required this.close,
        required this.conversionType,
        required this.conversionSymbol,
    });

    int time;
    double high;
    double low;
    double open;
    double volumefrom;
    double volumeto;
    double close;
    String conversionType;
    String conversionSymbol;

    factory ChartPoint.fromJson(Map<String, dynamic> json) => ChartPoint(
        time: json["time"],
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        open: json["open"].toDouble(),
        volumefrom: json["volumefrom"].toDouble(),
        volumeto: json["volumeto"].toDouble(),
        close: json["close"].toDouble(),
        conversionType: json["conversionType"],
        conversionSymbol: json["conversionSymbol"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "high": high,
        "low": low,
        "open": open,
        "volumefrom": volumefrom,
        "volumeto": volumeto,
        "close": close,
        "conversionType": conversionType,
        "conversionSymbol": conversionSymbol,
    };
}
