
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_contants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{

  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async
  {
    return await apiClient.getData(AppCpnstant.POPULAR_PRODUCT_URL);
  }
}