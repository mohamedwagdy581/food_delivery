import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService
{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getpopularproductList() async
  {
    return Response();
  }
}