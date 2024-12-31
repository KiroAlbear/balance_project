import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'home_state.g.dart';

@CopyWith()
class HomeState extends ParentState {
  int? number = 0;
  HomeState({this.number});
}

@CopyWith()
class HomeAnotherState extends ParentState {
  int? number = 0;

  HomeAnotherState({this.number});
}
