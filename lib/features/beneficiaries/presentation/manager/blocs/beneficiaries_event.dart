import 'package:equatable/equatable.dart';

abstract class BeneficiariesEvent extends Equatable {
  const BeneficiariesEvent();
  @override
  List<Object> get props => <Object>[];
}

class getBeneficiariesEvent extends BeneficiariesEvent {
  final int number;
  const getBeneficiariesEvent(this.number);

  @override
  List<Object> get props => <Object>[number];
}
