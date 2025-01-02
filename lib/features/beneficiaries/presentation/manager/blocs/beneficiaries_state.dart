import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'beneficiaries_state.g.dart';

@CopyWith()
class BeneficiariesState extends ParentState {
  List<BeneficiariesModel>? beneficiaries;
  List<AmountModel>? amounts;
  int selectedAmountIndex;
  int selectedBeneficiaryIndex;
  int totalAmount = 0;
  int totalAmountWithoutFees = 0;
  bool isListChanged = false;
  bool showOverlayLoading;
  bool isPaymentSuccess;
  BeneficiariesState(
      {this.beneficiaries,
      this.amounts,
      this.totalAmount = 0,
      this.totalAmountWithoutFees = 0,
      this.showOverlayLoading = false,
      this.isPaymentSuccess = false,
      this.selectedBeneficiaryIndex = -1,
      this.selectedAmountIndex = -1,
      this.isListChanged = false});
}
