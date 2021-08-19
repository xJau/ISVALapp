import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu.dart';
import 'package:isval_test/Routes/metrics.dart';
import 'package:isval_test/Routes/starting.dart';
import 'package:isval_test/Routes/stock_detail_page.dart';
import 'Routes/dashboard.dart';
import 'Routes/login.dart';
import 'Routes/details.dart';
import 'Routes/shipping.dart';
import 'Routes/stock.dart';
import 'Routes/starting.dart';

class RouteGenerator {
  static const String dashboard = '/';
  static const String orders = '/orders';
  static const String stock = '/stock';
  static const String shipping = '/shipping';
  static const String stockDetail = '/stock/detail';
  static const String metrics = '/metrics';
  static const String login = '/login';
  static const String menu = '/menu';
  static const String starting = '/starting';

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
      // case stockDetail:
      //   return SlideRightRoute(page: StockDetailRoute());
      case metrics:
        return SlideRightRoute(page:  MetricsRoute());
      case login:
        return SlideRightRoute(page:  LoginRoute());
      case starting:
        return SlideRightRoute(page:  StartingRoute());
      case menu:
        return SlideLeftRoute(page:  Menu());
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
