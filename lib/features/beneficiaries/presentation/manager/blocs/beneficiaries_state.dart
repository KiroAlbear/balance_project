import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'beneficiaries_state.g.dart';

@CopyWith()
class BeneficiariesState extends ParentState {
  List<BeneficiariesModel>? beneficiaries;
  List<AmountModel>? amounts;
  int selectedAmountIndex;
  int selectedBeneficiaryIndex;
  bool isListChanged = false;
  bool showOverlayLoading;
  BeneficiariesState(
      {this.beneficiaries,
      this.amounts,
      this.showOverlayLoading = false,
      this.selectedBeneficiaryIndex = -1,
      this.selectedAmountIndex = -1,
      this.isListChanged = false});
}
