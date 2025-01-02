import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'home_state.g.dart';

@CopyWith()
class HomeState extends ParentState {
  String? homeBalance;
  bool isUserVerified;
  HomeState({this.homeBalance, this.isUserVerified = false});
}
