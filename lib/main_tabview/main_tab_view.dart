import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/Order/my_order_view.dart';
import 'package:gofetch/screens/more/more_view.dart';
import 'package:gofetch/shared_wedget/tab_button.dart';
import 'package:gofetch/screens/home/home_view..dart'; // تأكد من أن المسار صحيح

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 1;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeView(userEmail: '',); // هنا يجب أن تكون HomeView مستوردة بشكل صحيح

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: storageBucket,
        child: selectPageView,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selectTab != 1) {
              selectTab = 1;
              selectPageView = const HomeView(userEmail: '',); // تحديث هذا السطر
            }
            if (mounted) {
              setState(() {});
            }
          },
          backgroundColor: selectTab == 1 ? app_colors.main : app_colors.secondaryText,
          child: Image.asset(
            "assets/img/tab_home.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.black,
        elevation: 10,
        notchMargin: 15,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TapButton(
                title: "Order",
                icon: "assets/img/shopping_cart.png",
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = const MyOrderView();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 0,
              ),
              TapButton(
                title: "More",
                icon: "assets/img/tab_more.png",
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView = const MoreView();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                isSelected: selectTab == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}