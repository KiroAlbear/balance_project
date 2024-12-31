import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends UseCase<HomeModel, HomeUseCaseParams> {
  final HomeRepo _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeModel>> call(HomeUseCaseParams params) {
    return _repository.getHome();
  }
}

class HomeUseCaseParams {
  final int number;
  HomeUseCaseParams(this.number);
}
