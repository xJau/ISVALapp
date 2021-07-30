import 'package:flutter/material.dart';
import 'package:isval_test/routes.dart';

void main() => runApp(const IsvalApp());

class IsvalApp extends StatelessWidget {
  const IsvalApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "ISVAL",
      initialRoute: RouteGenerator.dashboard,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
