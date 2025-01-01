import 'dart:async';

import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  BeneficiariesUseCase beneficiariesUseCase;
  BeneficiariesBloc(this.beneficiariesUseCase) : super(BeneficiariesState()) {
    on<getBeneficiariesEvent>(_getBeneficiaries);
  }

  FutureOr<void> _getBeneficiaries(
      getBeneficiariesEvent event, Emitter<ParentState> emit) async {
    // in case of loading
    emit(state.copyWith()..status = Status.loading);

    Either<Failure, List<BeneficiariesModel>> result =
        await beneficiariesUseCase.call(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (List<BeneficiariesModel> beneficiaries) {
        emit(state.copyWith(beneficiaries: beneficiaries)
          ..status = Status.success);
      },
    );
  }
}
