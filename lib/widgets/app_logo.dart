import 'package:personal_budgeting/consts/consts.dart';

Widget applogowidget() {
  return Image.asset(logos)
      .box
      .size(170, 170)
      .padding(EdgeInsets.all(8))
      .make();
}
