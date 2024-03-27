abstract class AssetsProvider {
  String get iconBolt;
  String get iconPig;
  String get iconPlug;
  String get iconRecharging;
  String get iconUnplugged;
  String get imageVolvoEx30;
  String get imageVolvoEx40;
  String get imagePolestar2;
  String get batteryNipple;
}

class AssetsProviderImpl implements AssetsProvider {
  @override
  String get iconBolt => 'assets/icons/icon_bolt.svg';

  @override
  String get iconPig => 'assets/icons/icon_pig.svg';

  @override
  String get iconPlug => 'assets/icons/icon_plug.svg';

  @override
  String get iconRecharging => 'assets/icons/icon_recharging.svg';

  @override
  String get iconUnplugged => 'assets/icons/icon_unplugged.svg';

  @override
  String get imageVolvoEx30 => 'assets/images/volvo_ex30.png';

  @override
  String get imageVolvoEx40 => 'assets/images/volvo_ex40.png';

  @override
  String get imagePolestar2 => 'assets/images/polestar2.png';

  @override
  String get batteryNipple => 'assets/battery_nipple.svg';
}
