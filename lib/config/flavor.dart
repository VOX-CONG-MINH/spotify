enum Flavor { development, staging, production }

extension FlavorName on Flavor {
  String get name {
    switch (this) {
      case Flavor.development:
        return 'Development';
      case Flavor.staging:
        return 'Staging';
      case Flavor.production:
        return 'Production';
    }
  }
}
