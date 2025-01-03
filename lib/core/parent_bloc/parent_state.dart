import 'package:balance_project/imports.dart';
import 'package:equatable/equatable.dart';

// enum Status { initial, loading, success, empty, error }

class ParentState extends Equatable {
  Status? status = Status.loading;
  Status savingStatus;
  String errorMessage;

  ParentState(
      {this.status,
      this.savingStatus = Status.initial,
      this.errorMessage = ""});

  @override
  List<Object?> get props => [status, savingStatus, errorMessage];
}
