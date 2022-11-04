import 'package:flutter/material.dart';
import 'package:nursing_home/config/config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.widget,
    required this.color,
    required this.onBtnSelected,
  });

  final Widget widget;
  final Color color;
  final VoidCallback onBtnSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: size),
      child: GestureDetector(
        onTap: onBtnSelected,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: size * 5.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(size)),
          ),
          child: widget,
        ),
      ),
    );
  }
}
