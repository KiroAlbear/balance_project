import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class BeneficiariesUseCase
    extends UseCase<BeneficiariesModel, BeneficiariesUseCaseParams> {
  final BeneficiariesRepo _repository;

  BeneficiariesUseCase(this._repository);

  @override
  Future<Either<Failure, BeneficiariesModel>> call(
      BeneficiariesUseCaseParams params) {
    return _repository.getBeneficiaries();
  }
}

class BeneficiariesUseCaseParams {
  final int number;
  BeneficiariesUseCaseParams(this.number);
}
