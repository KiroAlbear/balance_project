import 'package:balance_project/features/beneficiaries/data/models/delete_beneficiary_request_model.dart';
import 'package:balance_project/imports.dart';
import 'package:dartz/dartz.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<Either<Failure, List<BeneficiariesModel>>> getBeneficiaries();
  Future<Either<Failure, ApiResponseModel>> addBeneficiary(
      AddBeneficiariesRequestModel requestModel);

  Future<Either<Failure, ApiResponseModel>> deleteBeneficiary(
      DeleteBeneficiaryRequestModel requestModel);
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

  @override
  Future<Either<Failure, ApiResponseModel>> addBeneficiary(
      AddBeneficiariesRequestModel requestModel) {
    return postData<ApiResponseModel>(
      Urls.addBeneficiary,
      body: requestModel.toJson(),
      responseConverter: ApiResponseModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, ApiResponseModel>> deleteBeneficiary(
      DeleteBeneficiaryRequestModel requestModel) {
    return postData<ApiResponseModel>(
      Urls.deleteOneBeneficiary,
      body: requestModel.toJson(),
      responseConverter: ApiResponseModel.fromJson,
    );
  }
}
