import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu.dart';
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
  static const String menu = '/menu';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return SlideRightRoute(page: DashboardRoute());
      case orders:
        return SlideRightRoute(page: OrdersRoute());
      case stock:
        return SlideRightRoute(page: StocksRoute());
      case shipping:
        return SlideRightRoute(page: ShippingRoute());
      case metrics:
        return SlideRightRoute(page: const MetricsRoute());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginRoute());
      case menu:
        return SlideLeftRoute(page: const Menu());
      default:
        throw FormatException("Route not found");
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .animate(animation),
            child: child,
          ),
        );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          ),
        );
}
