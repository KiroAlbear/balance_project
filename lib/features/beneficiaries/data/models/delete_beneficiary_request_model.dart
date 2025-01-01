import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_beneficiary_request_model.freezed.dart';
part 'delete_beneficiary_request_model.g.dart';

@freezed
class DeleteBeneficiaryRequestModel with _$DeleteBeneficiaryRequestModel {
  const factory DeleteBeneficiaryRequestModel({String? phoneNumber}) =
      _DeleteBeneficiaryRequestModel;

  factory DeleteBeneficiaryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteBeneficiaryRequestModelFromJson(json);
}
