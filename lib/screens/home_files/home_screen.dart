import 'package:personal_budgeting/consts/consts.dart';
import 'package:personal_budgeting/consts/styles.dart';

import '../../widgets/exit_dialog.dart';
import '../catagory_files/catagory.dart';
import 'home.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbaritem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories2,
            width: 26,
          ),
          label: catagory),
    ];
    var navbody = [
      const homes(),
      const catogry(),
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                  child: navbody.elementAt(controller.currentNavIndex.value)),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.green,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            items: navbaritem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
