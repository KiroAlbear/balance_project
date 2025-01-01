// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_beneficiary_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteBeneficiaryRequestModel _$DeleteBeneficiaryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _DeleteBeneficiaryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteBeneficiaryRequestModel {
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteBeneficiaryRequestModelCopyWith<DeleteBeneficiaryRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteBeneficiaryRequestModelCopyWith<$Res> {
  factory $DeleteBeneficiaryRequestModelCopyWith(
          DeleteBeneficiaryRequestModel value,
          $Res Function(DeleteBeneficiaryRequestModel) then) =
      _$DeleteBeneficiaryRequestModelCopyWithImpl<$Res,
          DeleteBeneficiaryRequestModel>;
  @useResult
  $Res call({String? phoneNumber});
}

/// @nodoc
class _$DeleteBeneficiaryRequestModelCopyWithImpl<$Res,
        $Val extends DeleteBeneficiaryRequestModel>
    implements $DeleteBeneficiaryRequestModelCopyWith<$Res> {
  _$DeleteBeneficiaryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteBeneficiaryRequestModelImplCopyWith<$Res>
    implements $DeleteBeneficiaryRequestModelCopyWith<$Res> {
  factory _$$DeleteBeneficiaryRequestModelImplCopyWith(
          _$DeleteBeneficiaryRequestModelImpl value,
          $Res Function(_$DeleteBeneficiaryRequestModelImpl) then) =
      __$$DeleteBeneficiaryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phoneNumber});
}

/// @nodoc
class __$$DeleteBeneficiaryRequestModelImplCopyWithImpl<$Res>
    extends _$DeleteBeneficiaryRequestModelCopyWithImpl<$Res,
        _$DeleteBeneficiaryRequestModelImpl>
    implements _$$DeleteBeneficiaryRequestModelImplCopyWith<$Res> {
  __$$DeleteBeneficiaryRequestModelImplCopyWithImpl(
      _$DeleteBeneficiaryRequestModelImpl _value,
      $Res Function(_$DeleteBeneficiaryRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$DeleteBeneficiaryRequestModelImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteBeneficiaryRequestModelImpl
    implements _DeleteBeneficiaryRequestModel {
  const _$DeleteBeneficiaryRequestModelImpl({this.phoneNumber});

  factory _$DeleteBeneficiaryRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeleteBeneficiaryRequestModelImplFromJson(json);

  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'DeleteBeneficiaryRequestModel(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBeneficiaryRequestModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBeneficiaryRequestModelImplCopyWith<
          _$DeleteBeneficiaryRequestModelImpl>
      get copyWith => __$$DeleteBeneficiaryRequestModelImplCopyWithImpl<
          _$DeleteBeneficiaryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteBeneficiaryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteBeneficiaryRequestModel
    implements DeleteBeneficiaryRequestModel {
  const factory _DeleteBeneficiaryRequestModel({final String? phoneNumber}) =
      _$DeleteBeneficiaryRequestModelImpl;

  factory _DeleteBeneficiaryRequestModel.fromJson(Map<String, dynamic> json) =
      _$DeleteBeneficiaryRequestModelImpl.fromJson;

  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$DeleteBeneficiaryRequestModelImplCopyWith<
          _$DeleteBeneficiaryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
