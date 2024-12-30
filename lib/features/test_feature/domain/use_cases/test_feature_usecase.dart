import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class TestFeatureUseCase
    extends UseCase<TestFeatureModel, TestFeatureUseCaseParams> {
  final TestFeatureRepo _repository;

  TestFeatureUseCase(this._repository);

  @override
  Future<Either<Failure, TestFeatureModel>> call(
      TestFeatureUseCaseParams params) {
    return _repository.getTestFeature();
  }
}

class TestFeatureUseCaseParams {
  final int number;
  TestFeatureUseCaseParams(this.number);
}
