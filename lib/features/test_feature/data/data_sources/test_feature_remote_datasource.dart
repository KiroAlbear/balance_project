import 'package:balance_project/imports.dart';
import 'package:balance_project/features/test_feature/data/models/test_feature_model.dart';
import 'package:dartz/dartz.dart';

abstract class TestFeatureRemoteDataSource {
  Future<Either<Failure, TestFeatureModel>> getTestFeature();
}

class TestFeatureRemoteDataSourceImpl extends ApiHelper
    implements TestFeatureRemoteDataSource {
  @override
  Future<Either<Failure, TestFeatureModel>> getTestFeature() async {
    return fetchData<TestFeatureModel, Object>(
      "exampleURL",
      responseConverter: TestFeatureModel.fromJson,
    );
  }
}
