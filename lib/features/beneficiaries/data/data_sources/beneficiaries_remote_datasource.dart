import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries();
}

class BeneficiariesRemoteDataSourceImpl extends ApiHelper
    implements BeneficiariesRemoteDataSource {
  @override
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries() async {
    return fetchData<List<BeneficiariesModel>, BeneficiariesModel>(
      Urls.getAllBeneficiaries,
      responseConverter: BeneficiariesModel.fromJson,
    );
  }
}
