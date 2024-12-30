// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_feature_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestFeatureStateCWProxy {
  TestFeatureState number(int? number);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestFeatureState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestFeatureState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestFeatureState call({
    int? number,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestFeatureState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestFeatureState.copyWith.fieldName(...)`
class _$TestFeatureStateCWProxyImpl implements _$TestFeatureStateCWProxy {
  const _$TestFeatureStateCWProxyImpl(this._value);

  final TestFeatureState _value;

  @override
  TestFeatureState number(int? number) => this(number: number);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestFeatureState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestFeatureState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestFeatureState call({
    Object? number = const $CopyWithPlaceholder(),
  }) {
    return TestFeatureState(
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int?,
    );
  }
}

extension $TestFeatureStateCopyWith on TestFeatureState {
  /// Returns a callable class that can be used as follows: `instanceOfTestFeatureState.copyWith(...)` or like so:`instanceOfTestFeatureState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestFeatureStateCWProxy get copyWith => _$TestFeatureStateCWProxyImpl(this);
}

abstract class _$TestFeatureAnotherStateCWProxy {
  TestFeatureAnotherState number(int? number);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestFeatureAnotherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestFeatureAnotherState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestFeatureAnotherState call({
    int? number,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestFeatureAnotherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestFeatureAnotherState.copyWith.fieldName(...)`
class _$TestFeatureAnotherStateCWProxyImpl
    implements _$TestFeatureAnotherStateCWProxy {
  const _$TestFeatureAnotherStateCWProxyImpl(this._value);

  final TestFeatureAnotherState _value;

  @override
  TestFeatureAnotherState number(int? number) => this(number: number);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestFeatureAnotherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestFeatureAnotherState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestFeatureAnotherState call({
    Object? number = const $CopyWithPlaceholder(),
  }) {
    return TestFeatureAnotherState(
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int?,
    );
  }
}

extension $TestFeatureAnotherStateCopyWith on TestFeatureAnotherState {
  /// Returns a callable class that can be used as follows: `instanceOfTestFeatureAnotherState.copyWith(...)` or like so:`instanceOfTestFeatureAnotherState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestFeatureAnotherStateCWProxy get copyWith =>
      _$TestFeatureAnotherStateCWProxyImpl(this);
}
