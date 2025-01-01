import 'package:balance_project/features/beneficiaries/data/models/delete_beneficiary_request_model.dart';
import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class BeneficiariesRepoImp implements BeneficiariesRepo {
  final BeneficiariesRemoteDataSource _dataSource;
  BeneficiariesRepoImp(this._dataSource);

  @override
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries() async {
    return _dataSource.getBeneficiaries();
  }

  @override
  Future<Either<Failure, ApiResponseModel>> addBeneficiary(
      AddBeneficiariesRequestModel requestModel) {
    return _dataSource.addBeneficiary(requestModel);
  }

  @override
  Future<Either<Failure, ApiResponseModel>> deleteBeneficiary(
      DeleteBeneficiaryRequestModel requestModel) {
    return _dataSource.deleteBeneficiary(requestModel);
  }
}
