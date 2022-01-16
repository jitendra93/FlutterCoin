import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_model.g.dart';

@JsonSerializable()
class StockResponse{
  final bool success;
  final int statusCode ;
  final List<Stock> data;

  factory StockResponse.fromJson(Map<String, dynamic> json) => _$StockResponseFromJson(json);

  StockResponse(this.success, this.statusCode, this.data);

  Map<String, dynamic> toJson() => _$StockResponseToJson(this);
}

@JsonSerializable()
class Stock extends Equatable{
  /**
   *   "id": "87-3221807",
      "stockName": "Buzzshare",
      "price": 65.53,
      "dayGain": 3.76,
      "lastTrade": "1636275300000",
      "extendedHours": "1639008000000",
      "lastPrice": 90.23
   */

  final String id, stockName;
  final double price, dayGain, lastPrice;
  final String lastTrade, extendedHours;



  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Stock(this.id, this.stockName, this.price, this.dayGain, this.lastPrice, this.lastTrade, this.extendedHours);


  Map<String, dynamic> toJson() => _$StockToJson(this);

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;
}

