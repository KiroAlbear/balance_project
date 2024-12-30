import 'package:equatable/equatable.dart';

abstract class TestFeatureEvent extends Equatable {
  const TestFeatureEvent();
  @override
  List<Object> get props => <Object>[];
}

class getTestFeatureEvent extends TestFeatureEvent {
  final int number;
  const getTestFeatureEvent(this.number);

  @override
  List<Object> get props => <Object>[number];
}
