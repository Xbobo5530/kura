import 'package:flutter/material.dart';
import 'package:kura/src/utils/color.dart';

class TagItemView extends StatelessWidget {
  final String  tag;

  const TagItemView({Key key, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Text(tag),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: COLOR_PRIMARY),
              borderRadius: BorderRadius.circular(20)),
        ));
  }
}