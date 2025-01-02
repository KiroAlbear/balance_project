import 'dart:async';

import 'package:balance_project/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<getHomeBalanceEvent>(_getHomeBalance);
    on<addHomeBalanceEvent>(_addHomeBalance);
    on<getUserVerificationEvent>(_getUserVerification);
    on<addUserVerificationEvent>(_addUserVerification);
  }

  FutureOr<void> _getHomeBalance(
      getHomeBalanceEvent event, Emitter<ParentState> emit) async {
    // in case of loading
    emit(state.copyWith()..status = Status.loading);

    String homeBalance = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.userBalance);

    int? homeBalanceValue = int.tryParse(homeBalance);

    if (homeBalanceValue == null) {
      emit(state.copyWith(homeBalance: "0")..status = Status.success);
    } else {
      emit(state.copyWith(homeBalance: homeBalance)..status = Status.success);
    }
  }

  FutureOr<void> _addHomeBalance(
      addHomeBalanceEvent event, Emitter<HomeState> emit) async {
    await SecureStorageService.getInstance()
        .setValue(SecureStorageKeys.userBalance, event.balance);

    add(getHomeBalanceEvent());
  }

  FutureOr<void> _getUserVerification(
      getUserVerificationEvent event, Emitter<HomeState> emit) async {
    String isVerified = await SecureStorageService.getInstance()
        .getValue(SecureStorageKeys.isUserVerified);

    emit(state.copyWith(isUserVerified: isVerified == "true"));
  }

  FutureOr<void> _addUserVerification(
      addUserVerificationEvent event, Emitter<HomeState> emit) async {
    await SecureStorageService.getInstance()
        .setValue(SecureStorageKeys.isUserVerified, event.isVerified);

    emit(state.copyWith(isUserVerified: event.isVerified == "true"));
  }
}
