import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class BeneficiariesUseCase extends UseCase<List<BeneficiariesModel>, NoParams> {
  final BeneficiariesRepo _repository;

  BeneficiariesUseCase(this._repository);

  @override
  Future<Either<Failure, List<BeneficiariesModel>>> call(NoParams params) {
    return _repository.getBeneficiaries();
  }
}
