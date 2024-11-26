import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/Order/my_order_view.dart';
import 'package:gofetch/screens/login/login_view.dart';
import 'package:gofetch/screens/more/about_us_view.dart';
import 'package:gofetch/screens/more/notification_view.dart';
import 'package:gofetch/screens/more/payment_details_view.dart';
import 'package:gofetch/screens/profile/profile_view.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  List moreArray = [
    {
      "index": "1",
      "name": "Profile",
      "image": "assets/img/tab_profile.png",
      "base": 0
    },
    {
      "index": "2",
      "name": "Payment Details",
      "image": "assets/img/more_payment.png",
      "base": 0
    },
    {
      "index": "3",
      "name": "Notifications",
      "image": "assets/img/more_notification.png",
      "base": 15
    },
    {
      "index": "4",
      "name": "About Us",
      "image": "assets/img/more_info.png",
      "base": 0
    },
    {
      "index": "5",
      "name": "Logout",
      "image": "assets/img/more_info.png",
      "base": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                          color: app_colors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moreArray.length,
                  itemBuilder: (context, index) {
                    var moreObject = moreArray[index] as Map? ?? {};
                    var baseCount = moreObject["base"] as int? ?? 0;
                    return InkWell(
                      onTap: () {
                        switch (moreObject["index"].toString()) {
                          case "2":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentDetailsView()));

                            break;

                          case "1":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfileView()));
                          case "3":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationsView()));

                          case "4":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutUsView()));
                          case "5":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  LoginView()));

                          default:
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              decoration: BoxDecoration(
                                  color: app_colors.textFiled,
                                  borderRadius: BorderRadius.circular(5)),
                              margin: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: app_colors.placeholder,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        moreObject["image"].toString(),
                                        width: 25,
                                        height: 25,
                                        fit: BoxFit.contain),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      moreObject["name"].toString(),
                                      style: TextStyle(
                                          color: app_colors.primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  if (baseCount > 0)
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        baseCount.toString(),
                                        style: TextStyle(
                                            color: app_colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: app_colors.textFiled,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset("assets/img/btn_next.png",
                                  width: 10,
                                  height: 10,
                                  color: app_colors.primaryText),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
