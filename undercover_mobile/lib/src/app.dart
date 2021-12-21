import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'models/user_preferences.dart';
import 'pages/home_page.dart';
import 'providers/language_provider.dart';
import 'repositories/artists_repository.dart';
import 'routes/routes.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'themes/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    required this.settingsController,
    required this.artistRepository,
    Key? key,
  }) : super(key: key);

  final SettingsController settingsController;
  final ArtistRepository artistRepository;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final languageProvider = Provider.of<LanguageProvider>(context);

        return ChangeNotifierProvider<LanguageProvider>(
          create: (_) => languageProvider,
          child: GetMaterialApp(
            // restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
            ],
            locale: Locale(UserPreferences()
                .selectedLanguage), //languageProvider.currentLocale,
            /* fallbackLocale: const Locale('en', 'US'),
            getPages: routes, */

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.

            // onGenerateTitle: 'appTitle'.tr,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            routes: getApplicationRoutes(),
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(
                          controller: widget.settingsController);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                    default:
                      return const HomePage();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
