// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_beneficiaries_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddBeneficiariesRequestModel _$AddBeneficiariesRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddBeneficiariesRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddBeneficiariesRequestModel {
  String? get name => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddBeneficiariesRequestModelCopyWith<AddBeneficiariesRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddBeneficiariesRequestModelCopyWith<$Res> {
  factory $AddBeneficiariesRequestModelCopyWith(
          AddBeneficiariesRequestModel value,
          $Res Function(AddBeneficiariesRequestModel) then) =
      _$AddBeneficiariesRequestModelCopyWithImpl<$Res,
          AddBeneficiariesRequestModel>;
  @useResult
  $Res call({String? name, String? phoneNumber});
}

/// @nodoc
class _$AddBeneficiariesRequestModelCopyWithImpl<$Res,
        $Val extends AddBeneficiariesRequestModel>
    implements $AddBeneficiariesRequestModelCopyWith<$Res> {
  _$AddBeneficiariesRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddBeneficiariesRequestModelImplCopyWith<$Res>
    implements $AddBeneficiariesRequestModelCopyWith<$Res> {
  factory _$$AddBeneficiariesRequestModelImplCopyWith(
          _$AddBeneficiariesRequestModelImpl value,
          $Res Function(_$AddBeneficiariesRequestModelImpl) then) =
      __$$AddBeneficiariesRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? phoneNumber});
}

/// @nodoc
class __$$AddBeneficiariesRequestModelImplCopyWithImpl<$Res>
    extends _$AddBeneficiariesRequestModelCopyWithImpl<$Res,
        _$AddBeneficiariesRequestModelImpl>
    implements _$$AddBeneficiariesRequestModelImplCopyWith<$Res> {
  __$$AddBeneficiariesRequestModelImplCopyWithImpl(
      _$AddBeneficiariesRequestModelImpl _value,
      $Res Function(_$AddBeneficiariesRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$AddBeneficiariesRequestModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddBeneficiariesRequestModelImpl
    implements _AddBeneficiariesRequestModel {
  const _$AddBeneficiariesRequestModelImpl({this.name, this.phoneNumber});

  factory _$AddBeneficiariesRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AddBeneficiariesRequestModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'AddBeneficiariesRequestModel(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBeneficiariesRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBeneficiariesRequestModelImplCopyWith<
          _$AddBeneficiariesRequestModelImpl>
      get copyWith => __$$AddBeneficiariesRequestModelImplCopyWithImpl<
          _$AddBeneficiariesRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddBeneficiariesRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AddBeneficiariesRequestModel
    implements AddBeneficiariesRequestModel {
  const factory _AddBeneficiariesRequestModel(
      {final String? name,
      final String? phoneNumber}) = _$AddBeneficiariesRequestModelImpl;

  factory _AddBeneficiariesRequestModel.fromJson(Map<String, dynamic> json) =
      _$AddBeneficiariesRequestModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$AddBeneficiariesRequestModelImplCopyWith<
          _$AddBeneficiariesRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
