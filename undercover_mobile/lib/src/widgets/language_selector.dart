import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(S.of(context).langEnglish),
        ),
        CupertinoActionSheetAction(
          onPressed: () {},
          isDefaultAction: true,
          child: Text(S.of(context).langSpanish),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {},
        child: Text(S.of(context).cancel),
      ),
    );
  }
}
