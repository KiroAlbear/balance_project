import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class BeneficiariesRepo {
  Future<Either<Failure, BeneficiariesModel>> getBeneficiaries();
}
