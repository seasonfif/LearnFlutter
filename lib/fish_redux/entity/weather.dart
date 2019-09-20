
/// date : "20190919"
/// high : "28"
/// low : "17"
/// type : "sunny"

class Weather {
  String date;
  String high;
  String low;
  String type;

  static Weather fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Weather weatherBean = Weather();
    weatherBean.date = map['date'];
    weatherBean.high = map['high'];
    weatherBean.low = map['low'];
    weatherBean.type = map['type'];
    return weatherBean;
  }

  Map toJson() => {
    "date": date,
    "high": high,
    "low": low,
    "type": type,
  };
}