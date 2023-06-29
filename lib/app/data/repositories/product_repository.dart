import 'package:test_abersoft/app/core/utils/pagination_filter.dart';
import '../models/product/product.dart';
import '../providers/product_provider.dart';

class ProductRepository {
  final ProductProvider _productProvider;

  ProductRepository(this._productProvider);

  //fungsi utk data pagination filter offser
  Future<List<Product>> getProductLimit(PaginationFilter filter) =>
      _productProvider.getMyProduct(filter);

  Future<Product> postProduct(Map data) => _productProvider.postProduct(data);
}
