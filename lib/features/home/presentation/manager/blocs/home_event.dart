import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => <Object>[];
}

class getHomeEvent extends HomeEvent {
  final int number;
  const getHomeEvent(this.number);

  @override
  List<Object> get props => <Object>[number];
}
