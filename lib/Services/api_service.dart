import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import 'package:isval_test/Models/stock.dart';

class ApiService {
  final String userName = 'admin';
  final String password = 'AdmSVLA2021';
  final String url = 'https://localhost:44315/api/';

  //

  void getCustomers() async {

    try{
      Response response = await Dio().get(url+'Customer/getcustomers');
      developer.log(response.toString());
    } catch(e) {
      print(e);
    }

  }

  Future<Stock> getStock(codCustomer) async {

    try{
      Response response = await Dio().get(url+'Stock/gettotalstock?CodCustomer=${codCustomer}');
      developer.log(response.data.toString());
      Stock test = Stock.fromJson(response.data);
      
      developer.log(test.totalStocks[0].wip.toString());
      return test;
    } catch(e) {
      print(e);
      throw e;
    }

  }


}

