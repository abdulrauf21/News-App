import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/network/Api_service.dart';
import 'package:newsapp/utils/app_strings.dart';
import 'package:newsapp/utils/toast_utils.dart';

class NewsProvider extends ChangeNotifier {
  bool isLoading = false;
  ApiService apiService = ApiService();
  NewsModel? newsModel;

  Future<NewsModel> getNewsByCategory(String category) async {
    try {
      isLoading = true;
      newsModel = null;
      // notifyListeners();
      http.Response response = await apiService.get(
          AppUrl.baseUrl + AppUrl.category + category + AppUrl.connomApiKey);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final decodedResult = jsonDecode(response.body);
        NewsModel nm = NewsModel.fromJson(decodedResult);
        log(nm.toString());
        newsModel = nm;
        isLoading = false;
        notifyListeners();
        return newsModel!;
      } else {
        isLoading = false;
        notifyListeners();
        ToastUtils.showErrorToast("Error getting data");
        throw "Error";
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
