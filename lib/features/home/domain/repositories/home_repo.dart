import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHome();
}
