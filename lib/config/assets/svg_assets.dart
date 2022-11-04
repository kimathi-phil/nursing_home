class SvgAssets {
  const SvgAssets._();

  static String get logo => 'logo'.svg;
}

extension on String {
  String get svg => 'assets/svg/$this.svg';
}
