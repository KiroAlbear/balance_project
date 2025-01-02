import 'package:balance_project/core/services/cache_service/secure_storage_keys.dart';
import 'package:balance_project/core/services/cache_service/secure_storage_service.dart';
import 'package:balance_project/core/services/dependency_injection_service/dependency_injection_service.dart';
import 'package:balance_project/features/beneficiaries/presentation/bloc/beneficiaries_bloc.dart';
import 'package:balance_project/features/beneficiaries/presentation/bloc/beneficiaries_event.dart';
import 'package:balance_project/features/beneficiaries/presentation/bloc/beneficiaries_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements SecureStorageService {}

void main() async {
  // testWidgets(
  //   "testing beneficiaries_bloc",
  //   (widgetTester) async {},
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjectionService().init();

  group(
    "Beneficiaries Bloc Testing",
    () {
      blocTest<BeneficiariesBloc, BeneficiariesState>(
        "testing, insufficient balance",
        build: () {
          final mockStorage = MockFlutterSecureStorage();

          when(() => mockStorage.getValue(SecureStorageKeys.userBalance))
              .thenAnswer((_) async => "");

          when(() => mockStorage.getValue(SecureStorageKeys.isUserVerified))
              .thenAnswer((_) async => "");

          when(() =>
                  mockStorage.getValue(SecureStorageKeys.beneficiariesAmounts))
              .thenAnswer((_) async => "");

          return BeneficiariesBloc(getIt(), getIt(), getIt(), mockStorage);
        },
        act: (bloc) {
          bloc.add(
              payBeneficiaryEvent(phoneNumber: "01272911668", amount: "500"));

          // bloc.add(selectBeneficiaryEvent(selectedIndex: 0));
        },
        expect: () {
          return [
            BeneficiariesState(
              isPaymentSuccess: false,
              showErrorMessage: true,
            ),
          ];
        },
      );

      blocTest<BeneficiariesBloc, BeneficiariesState>(
        "testing, can't pay more than 500 AED, not verified user",
        build: () {
          final mockStorage = MockFlutterSecureStorage();

          when(() => mockStorage.getValue(SecureStorageKeys.userBalance))
              .thenAnswer((_) async => "5000");

          when(() => mockStorage.getValue(SecureStorageKeys.isUserVerified))
              .thenAnswer((_) async => "false");

          when(() =>
                  mockStorage.getValue(SecureStorageKeys.beneficiariesAmounts))
              .thenAnswer((_) async => "");

          return BeneficiariesBloc(getIt(), getIt(), getIt(), mockStorage);
        },
        act: (bloc) {
          bloc.add(
              payBeneficiaryEvent(phoneNumber: "01272911668", amount: "501"));

          // bloc.add(selectBeneficiaryEvent(selectedIndex: 0));
        },
        expect: () {
          return [
            BeneficiariesState(
              isPaymentSuccess: false,
              showErrorMessage: true,
            ),
          ];
        },
      );

      blocTest<BeneficiariesBloc, BeneficiariesState>(
        "testing, can't pay more than 1000 AED, verified user",
        build: () {
          final mockStorage = MockFlutterSecureStorage();

          when(() => mockStorage.getValue(SecureStorageKeys.userBalance))
              .thenAnswer((_) async => "5000");

          when(() => mockStorage.getValue(SecureStorageKeys.isUserVerified))
              .thenAnswer((_) async => "true");

          when(() =>
                  mockStorage.getValue(SecureStorageKeys.beneficiariesAmounts))
              .thenAnswer((_) async => "");

          return BeneficiariesBloc(getIt(), getIt(), getIt(), mockStorage);
        },
        act: (bloc) {
          bloc.add(
              payBeneficiaryEvent(phoneNumber: "01272911668", amount: "1001"));

          // bloc.add(selectBeneficiaryEvent(selectedIndex: 0));
        },
        expect: () {
          return [
            BeneficiariesState(
              isPaymentSuccess: false,
              showErrorMessage: true,
            ),
          ];
        },
      );

      blocTest<BeneficiariesBloc, BeneficiariesState>(
        "testing, can't pay more than 3000 AED for all beneficiaries",
        build: () {
          final mockStorage = MockFlutterSecureStorage();

          when(() => mockStorage.getValue(SecureStorageKeys.userBalance))
              .thenAnswer((_) async => "5000");

          when(() => mockStorage.getValue(SecureStorageKeys.isUserVerified))
              .thenAnswer((_) async => "true");

          when(() =>
                  mockStorage.getValue(SecureStorageKeys.beneficiariesAmounts))
              .thenAnswer((_) async =>
                  "{" "\"01272911668\":\"3000#2021-09-01 00:00:00.000\"}");

          return BeneficiariesBloc(getIt(), getIt(), getIt(), mockStorage);
        },
        act: (bloc) {
          bloc.add(
              payBeneficiaryEvent(phoneNumber: "01272911668", amount: "5"));

          // bloc.add(selectBeneficiaryEvent(selectedIndex: 0));
        },
        expect: () {
          return [
            BeneficiariesState(
              isPaymentSuccess: false,
              showErrorMessage: true,
            ),
          ];
        },
      );
    },
  );
}
