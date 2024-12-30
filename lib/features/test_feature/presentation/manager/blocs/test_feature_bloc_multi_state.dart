import 'dart:async';

import 'package:balance_project/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestFeatureBlocMultiStates extends Bloc<TestFeatureEvent, ParentState> {
  TestFeatureBlocMultiStates() : super(TestFeatureAnotherState()) {
    on<getTestFeatureEvent>(_getTestFeature);
  }

  FutureOr<void> _getTestFeature(
      getTestFeatureEvent event, Emitter<ParentState> emit) async {
    // in case of loading

    /// you can write this line
    // emit(ParentState(status: Status.loading));
    /// or this line
    emit(TestFeatureAnotherState()..status = Status.loading);

    await Future.delayed(const Duration(seconds: 1));
    emit(TestFeatureAnotherState(number: 13)..status = Status.success);
    // in case of success
    // emit(state.copyWith(number: 5)..status = Status.success);

    // in case of failure
    // emit(state.copyWith()
    //   ..status = Status.error
    //   ..errorMessage = "Problem has happened");
  }
}
