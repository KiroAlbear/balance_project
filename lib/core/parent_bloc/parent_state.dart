import 'package:balance_project/imports.dart';

// enum Status { initial, loading, success, empty, error }

class ParentState {
  Status? status = Status.loading;
  Status savingStatus;
  String errorMessage;

  ParentState(
      {this.status,
      this.savingStatus = Status.initial,
      this.errorMessage = ""});
}
