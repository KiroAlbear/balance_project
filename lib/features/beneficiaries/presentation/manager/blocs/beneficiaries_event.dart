import 'package:equatable/equatable.dart';

abstract class BeneficiariesEvent extends Equatable {
  const BeneficiariesEvent();
  @override
  List<Object> get props => <Object>[];
}

class getBeneficiariesEvent extends BeneficiariesEvent {
  final bool showOverlayLoading;
  const getBeneficiariesEvent({this.showOverlayLoading = false});

  @override
  List<Object> get props => <Object>[];
}

class getAmountEvent extends BeneficiariesEvent {
  const getAmountEvent();

  @override
  List<Object> get props => <Object>[];
}

class selectAmountEvent extends BeneficiariesEvent {
  final int selectedIndex;
  const selectAmountEvent({required this.selectedIndex});

  @override
  List<Object> get props => <Object>[selectedIndex];
}

class addBeneficiaryEvent extends BeneficiariesEvent {
  final String name;
  final String phoneNumber;
  const addBeneficiaryEvent({required this.name, required this.phoneNumber});

  @override
  List<Object> get props => <Object>[name, phoneNumber];
}

class selectBeneficiaryEvent extends BeneficiariesEvent {
  final int selectedIndex;
  const selectBeneficiaryEvent({required this.selectedIndex});

  @override
  List<Object> get props => <Object>[selectedIndex];
}

class deleteBeneficiaryEvent extends BeneficiariesEvent {
  final String phoneNumber;
  const deleteBeneficiaryEvent({required this.phoneNumber});

  @override
  List<Object> get props => <Object>[phoneNumber];
}
