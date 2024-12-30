import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'beneficiaries_state.g.dart';

@CopyWith()
class BeneficiariesState extends ParentState {
  int? number = 0;
  BeneficiariesState({this.number});
}

@CopyWith()
class BeneficiariesAnotherState extends ParentState {
  int? number = 0;

  BeneficiariesAnotherState({this.number});
}
