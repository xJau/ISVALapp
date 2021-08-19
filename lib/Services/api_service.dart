import 'package:dio/dio.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/login_request_model.dart';
import 'package:isval_test/Models/orders_model.dart';
import 'package:isval_test/Models/shipment_us_model.dart';
import 'package:isval_test/Models/shipment_model.dart';
import 'package:isval_test/Models/single_stocks_model.dart';
import 'package:isval_test/Models/total_stock_model.dart';
import 'package:isval_test/Models/user.dart';

class ApiService {
  final String userName = 'admin';
  final String password = 'AdmSVLA2021!';
  static final String url = 'https://localhost:44315/api/';

  static Future<User> login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await Dio().request(
        url + 'Account/authenticate',
        data: loginRequestModel.toJson(),
        options: Options(
          method: 'POST',
          headers: {'Content-Type': 'application/json', 'accept': '*/*'},
        ),
      );
      return User.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  static Future<User> getUser(token) async {
    try {
      Response response = await Dio().get(url + 'Account/getcurrentuser',
          options: Options(
              headers: {'Authorization': 'bearer $token', 'accept': '*/*'}));
      return User.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  static Future<List<IRecord>> getStock(codCustomer) async {
    try {
      Response response =
          await Dio().get(url + 'Stock/gettotalstock?CodCustomer=$codCustomer');
      return Stock.fromJson(response.data).totalStocks;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<IRecord>> getDetailedStocks(codCustomer) async {
    try {
      Response response = await Dio()
          .get(url + 'Stock/getdetailedstock?CodCustomer=$codCustomer');
      return SingleStocksModel.fromJson(response.data).singleStocks;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<IRecord>> getShipments(codCustomer) async {
    try {
      Response response = await Dio().get(
          url + 'Shipment/GetShipmentsToCustomerList?CodCustomer=$codCustomer');
      return ShipmentModel.fromJson(response.data).shipments;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<IRecord>> getUsShipments(codCustomer) async {
    try {
      Response response = await Dio()
          .get(url + 'Shipment/GetShipmentsToUs?CodCustomer=$codCustomer');
      return ShipmentToUsModel.fromJson(response.data).shipmentsToUs;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<IRecord>> getOrders(codCustomer) async {
    try {
      Response response =
          await Dio().get(url + 'Order/getorders?CodCustomer=$codCustomer');
      return OrdersModel.fromJson(response.data).totalOrders;
    } catch (e) {
      throw e;
    }
  }
}
