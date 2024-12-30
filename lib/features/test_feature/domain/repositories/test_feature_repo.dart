import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class TestFeatureRepo {
  Future<Either<Failure, TestFeatureModel>> getTestFeature();
}
