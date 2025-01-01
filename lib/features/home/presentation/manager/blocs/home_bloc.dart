import 'dart:async';

import 'package:balance_project/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<getHomeBalanceEvent>(_getHomeBalance);
    on<addHomeBalanceEvent>(_addHomeBalance);
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
}
