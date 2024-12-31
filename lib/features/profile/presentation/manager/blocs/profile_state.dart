import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'profile_state.g.dart';

@CopyWith()
class ProfileState extends ParentState {
  int? number = 0;
  ProfileState({this.number});
}

@CopyWith()
class ProfileAnotherState extends ParentState {
  int? number = 0;

  ProfileAnotherState({this.number});
}
