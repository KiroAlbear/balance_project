// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiaries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeneficiariesModelImpl _$$BeneficiariesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BeneficiariesModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$BeneficiariesModelImplToJson(
        _$BeneficiariesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
