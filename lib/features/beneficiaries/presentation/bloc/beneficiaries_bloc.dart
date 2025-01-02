import 'dart:async';
import 'dart:convert';

import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  BeneficiariesUseCase beneficiariesUseCase;
  AddBeneficiaryUseCase addBeneficiaryUseCase;
  DeleteBeneficiaryUseCase deleteBeneficiaryUseCase;
  BeneficiariesBloc(this.beneficiariesUseCase, this.addBeneficiaryUseCase,
      this.deleteBeneficiaryUseCase)
      : super(BeneficiariesState()) {
    on<getBeneficiariesEvent>(_getBeneficiaries);
    on<addBeneficiaryEvent>(_addBeneficiary);
    on<deleteBeneficiaryEvent>(_deleteBeneficiary);
    on<selectBeneficiaryEvent>(_seleteBeneficiary);
    on<getAmountEvent>(_getAmount);
    on<selectAmountEvent>(_seleteAmount);
    on<payBeneficiaryEvent>(_payBeneficiary);
  }

  final List<AmountModel> amounts = [
    AmountModel(amount: 5),
    AmountModel(amount: 10),
    AmountModel(amount: 20),
    AmountModel(amount: 30),
    AmountModel(amount: 50),
    AmountModel(amount: 75),
    AmountModel(amount: 100),
    AmountModel(amount: 500),
    AmountModel(amount: 1000),
  ];

  FutureOr<void> _getBeneficiaries(
      getBeneficiariesEvent event, Emitter<ParentState> emit) async {
    // in case of loading
    if (event.showOverlayLoading == true)
      emit(state.copyWith(showOverlayLoading: true)..status = Status.success);
    else {
      emit(state.copyWith(showOverlayLoading: false)..status = Status.loading);
    }
    // if (event.isFiringFromDelete == false)
    // await Future.delayed(Duration(seconds: 1));

    Either<Failure, List<BeneficiariesModel>> result =
        await beneficiariesUseCase.call(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(showOverlayLoading: false)
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (List<BeneficiariesModel> beneficiaries) {
        if (beneficiaries.isEmpty) {
          emit(state.copyWith(
            showOverlayLoading: false,
            isListChanged: !state.isListChanged,
            beneficiaries: beneficiaries,
          )..status = Status.empty);
        } else {
          emit(state.copyWith(
            showOverlayLoading: false,
            beneficiaries: beneficiaries,
            isListChanged: !state.isListChanged,
          )..status = Status.success);
        }
      },
    );
  }

  FutureOr<void> _addBeneficiary(
      addBeneficiaryEvent event, Emitter<BeneficiariesState> emit) async {
    emit(state.copyWith(showOverlayLoading: false)..status = Status.loading);

    Either<Failure, ApiResponseModel> result = await addBeneficiaryUseCase.call(
        AddBeneficiaryUseCaseParams(
            name: event.name, phoneNumber: event.phoneNumber));

    result.fold(
      (failure) {
        emit(
            state.copyWith(showOverlayLoading: false)..status = Status.success);
        AppToast.showToast(failure.toErrorModel().message);
      },
      (ApiResponseModel result) {
        add(getBeneficiariesEvent(showOverlayLoading: false));
      },
    );
  }

  FutureOr<void> _deleteBeneficiary(
      deleteBeneficiaryEvent event, Emitter<BeneficiariesState> emit) async {
    Either<Failure, ApiResponseModel> result = await deleteBeneficiaryUseCase
        .call(DeleteBeneficiaryUseCaseParams(phoneNumber: event.phoneNumber));
    emit(state.copyWith(showOverlayLoading: true)..status = Status.success);
    result.fold(
      (failure) {
        emit(
            state.copyWith(showOverlayLoading: false)..status = Status.success);
        AppToast.showToast(failure.toErrorModel().message);
      },
      (ApiResponseModel result) {
        add(getBeneficiariesEvent(showOverlayLoading: true));
      },
    );
  }

  FutureOr<void> _seleteBeneficiary(
      selectBeneficiaryEvent event, Emitter<BeneficiariesState> emit) {
    emit(state.copyWith(selectedBeneficiaryIndex: event.selectedIndex));
  }

  FutureOr<void> _getAmount(
      getAmountEvent event, Emitter<BeneficiariesState> emit) {
    emit(state.copyWith(amounts: amounts));
  }

  FutureOr<void> _seleteAmount(
      selectAmountEvent event, Emitter<BeneficiariesState> emit) {
    if (event.selectedIndex == -1) {
      emit(state.copyWith(
          selectedAmountIndex: event.selectedIndex, isPaymentSuccess: false));
    } else {
      emit(state.copyWith(
        selectedAmountIndex: event.selectedIndex,
        totalAmountWithoutFees: amounts[event.selectedIndex].amount,
        totalAmount: amounts[event.selectedIndex].amount + 3,
      ));
    }
  }

  Future<void> testData(payBeneficiaryEvent event) async {
    String data = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.beneficiariesAmounts);

    await SecureStorageService()
        .setValue(SecureStorageKeys.beneficiariesAmounts, "");

    await SecureStorageService()
        .setValue(SecureStorageKeys.isUserVerified, "true");

    Map<String, dynamic> map = data.isEmpty ? {} : jsonDecode(data);
    map[event.phoneNumber] = "100#${DateTime.now().toString()}";
    await SecureStorageService.getInstance()
        .setValue(SecureStorageKeys.beneficiariesAmounts, jsonEncode(map));
  }

  bool _isMaximumTopUpReached(Map<String, dynamic> map, int amount) {
    int total = 0;
    map.forEach((key, value) {
      List<String> split = value.split("#");
      total += int.parse(split[0]);
    });
    return total + amount > 3000;
  }

  FutureOr<void> _payBeneficiary(
      payBeneficiaryEvent event, Emitter<BeneficiariesState> emit) async {
    // emit(state.copyWith(isPaymentSuccess: true));
    // await SecureStorageService()
    //     .setValue(SecureStorageKeys.beneficiariesAmounts, "");

    // await testData(event);

    String balance = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.userBalance);

    String isVerified = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.isUserVerified);

    int newBalance =
        balance.isEmpty ? -1 : int.parse(balance) - state.totalAmount;

    if (newBalance < 0) {
      emit(state.copyWith(isPaymentSuccess: false));
      AppToast.showToast("Insufficient balance");
      return;
    }

    String data = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.beneficiariesAmounts);

    Map<String, dynamic> map = data.isEmpty ? {} : jsonDecode(data);
    bool isNull = map[event.phoneNumber] == null;

    List<String> split = isNull ? [] : map[event.phoneNumber].split("#");
    DateTime date = isNull ? DateTime.now() : DateTime.parse(split[1]);
    int currentAmount = isNull ? 0 : int.parse(split[0]);
    bool isSameMonth = date.month == DateTime.now().month;
    int totalAfterSum = currentAmount + int.parse(event.amount);

    if (isSameMonth &&
        (isVerified.isEmpty || isVerified == "false") &&
        totalAfterSum > 500) {
      emit(state.copyWith(isPaymentSuccess: false));
      AppToast.showToast(
          "You can't pay more than 500 AED per calendar month per beneficiary");
      return;
    } else if (_isMaximumTopUpReached(map, int.parse(event.amount))) {
      emit(state.copyWith(isPaymentSuccess: false));
      AppToast.showToast(
          "You can't pay more than 3000 AED per calendar month for all beneficiaries");
    } else if (isSameMonth && (isVerified == "true") && totalAfterSum > 1000) {
      emit(state.copyWith(isPaymentSuccess: false));
      AppToast.showToast(
          "You can't pay more than 1000 AED per calendar month per beneficiary");
      return;
    } else {
      map[event.phoneNumber] = data.isEmpty
          ? "${event.amount}#${DateTime.now().toString()}"
          : "${(currentAmount + int.parse(event.amount)).toString()}#${DateTime.now().toString()}";

      await SecureStorageService.getInstance()
          .setValue(SecureStorageKeys.beneficiariesAmounts, jsonEncode(map));

      await SecureStorageService.getInstance()
          .setValue(SecureStorageKeys.userBalance, newBalance.toString());

      emit(state.copyWith(
          isPaymentSuccess: true,
          selectedAmountIndex: -1,
          selectedBeneficiaryIndex: -1));
    }
  }
}
