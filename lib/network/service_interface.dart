import 'package:chopper/chopper.dart';
import 'package:validus/data/stock_model.dart';
import 'package:validus/network/model_response.dart';

abstract class ServiceInterface{
  Future<Response<Result<StockResponse>>> fetchStocks();
}