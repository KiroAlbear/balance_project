import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'beneficiaries_state.g.dart';

@CopyWith()
class BeneficiariesState extends ParentState {
  List<BeneficiariesModel>? beneficiaries;
  bool isListChanged = false;

  BeneficiariesState({this.beneficiaries, this.isListChanged = false});
}
