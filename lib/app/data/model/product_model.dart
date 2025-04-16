import 'package:freezed_annotation/freezed_annotation.dart';
import 'dimension_model.dart';
import 'meta_model.dart';
import 'review_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    @JsonKey(defaultValue: '') required String brand,
    required String sku,
    required double weight,
    required Dimensions dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required List<Review> reviews,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required Meta meta,
    required String thumbnail,
    required List<String> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}