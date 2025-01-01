// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiaries_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BeneficiariesStateCWProxy {
  BeneficiariesState beneficiaries(List<BeneficiariesModel>? beneficiaries);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BeneficiariesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BeneficiariesState(...).copyWith(id: 12, name: "My name")
  /// ````
  BeneficiariesState call({
    List<BeneficiariesModel>? beneficiaries,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBeneficiariesState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBeneficiariesState.copyWith.fieldName(...)`
class _$BeneficiariesStateCWProxyImpl implements _$BeneficiariesStateCWProxy {
  const _$BeneficiariesStateCWProxyImpl(this._value);

  final BeneficiariesState _value;

  @override
  BeneficiariesState beneficiaries(List<BeneficiariesModel>? beneficiaries) =>
      this(beneficiaries: beneficiaries);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BeneficiariesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BeneficiariesState(...).copyWith(id: 12, name: "My name")
  /// ````
  BeneficiariesState call({
    Object? beneficiaries = const $CopyWithPlaceholder(),
  }) {
    return BeneficiariesState(
      beneficiaries: beneficiaries == const $CopyWithPlaceholder()
          ? _value.beneficiaries
          // ignore: cast_nullable_to_non_nullable
          : beneficiaries as List<BeneficiariesModel>?,
    );
  }
}

extension $BeneficiariesStateCopyWith on BeneficiariesState {
  /// Returns a callable class that can be used as follows: `instanceOfBeneficiariesState.copyWith(...)` or like so:`instanceOfBeneficiariesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BeneficiariesStateCWProxy get copyWith =>
      _$BeneficiariesStateCWProxyImpl(this);
}
