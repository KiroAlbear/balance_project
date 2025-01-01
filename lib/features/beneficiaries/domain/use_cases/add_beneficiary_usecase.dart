import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class AddBeneficiaryUseCase
    extends UseCase<ApiResponseModel, AddBeneficiaryUseCaseParams> {
  final BeneficiariesRepo _repository;

  AddBeneficiaryUseCase(this._repository);

  @override
  Future<Either<Failure, ApiResponseModel>> call(
      AddBeneficiaryUseCaseParams params) {
    return _repository.addBeneficiary(AddBeneficiariesRequestModel(
        name: params.name, phoneNumber: params.phoneNumber));
  }
}

class AddBeneficiaryUseCaseParams {
  final String name;
  final String phoneNumber;
  AddBeneficiaryUseCaseParams({required this.name, required this.phoneNumber});
}
