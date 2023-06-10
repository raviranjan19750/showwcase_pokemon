

/// envrionment class where all the main components are declared as per the requirement like
/// debuf env, dev env, qa env, prod env

enum Environment { dev }

Environment currentEnvironment = Environment.dev;

extension EnvironmentMapping on Environment {
  String get scheme {
    return 'https';
  }

  String get baseUrl {
    return 'pokeapi.co';
  }

  String get apiPath {
    return 'api/v2';
  }

  int? get port {
    return null;
  }
}
