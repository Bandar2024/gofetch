import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/Order/my_order_view.dart';
import 'package:gofetch/screens/home/menu_view.dart';
import 'package:gofetch/screens/profile/profile_view.dart'; // استيراد ProfileView
import 'package:gofetch/screens/settings/settings_view.dart'; // استيراد SettingsView
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/category_cell.dart';
import 'package:gofetch/shared_wedget/next_to_you_cell.dart';
import 'package:gofetch/shared_wedget/popular_restaurant_row.dart';
import 'package:gofetch/shared_wedget/all_resturant_row.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';
import 'package:gofetch/shared_wedget/view_all_title.dart';

class HomeView extends StatefulWidget {
  final String userEmail; // إضافة خاصية البريد الإلكتروني

  const HomeView({super.key, required this.userEmail});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textSearch = TextEditingController();

  List categoryArray = [
    {"image": "assets/img/cat_offer.png", "name": "Fast Food"},
    {"image": "assets/img/cat_sri.png", "name": "Fish Food"},
    {"image": "assets/img/cat_3.png", "name": "Italian"},
    {"image": "assets/img/cat_4.png", "name": "Egyptian Food"}
  ];

  List popularArray = [
    {
      "image": "assets/img/res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
  ];

  List NextToYouArray = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/m_res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
  ];

  List AllRestaurantArray = [
    {
      "image": "assets/img/item_1.png",
      "name": "Mulberry Pizza by Josh",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_2.png",
      "name": "Barita",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Pizza Rush Hour",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
  ];

  List filteredPopularArray = [];
  List filteredNextToYouArray = [];
  List filteredAllRestaurantArray = [];

  @override
  void initState() {
    super.initState();
    filteredPopularArray = popularArray; // تعيين العناصر المصفاة في البداية
    filteredNextToYouArray = NextToYouArray;
    filteredAllRestaurantArray = AllRestaurantArray;
    textSearch.addListener(_filterRestaurants); // إضافة مستمع لحقل البحث
  }

  void _filterRestaurants() {
    String query = textSearch.text.toLowerCase();
    setState(() {
      filteredPopularArray = popularArray.where((item) {
        return item['name'].toLowerCase().contains(query); // تصفية العناصر
      }).toList();

      filteredNextToYouArray = NextToYouArray.where((item) {
        return item['name'].toLowerCase().contains(query);
      }).toList();

      filteredAllRestaurantArray = AllRestaurantArray.where((item) {
        return item['name'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    textSearch.removeListener(_filterRestaurants);
    textSearch.dispose();
    super.dispose();
  }

  // دالة لبناء Drawer مع البريد الإلكتروني
  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: app_colors.main,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.userEmail, // عرض البريد الإلكتروني هنا
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // إغلاق الدراور
              // يمكنك إضافة وظيفة الانتقال إلى الصفحة الرئيسية هنا إذا كنت بحاجة لذلك
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context); // إغلاق الدراور
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileView(), // الانتقال إلى صفحة البروفايل
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // إغلاق الدراور
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(), // الانتقال إلى صفحة الإعدادات
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // هنا يمكنك إضافة وظائف لتسجيل الخروج
              Navigator.pop(context); // إغلاق الدراور
              // مثال على تسجيل الخروج:
              // AuthService.logout(); // استخدم الطريقة المناسبة لتسجيل الخروج
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfffDfDfD),
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu), // أيقونة الدراور
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer(); // فتح الدراور
                      },
                    ),
                    Text(
                      "Welcome to our restaurant",
                      style: TextStyle(
                          color: app_colors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: roundtext(
                  hintText: "Search Restaurant",
                  controller: textSearch,
                  bgColor: app_colors.placeholder,
                  left: Container(
                    alignment: Alignment.center,
                    width: 15,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: categoryArray.length,
                  itemBuilder: ((context, index) {
                    var contentOfObject = categoryArray[index] as Map? ?? {};
                    return CategoryCell(
                      contentOfObject: contentOfObject,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ViewAllTitleRow(
                  title: "Popular Restaurant",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuView(),
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredPopularArray.length,
                itemBuilder: ((context, index) {
                  var contentOfPopularRestaurantObject =
                      filteredPopularArray[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    contentOfPopularRestaurantObject:
                        contentOfPopularRestaurantObject,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuView(),
                        ),
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ViewAllTitleRow(
                  title: "Restaurant Next To You",
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: filteredNextToYouArray.length,
                  itemBuilder: ((context, index) {
                    var contentOfNextToYouObject =
                        filteredNextToYouArray[index] as Map? ?? {};
                    return NextToYouCell(
                      contentOfONextToYouObject: contentOfNextToYouObject,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuView(),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ViewAllTitleRow(
                  title: "All Restaurants",
                  onTap: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: filteredAllRestaurantArray.length,
                itemBuilder: ((context, index) {
                  var contentOfAllRestaurantObject =
                      filteredAllRestaurantArray[index] as Map? ?? {};
                  return AllRestaurantRow(
                    contentOfAllRestaurantObject:
                        contentOfAllRestaurantObject,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuView(),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}