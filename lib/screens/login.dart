import 'package:personal_budgeting/consts/consts.dart';

import 'home_files/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgwidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              // (context.screenWidth * 0.1).heightBox,
              applogowidget(),
              "log in to $appname".text.white.make(),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        title: email,
                        hint: emailhint,
                        isPass: false,
                        controller: controller.emailController),
                    20.heightBox,
                    customTextField(
                        title: password,
                        hint: passwordhint,
                        isPass: true,
                        controller: controller.passwordController),
                    10.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : buttonWidget(
                                color: redColor,
                                textcolor: whiteColor,
                                title: login,
                                onpress: () async {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context, msg: logged);
                                      Get.offAll(() => const homes());
                                      // Get.to(()=>const HomeScreen());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });
                                })
                            .box
                            .roundedFull
                            .width(context.screenWidth - 50)
                            .make(),
                    10.heightBox,
                    notlogin.text.make(),
                    10.heightBox,
                    buttonWidget(
                            color: golden,
                            textcolor: whiteColor,
                            title: signups,
                            onpress: () {
                              Get.to(() => const Signup());
                            })
                        .box
                        .roundedFull
                        .width(context.screenWidth - 50)
                        .make(),
                    10.heightBox,
                  ],
                )
                    .box
                    .rounded
                    .white
                    .padding(const EdgeInsets.all(16))
                    .width(context.width - 70)
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
