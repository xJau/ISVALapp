import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/login_model.dart';
import 'package:isval_test/Models/orders_model.dart';
import 'package:isval_test/Models/single_stocks_model.dart';
import 'dart:developer' as developer;

import 'package:isval_test/Models/total_stock_model.dart';

class ApiService {
  final String userName = 'admin';
  final String password = 'AdmSVLA2021';
  static final String url = 'https://localhost:44315/api/';

  static Future<LoginResponseModel> login(
      LoginRequestModel loginRequestModel) async {
    var query = loginRequestModel.toJson();
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    final response = await dio.post(url + 'Account/authenticate', data: query);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load Data');
    }
  }

  static void getCustomers() async {
    try {
      Response response = await Dio().get(url + 'Customer/getcustomers');
    } catch (e) {
      print(e);
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
      developer.log("Data asked");
      Response response = await Dio()
          .get(url + 'Stock/getdetailedstock?CodCustomer=$codCustomer');
      var model = SingleStocksModel.fromJson(response.data);
      return model.singleStocks;
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
