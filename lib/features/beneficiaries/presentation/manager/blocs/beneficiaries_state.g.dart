// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiaries_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BeneficiariesStateCWProxy {
  BeneficiariesState beneficiaries(List<BeneficiariesModel>? beneficiaries);

  BeneficiariesState amounts(List<AmountModel>? amounts);

  BeneficiariesState showOverlayLoading(bool showOverlayLoading);

  BeneficiariesState selectedBeneficiaryIndex(int selectedBeneficiaryIndex);

  BeneficiariesState selectedAmountIndex(int selectedAmountIndex);

  BeneficiariesState isListChanged(bool isListChanged);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BeneficiariesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BeneficiariesState(...).copyWith(id: 12, name: "My name")
  /// ````
  BeneficiariesState call({
    List<BeneficiariesModel>? beneficiaries,
    List<AmountModel>? amounts,
    bool? showOverlayLoading,
    int? selectedBeneficiaryIndex,
    int? selectedAmountIndex,
    bool? isListChanged,
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
  BeneficiariesState amounts(List<AmountModel>? amounts) =>
      this(amounts: amounts);

  @override
  BeneficiariesState showOverlayLoading(bool showOverlayLoading) =>
      this(showOverlayLoading: showOverlayLoading);

  @override
  BeneficiariesState selectedBeneficiaryIndex(int selectedBeneficiaryIndex) =>
      this(selectedBeneficiaryIndex: selectedBeneficiaryIndex);

  @override
  BeneficiariesState selectedAmountIndex(int selectedAmountIndex) =>
      this(selectedAmountIndex: selectedAmountIndex);

  @override
  BeneficiariesState isListChanged(bool isListChanged) =>
      this(isListChanged: isListChanged);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BeneficiariesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BeneficiariesState(...).copyWith(id: 12, name: "My name")
  /// ````
  BeneficiariesState call({
    Object? beneficiaries = const $CopyWithPlaceholder(),
    Object? amounts = const $CopyWithPlaceholder(),
    Object? showOverlayLoading = const $CopyWithPlaceholder(),
    Object? selectedBeneficiaryIndex = const $CopyWithPlaceholder(),
    Object? selectedAmountIndex = const $CopyWithPlaceholder(),
    Object? isListChanged = const $CopyWithPlaceholder(),
  }) {
    return BeneficiariesState(
      beneficiaries: beneficiaries == const $CopyWithPlaceholder()
          ? _value.beneficiaries
          // ignore: cast_nullable_to_non_nullable
          : beneficiaries as List<BeneficiariesModel>?,
      amounts: amounts == const $CopyWithPlaceholder()
          ? _value.amounts
          // ignore: cast_nullable_to_non_nullable
          : amounts as List<AmountModel>?,
      showOverlayLoading: showOverlayLoading == const $CopyWithPlaceholder() ||
              showOverlayLoading == null
          ? _value.showOverlayLoading
          // ignore: cast_nullable_to_non_nullable
          : showOverlayLoading as bool,
      selectedBeneficiaryIndex:
          selectedBeneficiaryIndex == const $CopyWithPlaceholder() ||
                  selectedBeneficiaryIndex == null
              ? _value.selectedBeneficiaryIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedBeneficiaryIndex as int,
      selectedAmountIndex:
          selectedAmountIndex == const $CopyWithPlaceholder() ||
                  selectedAmountIndex == null
              ? _value.selectedAmountIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedAmountIndex as int,
      isListChanged:
          isListChanged == const $CopyWithPlaceholder() || isListChanged == null
              ? _value.isListChanged
              // ignore: cast_nullable_to_non_nullable
              : isListChanged as bool,
    );
  }
}

extension $BeneficiariesStateCopyWith on BeneficiariesState {
  /// Returns a callable class that can be used as follows: `instanceOfBeneficiariesState.copyWith(...)` or like so:`instanceOfBeneficiariesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BeneficiariesStateCWProxy get copyWith =>
      _$BeneficiariesStateCWProxyImpl(this);
}
