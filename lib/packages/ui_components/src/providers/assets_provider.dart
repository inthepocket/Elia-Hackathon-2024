abstract class AssetsProvider {
  String get iconBolt;
  String get imageVolvoEx30;
  String get imageVolvoEx40;
  String get imagePolestar2;
}

class AssetsProviderImpl implements AssetsProvider {
  @override
  String get iconBolt => 'assets/icons/icon_bolt.svg';

  @override
  String get imageVolvoEx30 => 'assets/images/volvo_ex30.png';

  @override
  String get imageVolvoEx40 => 'assets/images/volvo_ex40.png';

  @override
  String get imagePolestar2 => 'assets/images/polestar_2.png';
}
