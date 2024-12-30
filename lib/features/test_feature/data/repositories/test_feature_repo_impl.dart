import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class TestFeatureRepoImp implements TestFeatureRepo {
  final TestFeatureRemoteDataSource _dataSource;
  TestFeatureRepoImp(this._dataSource);

  @override
  Future<Either<Failure, TestFeatureModel>> getTestFeature() async {
    return _dataSource.getTestFeature();
  }
}
