import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersService {
  List<BlocProvider> getAppProviders(BuildContext context) {
    return [
      BlocProvider<BeneficiariesBloc>(
        create: (_) => BeneficiariesBloc(getIt()),
      ),
    ];
  }
}
