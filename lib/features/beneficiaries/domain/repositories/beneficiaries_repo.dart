import 'package:balance_project/features/beneficiaries/data/models/delete_beneficiary_request_model.dart';
import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class BeneficiariesRepo {
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries();
  Future<Either<Failure, ApiResponseModel>> addBeneficiary(
      AddBeneficiariesRequestModel requestModel);

  Future<Either<Failure, ApiResponseModel>> deleteBeneficiary(
      DeleteBeneficiaryRequestModel requestModel);
}
