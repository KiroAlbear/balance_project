class EnvironmentConfig {
  static const DEV_ENVIRONMENT_ENUM DEV_ENVIRONMENT = DEV_ENVIRONMENT_ENUM.Development;

  static bool isProductionEnv() {
    return EnvironmentConfig.DEV_ENVIRONMENT == DEV_ENVIRONMENT_ENUM.Production;
  }
}

// ignore: camel_case_types
enum DEV_ENVIRONMENT_ENUM { Development, Production }
