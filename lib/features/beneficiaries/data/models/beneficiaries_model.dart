import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiaries_model.freezed.dart';
part 'beneficiaries_model.g.dart';

@freezed
class BeneficiariesModel with _$BeneficiariesModel {
  const factory BeneficiariesModel(
      {int? id, String? name, String? phoneNumber}) = _BeneficiariesModel;

  factory BeneficiariesModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiariesModelFromJson(json);
}
