import 'package:flutter/material.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class CountryFlagIcon extends StatelessWidget {
  final Country? country;
  final bool showCurrency;

  const CountryFlagIcon({
    Key? key,
    this.country,
    this.showCurrency = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: SizedBox(
        width: 28,
        height: 24,
        child: showCurrency ? country?.currencySymbol.subtitle2(context) : country?.flagUrl.asSvg(
            height: 24, width: 16, fit: BoxFit.contain, fromAsset: false),
      ),
    );
  }
}
