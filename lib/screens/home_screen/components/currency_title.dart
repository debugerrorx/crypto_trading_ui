import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CurrencyTitle extends StatelessWidget {
  final String code;
  final String name;

  const CurrencyTitle({
    Key? key,
    required this.code,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          code,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            color: kSecondaryTextColor,
          ),
        ),
      ],
    );
  }
}
