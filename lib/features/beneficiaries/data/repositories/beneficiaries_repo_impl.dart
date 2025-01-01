import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

class BeneficiariesRepoImp implements BeneficiariesRepo {
  final BeneficiariesRemoteDataSource _dataSource;
  BeneficiariesRepoImp(this._dataSource);

  @override
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries() async {
    return _dataSource.getBeneficiaries();
  }
}
