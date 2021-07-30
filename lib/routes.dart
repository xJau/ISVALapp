import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Routes/metrics.dart';
import 'Routes/dashboard.dart';
import 'Routes/login.dart';
import 'Routes/orders.dart';
import 'Routes/shipping.dart';
import 'Routes/stock.dart';

class RouteGenerator {
  static const String dashboard = '/';
  static const String orders = '/orders';
  static const String stock = '/stock';
  static const String shipping = '/shipping';
  static const String metrics = '/metrics';
  static const String login = '/login';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardRoute());
      case orders:
        return MaterialPageRoute(builder: (_) => const OrdersRoute());
      case stock:
        return MaterialPageRoute(builder: (_) => const StocksRoute());
      case shipping:
        return MaterialPageRoute(builder: (_) => const ShippingRoute());
      case metrics:
        return MaterialPageRoute(builder: (_) => const MetricsRoute());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginRoute());
      default:
        throw FormatException("Route not found");
    }
  }
}
