import 'dart:async';

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
  }

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
}
