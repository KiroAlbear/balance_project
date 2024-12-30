import 'dart:async';

import 'package:balance_project/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  BeneficiariesBloc() : super(BeneficiariesState()) {
    on<getBeneficiariesEvent>(_getBeneficiaries);
  }

  FutureOr<void> _getBeneficiaries(
      getBeneficiariesEvent event, Emitter<ParentState> emit) async {
    // in case of loading
    emit(state.copyWith()..status = Status.loading);

    await Future.delayed(const Duration(seconds: 1));

    // in case of success
    emit(state.copyWith(number: 5)..status = Status.success);

    // in case of failure
    // emit(state.copyWith()
    //   ..status = Status.error
    //   ..errorMessage = "Problem has happened");
  }
}
