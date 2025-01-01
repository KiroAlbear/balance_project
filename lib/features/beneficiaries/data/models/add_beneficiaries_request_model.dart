import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_beneficiaries_request_model.freezed.dart';
part 'add_beneficiaries_request_model.g.dart';

@freezed
class AddBeneficiariesRequestModel with _$AddBeneficiariesRequestModel {
  const factory AddBeneficiariesRequestModel(
      {String? name, String? phoneNumber}) = _AddBeneficiariesRequestModel;

  factory AddBeneficiariesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddBeneficiariesRequestModelFromJson(json);
}
