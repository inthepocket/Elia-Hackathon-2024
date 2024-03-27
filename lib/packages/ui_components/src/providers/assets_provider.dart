abstract class AssetsProvider {
  String get iconBolt;
}

class AssetsProviderImpl implements AssetsProvider {
  @override
  String get iconBolt => 'assets/icons/icon_bolt.svg';
}
