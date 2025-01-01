import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => <Object>[];
}

class getHomeBalanceEvent extends HomeEvent {
  const getHomeBalanceEvent();

  @override
  List<Object> get props => <Object>[];
}

class addHomeBalanceEvent extends HomeEvent {
  final String balance;
  const addHomeBalanceEvent(this.balance);

  @override
  List<Object> get props => <Object>[balance];
}
