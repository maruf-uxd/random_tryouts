# random_tryouts

A new Flutter project.

## Getting Started

In this project we will try out different things. Read the followings according to your need

## Remove Debug sticker on top Corner
- add the following line in 'MaterialApp' widget in the main file
        debugShowCheckedModeBanner: false,
  
## Make app full screen
- in order to make the App full screen, you have to convert main.dart file from 'StatelessWidget' to 'StatefulWidget'

- before building the widget, 'override' the initState. use the following code
  @override
  void initState() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  super.initState();
  }
  
- that's all. the app is now in Full Screen Mode

## Getting Locale Details according to IP-Address
- First you have to add the following packages in pubspec.yaml file,
  dio: ^4.0.4   #for api calling
  
- after that add the following line in a function to get the data, with async-await
  var dio = Dio();
  final response = await dio.get('http://ip-api.com/json');
  print(response.data);
  
- in the response variable you will get all the data you need

## Spinner while waiting for api response
- First you have to add the following packages in pubspec.yaml file,
  flutter_spinkit: ^5.1.0   #for spinner
  
- add 'SpinKitSquareCircle' widget, wrapped with 'Visibility' widget

- control the visibility with a global boolean value to show


## For Localization
- first create files under "assets folder"  (example: "assets/locales/")
- add two or multiple files in that direction   ("assets/locales/en.json", assets/locales/en.json)
- in pubspec.yaml file, add the following lines
  assets:
    - assets/locales/en.json
    - assets/locales/jp.json

- now add dependencies with "flutter_locales: ^2.0.0" and press "Pub Get"
- in main.dart add following 2 lines with async in "void main()"

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'jp']);     // 'en' and 'jp' are the file name in this scenario
  
- now in the builder section, wrap 'MaterialApp' with 'LocaleBuilder' and also add the following 3 lines inside 'MaterialApp'
  localizationsDelegates: Locales.delegates,
  supportedLocales: Locales.supportedLocales,
  locale: locale,
  
- Finally, to change the localization, just use the following line with the file name
  LocaleNotifier.of(context)!.change('en');
  
- to show the text with depending on the Selected Localization, one have to use 'LocaleText'

- you have to keep in mind that, files inside 'assets/locales', must contains same number of 'Keys'

That's all

