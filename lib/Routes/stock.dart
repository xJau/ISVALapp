import 'package:flutter/material.dart';
import 'package:isval_test/routes.dart';

class StocksRoute extends StatelessWidget {
  const StocksRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () =>
                    {Navigator.of(context).pushNamed(RouteGenerator.dashboard)},
                child: const Text("Random"))));
  }
}
