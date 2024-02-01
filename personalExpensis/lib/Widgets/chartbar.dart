import 'package:flutter/material.dart';
class charbar extends StatelessWidget {
  const charbar({super.key, required this.fill});
 final double fill;
  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child:
      FractionallySizedBox(
        heightFactor: fill,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary
          ),
        ),
      ),
    )
    );
  }
}
