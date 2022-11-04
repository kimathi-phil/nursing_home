import 'package:flutter/material.dart';
import 'package:nursing_home/config/config.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.iconData,
    required this.title,
    required this.onBtnSelected,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onBtnSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnSelected,
      child: Container(
        color: kPrimaryColor,
        width: double.infinity,
        height: size * 7,
        child: Material(
          color: kTransparentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: size * 2,
                color: kWhiteColor,
              ),
              const SizedBox(width: size - 2),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: kWhiteColor,
                      fontWeightDelta: 1,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
