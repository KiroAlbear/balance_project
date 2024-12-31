import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => <Object>[];
}

class getProfileEvent extends ProfileEvent {
  final int number;
  const getProfileEvent(this.number);

  @override
  List<Object> get props => <Object>[number];
}
