// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beneficiaries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeneficiariesModel _$BeneficiariesModelFromJson(Map<String, dynamic> json) {
  return _BeneficiariesModel.fromJson(json);
}

/// @nodoc
mixin _$BeneficiariesModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeneficiariesModelCopyWith<BeneficiariesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiariesModelCopyWith<$Res> {
  factory $BeneficiariesModelCopyWith(
          BeneficiariesModel value, $Res Function(BeneficiariesModel) then) =
      _$BeneficiariesModelCopyWithImpl<$Res, BeneficiariesModel>;
  @useResult
  $Res call({int? id, String? name, String? phoneNumber});
}

/// @nodoc
class _$BeneficiariesModelCopyWithImpl<$Res, $Val extends BeneficiariesModel>
    implements $BeneficiariesModelCopyWith<$Res> {
  _$BeneficiariesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$BeneficiariesModelImplCopyWith<$Res>
    implements $BeneficiariesModelCopyWith<$Res> {
  factory _$$BeneficiariesModelImplCopyWith(_$BeneficiariesModelImpl value,
          $Res Function(_$BeneficiariesModelImpl) then) =
      __$$BeneficiariesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? phoneNumber});
}

/// @nodoc
class __$$BeneficiariesModelImplCopyWithImpl<$Res>
    extends _$BeneficiariesModelCopyWithImpl<$Res, _$BeneficiariesModelImpl>
    implements _$$BeneficiariesModelImplCopyWith<$Res> {
  __$$BeneficiariesModelImplCopyWithImpl(_$BeneficiariesModelImpl _value,
      $Res Function(_$BeneficiariesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$BeneficiariesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$BeneficiariesModelImpl implements _BeneficiariesModel {
  const _$BeneficiariesModelImpl({this.id, this.name, this.phoneNumber});

  factory _$BeneficiariesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeneficiariesModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'BeneficiariesModel(id: $id, name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeneficiariesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeneficiariesModelImplCopyWith<_$BeneficiariesModelImpl> get copyWith =>
      __$$BeneficiariesModelImplCopyWithImpl<_$BeneficiariesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeneficiariesModelImplToJson(
      this,
    );
  }
}

abstract class _BeneficiariesModel implements BeneficiariesModel {
  const factory _BeneficiariesModel(
      {final int? id,
      final String? name,
      final String? phoneNumber}) = _$BeneficiariesModelImpl;

  factory _BeneficiariesModel.fromJson(Map<String, dynamic> json) =
      _$BeneficiariesModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$BeneficiariesModelImplCopyWith<_$BeneficiariesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
