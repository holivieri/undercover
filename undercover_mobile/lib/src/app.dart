import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/home_page.dart';
import 'repositories/artists_repository.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'services/artists_service.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    required this.settingsController,
    //required this.artistService,
    required this.artistRepository,
    Key? key,
  }) : super(key: key);

  final SettingsController settingsController;
  // final ArtistService artistService;
  final ArtistRepository artistRepository;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late ArtistRepository _artistRepository;

  @override
  void initState() {
    super.initState();
    //final ArtistService service = ArtistService();
    // _artistRepository = ArtistRepository(service);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: widget.settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: widget.settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return HomePage(
                      artistsRepository: widget.artistRepository,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
