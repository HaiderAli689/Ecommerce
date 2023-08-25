
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_contants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{

  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async
  {
    return await apiClient.getData(AppCpnstant.RECOMMENDED_PRODUCT_URL);
  }
}