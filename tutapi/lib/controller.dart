import 'package:get/get.dart';
import 'package:tutapi/api_services.dart';
import 'package:tutapi/model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  // ignore: deprecated_member_use
  var productList = <ProductModel>[].obs;
  
  

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    ApiServices api = ApiServices();
    try {
      isLoading(true);
      var products = await api.fetchProducts();

      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
