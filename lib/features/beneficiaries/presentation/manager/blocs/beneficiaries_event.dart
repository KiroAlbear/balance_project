import 'package:equatable/equatable.dart';

abstract class BeneficiariesEvent extends Equatable {
  const BeneficiariesEvent();
  @override
  List<Object> get props => <Object>[];
}

class getBeneficiariesEvent extends BeneficiariesEvent {
  const getBeneficiariesEvent();

  @override
  List<Object> get props => <Object>[];
}
