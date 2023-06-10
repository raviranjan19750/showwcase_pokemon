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
