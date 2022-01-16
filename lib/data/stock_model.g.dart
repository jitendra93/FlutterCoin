// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockResponse _$StockResponseFromJson(Map<String, dynamic> json) =>
    StockResponse(
      json['success'] as bool,
      json['statusCode'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockResponseToJson(StockResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      json['id'] as String,
      json['stockName'] as String,
      (json['price'] as num).toDouble(),
      (json['dayGain'] as num).toDouble(),
      (json['lastPrice'] as num).toDouble(),
      json['lastTrade'] as String,
      json['extendedHours'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'stockName': instance.stockName,
      'price': instance.price,
      'dayGain': instance.dayGain,
      'lastPrice': instance.lastPrice,
      'lastTrade': instance.lastTrade,
      'extendedHours': instance.extendedHours,
    };
