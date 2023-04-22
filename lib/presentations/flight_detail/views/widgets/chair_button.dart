import 'package:flutter/material.dart';

import '../../../../core/config/color_config.dart';

class ChairButton extends StatelessWidget {
  const ChairButton({
    super.key,
    required this.chairCharacyer,
    required this.text,
    required this.check,
  });

  final List<String> chairCharacyer;
  final String text;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:
              check ? Theme.of(context).hoverColor : CommonColor.primaryColor,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}