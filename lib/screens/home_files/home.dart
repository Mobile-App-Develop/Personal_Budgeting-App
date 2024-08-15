import 'package:personal_budgeting/consts/consts.dart';

class homes extends StatefulWidget {
  const homes({super.key});

  @override
  State<homes> createState() => _homeState();
}

class _homeState extends State<homes> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          10.heightBox,
          Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 150),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        catagoriesimg2[index],
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      "${catagorieslist2[index]}"
                          .text
                          .bold
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make(),
                      5.heightBox,
                      "${budget[index]}"
                          .text
                          .bold
                          .color(Colors.red)
                          .align(TextAlign.center)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .outerShadow
                      .make()
                      .onTap(() {
                    controller.getSubCatagories(catagorieslist[index]);
                    Get.to(() => catagoryDetail(title: catagorieslist[index]));
                  });
                }),
          ),

          Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 150),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      kh.text.make(),
                      Image.asset(
                        catagoriesimg[index],
                        height: 75,
                        width: 75,
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

          //All products section
        ]),
      ),
    );
  }
}
