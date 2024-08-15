import 'package:personal_budgeting/consts/consts.dart';

import 'home_files/home_screen.dart';
import 'login.dart';

class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  State<Flashscreen> createState() => _FlashscreenState();
}

class _FlashscreenState extends State<Flashscreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => LoginScreen());
        } else {
          Get.to(() => const HomeScreen());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  width: 200,
                )),
            10.heightBox,
            applogowidget(),
            10.heightBox,
            appname.text.size(16).make(),
            10.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
