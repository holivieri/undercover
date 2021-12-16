import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../providers/language_provider.dart';
import '../utils/font.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        S.of(context).availableLanguages,
        style: titleStyle,
      ),
      message: Text(
        S.of(context).selectLanguage,
        style: subtitleStyle,
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<LanguageProvider>().changeLocale('en');
            /* Provider.of<LanguageProvider>(context, listen: false)
                .changeLocale('en'); */
            Navigator.pop(context);
          },
          child: Text(S.of(context).langEnglish),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<LanguageProvider>().changeLocale('es');
            /*   Provider.of<LanguageProvider>(context, listen: false)
                .changeLocale('es'); */
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: Text(S.of(context).langSpanish),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => {},
        child: Text(S.of(context).cancel),
      ),
    );
  }
}
