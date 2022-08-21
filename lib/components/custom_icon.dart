import 'package:crypto_trading_ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Widget icon;

  const CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, -1),
            color: Colors.white38,
          ),
          BoxShadow(
            offset: Offset(-1, 1),
            color: Color(0xFF182233),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}
