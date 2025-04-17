import 'package:get/get.dart';
import 'package:logiology/app/data/model/product_model.dart';
import 'package:logiology/app/data/providers/product_provider.dart';

class HomeController extends GetxController {
  var products = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  var searchTerm = "".obs;
  var categories = <String>[].obs;
  var tags = <String>[].obs;

  // Active filter values
  double? activeMinPrice;
  double? activeMaxPrice;
  String? activeCategory;
  List<String> activeTags = [];

  @override
  void onInit() {
    fetchProducts();
    searchTerm.listen((term) {
      searchProducts(term);
    });
    super.onInit();
  }

  // Fetch products
  void fetchProducts() async {
    try {
      isLoading.value = true;
      final result = await ProductProvider.fetchProducts();
      products.value = result;
      filteredProducts.value = result;

      categories.value = result.map((p) => p.category).toSet().toList();
      tags.value = result.expand((p) => p.tags).toSet().toList();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to load products");
    } finally {
      isLoading.value = false;
    }
  }

  // Filter products
  void applyAdvancedFilter({required double minPrice, required double maxPrice, required String category, required List<String> selectedTags}) {
    activeMinPrice = minPrice;
    activeMaxPrice = maxPrice;
    activeCategory = category;
    activeTags = selectedTags;

    filteredProducts.value =
        products.where((p) {
          final priceMatch = p.price >= minPrice && p.price <= maxPrice;
          final categoryMatch = category.isEmpty || p.category == category;
          final tagsMatch = selectedTags.isEmpty || selectedTags.any((tag) => p.tags.contains(tag));
          return priceMatch && categoryMatch && tagsMatch;
        }).toList();
  }

  // Reset filter
  void resetFilters() {
    activeMinPrice = null;
    activeMaxPrice = null;
    activeCategory = null;
    activeTags.clear();

    filteredProducts.value = products;
  }

  // Search products
  void searchProducts(String term) {
    if (term.isNotEmpty) {
      filteredProducts.value =
          products.where((product) {
            return product.title.toLowerCase().contains(term.toLowerCase());
          }).toList();
    } else {
      filteredProducts.value = products;
    }
  }
}
