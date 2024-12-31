import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, HomeModel>> getHome();
}

class HomeRemoteDataSourceImpl extends ApiHelper
    implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, HomeModel>> getHome() async {
    return fetchData<HomeModel, Object>(
      "exampleURL",
      responseConverter: HomeModel.fromJson,
    );
  }
}
