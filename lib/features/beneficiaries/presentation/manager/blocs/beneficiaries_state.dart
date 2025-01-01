import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'beneficiaries_state.g.dart';

@CopyWith()
class BeneficiariesState extends ParentState {
  List<BeneficiariesModel>? beneficiaries;
  int selectedBeneficiaryIndex;
  bool isListChanged = false;
  bool showOverlayLoading;
  BeneficiariesState(
      {this.beneficiaries,
      this.showOverlayLoading = false,
      this.selectedBeneficiaryIndex = -1,
      this.isListChanged = false});
}
