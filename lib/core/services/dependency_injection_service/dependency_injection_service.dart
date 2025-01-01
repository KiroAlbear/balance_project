import 'package:balance_project/imports.dart';
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

    getIt.registerSingleton<DeleteBeneficiaryUseCase>(
        DeleteBeneficiaryUseCase(getIt()));
  }
}
