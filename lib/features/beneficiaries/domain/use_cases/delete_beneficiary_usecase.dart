import 'package:balance_project/features/beneficiaries/data/models/delete_beneficiary_request_model.dart';
import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class DeleteBeneficiaryUseCase
    extends UseCase<ApiResponseModel, DeleteBeneficiaryUseCaseParams> {
  final BeneficiariesRepo _repository;

  DeleteBeneficiaryUseCase(this._repository);

  @override
  Future<Either<Failure, ApiResponseModel>> call(
      DeleteBeneficiaryUseCaseParams params) {
    return _repository.deleteBeneficiary(
        DeleteBeneficiaryRequestModel(phoneNumber: params.phoneNumber));
  }
}

class DeleteBeneficiaryUseCaseParams {
  final String phoneNumber;
  DeleteBeneficiaryUseCaseParams({required this.phoneNumber});
}
