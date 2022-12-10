import 'package:mgp_mobile_app/splashscreen/splashscreen.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:mgp_mobile_app/widget/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

void main() {
  runApp(const MyApp());
}

@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  String notificationTitle = data['title'] ?? 'Notive MGP';
  String notificationText = data['message'] ?? 'Ada notive MGP';

  // print("title: $notificationTitle");
  // print("message: $notificationText");

  Pushy.notify(notificationTitle, notificationText, data);

  Pushy.clearBadge();
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: MainScreen(), 
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: GetMaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 320,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(320, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
              background: Container(color: const Color(0xFFF5F5F5))
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            theme: theme(),
          ),
        );
      }
    );
  }
}