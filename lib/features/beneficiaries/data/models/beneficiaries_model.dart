import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiaries_model.freezed.dart';
part 'beneficiaries_model.g.dart';

@freezed
class BeneficiariesModel with _$BeneficiariesModel {
  const factory BeneficiariesModel({String? name, String? description}) =
      _BeneficiariesModel;

  factory BeneficiariesModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiariesModelFromJson(json);
}
