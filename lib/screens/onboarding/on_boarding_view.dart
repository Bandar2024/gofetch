import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/main_tabview/main_tab_view.dart';
// import 'package:gofetch/screens/home/home_view..dart';
import 'package:gofetch/shared_wedget/button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  List pageArray = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/img/on_boarding_1.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/img/on_boarding_2.png",
    },
    {
      "title": "From Multiple Restaurants",
      "subtitle":
          "Real time tracking of your food on the app\nonce you placed the order",
      "image": "assets/img/on_boarding_3.png",
    },
  ];

  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        // floor fun is using for >> تحويل القيمة العشرية الى أقرب عدد صحيح أصغر
        // the mark  > ?? 0 < is mean if the thing before the mark ?? has a value take it is value but if it is not has a value take the value after the mark ?? which is here 0
        // استخدمنا الدالة floor لأن القيمة التي سنحصل عليها هي قيمة عائمة أي قيمة نسبية تتغير بحسب موضع الصفحة الحالية
        selectPage = controller.page?.floor() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArray.length,
            itemBuilder: ((context, index) {
              // هنا قم بأخذ البيانات التي سنقوم من خلالها ببناء الصفحات تبع البوردينق من الليست
              // تأكذ هل العنصر لي بتأخذه من اليست من نوع ماب إذا كان من نوع ماب حطه و إذا ماكان من نوع ماب حط قيمة ماب فارغة
              var pageObject = pageArray[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: media.width,
                    height: media.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pageObject["image"].toString(),
                      width: media.width * 0.65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.2,
                  ),
                  Text(
                    pageObject["title"].toString(),
                    style: TextStyle(
                        color: app_colors.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    pageObject["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: app_colors.secondaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: media.width * 0.20,
                  ),
                ],
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height * 0.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArray.map((e) {
                  var index = pageArray.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: index == selectPage
                            ? app_colors.main
                            : app_colors.placeholder,
                        borderRadius: BorderRadius.circular(4)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: media.height * 0.28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Button(
                    title: "Next",
                    onPressed: () {
                      if (selectPage >= 2) {
                        // Home Screen

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainTabView(),
                          ),
                        );
                      } else {
                        //Next Screen

                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        });
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
