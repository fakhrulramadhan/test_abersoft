import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment Util
class EnvironmentUtil {
  static dynamic _initializedEnv;

  static initializeApp({required EnvironmentState state}) async {
    WidgetsFlutterBinding.ensureInitialized();
    DotEnv instanceDotEnv = DotEnv();

    switch (state) {
      case EnvironmentState.dev:
        await instanceDotEnv.load(fileName: 'env/.env_dev');
        _initializedEnv = instanceDotEnv.env;
        break;
      case EnvironmentState.test:
        await instanceDotEnv.load(fileName: 'env/.env_test');
        _initializedEnv = instanceDotEnv.env;
        break;
      case EnvironmentState.prod:
        await instanceDotEnv.load(fileName: 'env/.env_prod');
        _initializedEnv = instanceDotEnv.env;
        break;
      default:
        throw 'environment doesn\'t exist';
    }
  }

  static apiUrl() {
    return _initializedEnv['API_URL'];
  }

  static baseUrl() {
    return _initializedEnv['BASE_URL'];
  }
}

/// Noted:
///  Setup Environment
///  - EnvironmentState.dev
///  - EnvironmentState.test
///  - EnvironmentState.staging
///  - EnvironmentState.prod
enum EnvironmentState {
  dev,
  test,
  prod;
}
