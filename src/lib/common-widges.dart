// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:flutter/services.dart';

class DaypartBanner extends StatelessWidget {
  final String titleText;
  final String result;
  
  const DaypartBanner({super.key, 
    required this.titleText,
    required this.result
  });

  @override
  Widget build(BuildContext context) {
    return YaruWatermark(
      watermark: const Icon(
        Icons.cloud,
        size: 100
      ),
      child: YaruBanner.tile(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: result));
          },
          title: Text(
            titleText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24
            ),
          ),
          subtitle: Text(
            result,
            style: TextStyle(
              color: Theme.of(context).hintColor
            ),),
          surfaceTintColor: Colors.pink,
        )
      );
    }
}

class Hyperlink extends StatelessWidget {
  final String url;
  
  const Hyperlink({
    super.key,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: url));
      },
      child: Text(
        url,
        style: const TextStyle(
          color: Colors.lightBlue,
          decoration: TextDecoration.underline
        ))
    );
  }
}