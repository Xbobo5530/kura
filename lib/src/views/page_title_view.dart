import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/utils/color.dart';
import 'package:kura/src/utils/strings.dart';

class PageTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: COLOR_PRIMARY,
      child: StreamBuilder<String>(
          initialData: homeText,
          stream: bloc.currentPageTitle,
          builder: (context, snapshot) => Center(
                  child: Text(
                snapshot.data,
                style: TextStyle(
                  color: COLOR_TEXT,
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),
              ))),
    );
  }
}
