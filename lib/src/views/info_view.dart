import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/utils/codes.dart';
import 'package:kura/src/utils/color.dart';
import 'package:kura/src/utils/strings.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    _buildButtons(String label, InfoAction action) => RaisedButton(
          child: Text(label),
          onPressed: () => bloc.handleInfoAction.add(action),
          color: COLOR_PRIMARY,
          textColor: COLOR_TEXT,
        );

    final _titleSection = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Title(
        child: Text(
          appInfoText,
          style: TextStyle(
            fontSize: 32,
            decoration: TextDecoration.underline,
            // decorationStyle: TextDecorationStyle.wavy
          ),
        ),
        color: COLOR_PRIMARY,
      ),
    );

    _buildDescs(String title, String subtitle) => ListTile(
          title: Text(title, style: TextStyle(color: COLOR_PRIMARY_DARK),),
          subtitle: Text(subtitle),
        );

    final _actions = Column(
      children: <Widget>[
        FittedBox(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButtons(callText, InfoAction.call),
              _buildButtons(emailText, InfoAction.email),
            ],
          ),
        ),
        _buildButtons(moreText, InfoAction.more)
      ],
    );

    return Column(
      children: <Widget>[
        _titleSection,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildDescs(descriptionText, appDescriptionText),
              _buildDescs(aboutDevText, aboutDevDescText),
              _actions
            ],
          ),
        )
      ],
    );
  }
}
