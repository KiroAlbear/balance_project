import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource _dataSource;
  HomeRepoImp(this._dataSource);

  @override
  Future<Either<Failure, HomeModel>> getHome() async {
    return _dataSource.getHome();
  }
}
