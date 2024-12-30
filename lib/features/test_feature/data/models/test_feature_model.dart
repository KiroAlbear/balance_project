import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_feature_model.freezed.dart';
part 'test_feature_model.g.dart';

@freezed
class TestFeatureModel with _$TestFeatureModel {
  const factory TestFeatureModel({String? name, String? description}) =
      _TestFeatureModel;

  factory TestFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$TestFeatureModelFromJson(json);
}
