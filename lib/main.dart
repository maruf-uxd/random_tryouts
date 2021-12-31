import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:random_tryouts/screens/home_screen/home_screen.dart';
import 'package:random_tryouts/screens/splash_screen/splash_screen.dart';

void main() async {

  //add following 2 lines for localization with async
  //region Localization
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'jp']);
  //endregion

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // to make full screen, make stateful widget and add the following in initial state
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /* In order to effect the localization in the whole application
    ** One Must wrap the MaterialApp widget with LocaleBuilder
    ** In order to wrap it with
    */
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        debugShowCheckedModeBanner: false,

        //add following 3 lines for localization
        //region Localization
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        //endregion

        title: 'Random',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
