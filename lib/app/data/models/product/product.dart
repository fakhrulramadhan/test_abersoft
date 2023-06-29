import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    int? id,
    String? name,
    String? imageUrl,
    String? productDescription,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static List<Product> listFromJson(list) =>
      List<Product>.from(list.map((x) => Product.fromJson(x)));
}
