// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$StockService extends StockService {
  _$StockService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StockService;

  @override
  Future<Response<Result<StockResponse>>> fetchStocks() {
    final $url = 'fc3ddccf-855c-4bb6-861c-cf7896aa963e';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Result<StockResponse>, StockResponse>($request);
  }
}
