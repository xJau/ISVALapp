import 'package:flutter/material.dart';
import 'package:isval_test/routes.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () =>
                    {Navigator.of(context).pushNamed(RouteGenerator.stock)},
                child: const Text("Dashboard"))));
  }
}
