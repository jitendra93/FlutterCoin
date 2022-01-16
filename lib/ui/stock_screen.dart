import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:validus/data/stock_model.dart';
import 'package:validus/network/model_response.dart';
import 'package:validus/network/stock_service.dart';
import 'package:validus/ui/stock_card.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  List<Stock> stocks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchStock = StockService.create().fetchStocks();
  }

  late Future<Response<Result<StockResponse>>> _fetchStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildStockLoader(context),
      ),
    );
  }

  Widget _buildStockLoader(BuildContext context) {
    final log = Logger('StockScreen');
    return FutureBuilder<Response<Result<StockResponse>>>(
      future: _fetchStock,
      builder: (context, snapshot) {
        log.fine(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return ErrorWidget();
          }
          loading = false;
          if (false == snapshot.data?.isSuccessful ||
              snapshot.data?.body == null ||
              snapshot.data?.body is Error) {
            return ErrorWidget();
          }
          final stockResponse =
              (snapshot.data?.body as Success<StockResponse>).value;
          if (stockResponse.success) {
            stocks = stockResponse.data;
          }
          return _buildStockList(context, stocks);
        } else {
          if (loading) {
            // Show a loading indicator while waiting for the movies
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const ErrorWidget();
          }
        }
      },
    );
  }

  Widget _buildStockList(BuildContext context, List<Stock> stocks) {
    return ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          return stockCard(context, stocks[index]);
        });
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Something went wrong'));
  }
}
