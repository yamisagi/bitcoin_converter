class CoinModel {
  String? time;
  String? assetIdBase;
  String? assetIdQuote;
  double? rate;

  CoinModel({this.time, this.assetIdBase, this.assetIdQuote, this.rate});

  CoinModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['asset_id_base'] = assetIdBase;
    data['asset_id_quote'] = assetIdQuote;
    data['rate'] = rate;
    return data;
  }
}
