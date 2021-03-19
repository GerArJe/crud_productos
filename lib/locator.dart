import 'package:get_it/get_it.dart';

import 'Product/providers/product_provider.dart';
import 'Product/services/products_api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProductsAPI('products'));
  locator.registerLazySingleton(() => ProductProvider());
}
