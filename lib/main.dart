import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() async {
  // Required initialization steps for easy_localization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('am'), // Amharic
        Locale('en'), // English
      ],
      path: 'assets/translations',
      // Location of json assets
      fallbackLocale: const Locale('en'),
      // Fallback if a key is missing
      startLocale: const Locale('am'),
      // FORCES Amharic to load first by default
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Builder provides a fresh BuildContext underneath EasyLocalization,
    // which completely resolves the lookup error on the delegates!
    return Builder(
      builder: (localizedContext) {
        return MaterialApp(
          localizationsDelegates: localizedContext.localizationDelegates,
          supportedLocales: localizedContext.supportedLocales,
          locale: localizedContext.locale,

          theme: ThemeData.dark(),

          debugShowCheckedModeBanner: false,
          title: "title".tr(),

          home: const HomePage(),
        );
      },
    );
  }
}
