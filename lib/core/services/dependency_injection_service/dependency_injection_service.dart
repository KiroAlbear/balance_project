import 'package:balance_project/features/beneficiaries/data/data_sources/beneficiaries_remote_datasource.dart';
import 'package:balance_project/features/beneficiaries/data/repositories/beneficiaries_repo_impl.dart';
import 'package:balance_project/features/beneficiaries/domain/repositories/beneficiaries_repo.dart';
import 'package:balance_project/features/beneficiaries/domain/use_cases/add_beneficiary_usecase.dart';
import 'package:balance_project/features/beneficiaries/domain/use_cases/beneficiaries_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjectionService {
  dynamic init() async {
    getIt.registerSingleton<BeneficiariesRemoteDataSource>(
        BeneficiariesRemoteDataSourceImpl());

    getIt.registerSingleton<BeneficiariesRepo>(BeneficiariesRepoImp(getIt()));

    getIt
        .registerSingleton<BeneficiariesUseCase>(BeneficiariesUseCase(getIt()));

    getIt.registerSingleton<AddBeneficiaryUseCase>(
        AddBeneficiaryUseCase(getIt()));
  }
}
