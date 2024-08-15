import 'package:personal_budgeting/consts/consts.dart';

class catogry extends StatefulWidget {
  const catogry({super.key});

  @override
  State<catogry> createState() => _catogryState();
}

class _catogryState extends State<catogry> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgwidget(
      child: Scaffold(
        appBar: AppBar(
          title: catagory.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      catagoriesimg[index],
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    "${catagorieslist[index]}"
                        .text
                        .color(darkFontGrey)
                        .align(TextAlign.center)
                        .make()
                  ],
                )
                    .box
                    .white
                    .roundedSM
                    .clip(Clip.antiAlias)
                    .outerShadow
                    .make()
                    .onTap(() {
                  controller.getSubCatagories(catagorieslist[index]);
                  Get.to(() => catagoryDetail(title: catagorieslist[index]));
                });
              }),
        ),
      ),
    );
  }
}
