import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'models/user_preferences.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'providers/language_provider.dart';
import 'repositories/artists_repository.dart';
import 'routes/routes.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'services/push_notifications.dart';
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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    //local notifications

    const initilizationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initizlizationSettingsIOS = IOSInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initilizationSettingsAndroid,
      iOS: initizlizationSettingsIOS,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // push notifications
    PushNotificationsService.messageStream.listen((message) {
      /* const snackbar = SnackBar(
        content: Text('Tenes una nueva notificación'),
        backgroundColor: Colors.red,
      );
      messengerKey.currentState?.showSnackBar(snackbar); */
      showNotificationAlert(message);
    });
  }

  Future showNotificationAlert(String? payload) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);

    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      'Nuevo Mensaje',
      payload,
      platformChannelSpecifics,
      payload: payload ?? '',
    );
  }

  String getInitialRoute() {
    final token = UserPreferences().deviceToken;
    final tokenExpirationDate = UserPreferences().tokenExpirationDate;

    print(tokenExpirationDate);

    if (token.isEmpty || tokenExpirationDate.isEmpty) {
      return loginRoute;
    }
    if (DateTime.parse(UserPreferences().tokenExpirationDate)
        .toUtc()
        .isAfter(DateTime.now().toUtc())) {
      //token expired
      return loginRoute;
    } else {
      return homeRoute;
    }
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
          child: MaterialApp(
            // restorationScopeId: 'app',
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: messengerKey,
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
            locale: Locale(UserPreferences().selectedLanguage),
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
            initialRoute: getInitialRoute(),
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
