// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestFeatureModel _$TestFeatureModelFromJson(Map<String, dynamic> json) {
  return _TestFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$TestFeatureModel {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this TestFeatureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestFeatureModelCopyWith<TestFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestFeatureModelCopyWith<$Res> {
  factory $TestFeatureModelCopyWith(
          TestFeatureModel value, $Res Function(TestFeatureModel) then) =
      _$TestFeatureModelCopyWithImpl<$Res, TestFeatureModel>;
  @useResult
  $Res call({String? name, String? description});
}

/// @nodoc
class _$TestFeatureModelCopyWithImpl<$Res, $Val extends TestFeatureModel>
    implements $TestFeatureModelCopyWith<$Res> {
  _$TestFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestFeatureModelImplCopyWith<$Res>
    implements $TestFeatureModelCopyWith<$Res> {
  factory _$$TestFeatureModelImplCopyWith(_$TestFeatureModelImpl value,
          $Res Function(_$TestFeatureModelImpl) then) =
      __$$TestFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? description});
}

/// @nodoc
class __$$TestFeatureModelImplCopyWithImpl<$Res>
    extends _$TestFeatureModelCopyWithImpl<$Res, _$TestFeatureModelImpl>
    implements _$$TestFeatureModelImplCopyWith<$Res> {
  __$$TestFeatureModelImplCopyWithImpl(_$TestFeatureModelImpl _value,
      $Res Function(_$TestFeatureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$TestFeatureModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestFeatureModelImpl implements _TestFeatureModel {
  const _$TestFeatureModelImpl({this.name, this.description});

  factory _$TestFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestFeatureModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;

  @override
  String toString() {
    return 'TestFeatureModel(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestFeatureModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of TestFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestFeatureModelImplCopyWith<_$TestFeatureModelImpl> get copyWith =>
      __$$TestFeatureModelImplCopyWithImpl<_$TestFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _TestFeatureModel implements TestFeatureModel {
  const factory _TestFeatureModel(
      {final String? name, final String? description}) = _$TestFeatureModelImpl;

  factory _TestFeatureModel.fromJson(Map<String, dynamic> json) =
      _$TestFeatureModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;

  /// Create a copy of TestFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestFeatureModelImplCopyWith<_$TestFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
