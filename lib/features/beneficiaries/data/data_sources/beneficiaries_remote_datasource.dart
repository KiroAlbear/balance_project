import 'package:balance_project/imports.dart';
import 'package:balance_project/features/test_feature/data/models/test_feature_model.dart';
import 'package:dartz/dartz.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<Either<Failure, BeneficiariesModel>> getBeneficiaries();
}

class BeneficiariesRemoteDataSourceImpl extends ApiHelper
    implements BeneficiariesRemoteDataSource {
  @override
  Future<Either<Failure, BeneficiariesModel>> getBeneficiaries() async {
    return fetchData<BeneficiariesModel, Object>(
      "exampleURL",
      responseConverter: BeneficiariesModel.fromJson,
    );
  }
}
