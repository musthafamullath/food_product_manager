import 'package:flutter/material.dart';


class DayNightWidget extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  final Icon? icon;
  const DayNightWidget({
    super.key,
    this.color,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Center(child: icon)),
      );
    
  }
}
