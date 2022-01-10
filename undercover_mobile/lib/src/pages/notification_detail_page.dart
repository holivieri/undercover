import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/utils/font.dart';

import '../../generated/l10n.dart';
import '../utils/colors.dart';
import '../widgets/back_button.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage(
      {required this.messageTitle, required this.messageDescription, Key? key})
      : super(key: key);

  final String messageTitle;
  final String messageDescription;

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 100),
              title(),
              const SizedBox(height: 20),
              message(),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    final TextEditingController txt = TextEditingController()
      ..text = widget.messageTitle;

    return TextField(
      readOnly: true,
      controller: txt,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: S.of(context).title,
        labelStyle: titleStyle,
      ),
    );
  }

  Widget message() {
    final TextEditingController txt = TextEditingController()
      ..text = widget.messageDescription;

    return TextField(
      readOnly: true,
      controller: txt,
      maxLines: 10,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: S.of(context).message,
        labelStyle: titleStyle,
      ),
    );
  }
}
