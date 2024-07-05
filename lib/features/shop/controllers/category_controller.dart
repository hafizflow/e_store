import 'package:e_store/data/repositories/categories/category_repository.dart';
import 'package:e_store/features/shop/models/category_model.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader when loading category
      isLoading.value = true;

      // Fetch category form data source (Firebase, Api, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the category list
      allCategories.assignAll(categories);

      // Filter featured category
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  /// -- Get category or sub category product
}
