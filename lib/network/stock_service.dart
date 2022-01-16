

import 'package:chopper/chopper.dart';
import 'package:validus/data/stock_model.dart';
import 'package:validus/network/model_response.dart';
import 'package:validus/network/service_interface.dart';

import 'model_converter.dart';
part 'stock_service.chopper.dart';

const String BASE_URL = 'https://run.mocky.io/v3/';
@ChopperApi()
abstract class StockService extends ChopperService implements ServiceInterface{

  @override
  @Get(path: 'fc3ddccf-855c-4bb6-861c-cf7896aa963e')
  Future<Response<Result<StockResponse>>> fetchStocks();

  static StockService create(){
    final client = ChopperClient(
      baseUrl: BASE_URL,
      interceptors: [HttpLoggingInterceptor()],
        converter: ModelConverter(),
        errorConverter: const JsonConverter(),
      services: [_$StockService()]
    );
    return _$StockService(client);
  }
}