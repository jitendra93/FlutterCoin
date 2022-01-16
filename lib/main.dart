import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:validus/constants.dart';
import 'StockTheme.dart';
import 'ui/home.dart';


main()  {
  _setupLogging();
  runApp(const StockApp());
}
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}



class StockApp extends StatelessWidget {
  const StockApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final theme = StockTheme.dark();

    return   MaterialApp(
          theme: theme,
          title: WATCHLIST,
          home: const Home(),
    );
  }
}
