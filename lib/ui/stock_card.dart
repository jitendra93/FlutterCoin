import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validus/StockTheme.dart';
import 'package:validus/data/stock_model.dart';

import '../constants.dart';

Widget stockCard(BuildContext context, Stock stock) {
  return Card(
    color: primary,
    elevation: 4.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                stock.stockName.toUpperCase(),
                style: StockTheme.darkTextTheme.headline2,
              ),
            ],
          ),
          cardRow(PRICE, stock.price.toString()),
          cardRow(DAY_GAIN,
              '${stock.lastPrice} - ${(stock.lastPrice + stock.dayGain).toStringAsFixed(2)}'),
          cardRow(LAST_TRADE, formattedHour(stock.lastTrade)),
          cardRow(EXTENDED_HRS, formattedHour(stock.extendedHours)),
          percentChangeRow(calculatePercent(stock)),
        ],
      ),
    ),
  );
}

Widget cardRow(
  String label,
  String rowValue,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: StockTheme.darkTextTheme.bodyText1,
      ),
      Text(
        rowValue,
        style:
            StockTheme.darkTextTheme.bodyText1?.copyWith(color: Colors.white),
      )
    ],
  );
}

Widget percentChangeRow(
  double rowValue,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        PERCENT_CHANGE,
        style: StockTheme.darkTextTheme.bodyText1,
      ),
      decoratedPercentChangeText(rowValue)
    ],
  );
}

Widget decoratedPercentChangeText(double rowValue) {
  if (rowValue >= 0) {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_up,
          color: Colors.green,
        ),
        Text(
          '${rowValue.toStringAsFixed(2)}%',
          style:
              StockTheme.darkTextTheme.bodyText1?.copyWith(color: Colors.green),
        ),
      ],
    );
  } else if (rowValue == double.nan) {
    return Text(
      'NA',
      style: StockTheme.darkTextTheme.bodyText1?.copyWith(color: Colors.red),
    );
  } else {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_down,
          color: Colors.red,
        ),
        Text(
          '${rowValue.toStringAsFixed(2)}%',
          style:
              StockTheme.darkTextTheme.bodyText1?.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

double calculatePercent(Stock stock) {
  if (stock.lastPrice == 0) return double.nan;
  return (100 * (stock.lastPrice - stock.price) / stock.lastPrice);
}

String formattedHour(String timeStamp) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp));
  String formattedTime = DateFormat('hh:mm:a').format(datetime);
  return formattedTime;
}
