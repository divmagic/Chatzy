import 'dart:developer';
import 'package:chatzy_admin/routes/index.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/html.dart';
import 'common/language/index.dart';
import 'config.dart';
import 'dart:ui_web' as ui;

import 'package:universal_html/html.dart' as html;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ui.platformViewRegistry.registerViewFactory(
      'example', (_) => DivElement()..innerText = 'Hello, HTML!');
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  GetStorage.init();
  Get.put(AppController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAjy9RfFntp8bVqAy4RM97J_lrncnLyN00",
        authDomain: "chatzy-2cf0c.firebaseapp.com",
        projectId: "chatzy-2cf0c",
        storageBucket: "chatzy-2cf0c.firebasestorage.app",
        messagingSenderId: "390133784664",
        appId: "1:390133784664:web:9a453e82180be7e6132a2d",
        measurementId: "G-7WRWTJ59LX"),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appCtrl.isLogin = html.window.localStorage[session.isLogin] ?? "false";
    log(appCtrl.isLogin);
    return GetMaterialApp(
      builder: (context, widget) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              return !snapshot.hasData
                  ? MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget!,
                    )
                  : LoginScreen();
            });
      },
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // tran
      title: fonts.chatzyAdmin.tr,
      home: appCtrl.isLogged == true
          ? IndexLayout(
              scaffoldDrawerKey: scaffoldDrawerKey, scaffoldKey: scaffoldKey)
          : LoginScreen(),
      getPages: appRoute.getPages,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
