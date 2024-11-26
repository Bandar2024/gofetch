import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/home/menu_items_view.dart';

import '../../shared_wedget/roundtext.dart';



class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

List menuArray = [
  {
    "name": "Food",
    "image": "assets/img/menu_1.png",
    "items_count": "120",
  },
  {
    "name": "Beverages",
    "image": "assets/img/menu_2.png",
    "items_count": "220",
  },
  {
    "name": "Desserts",
    "image": "assets/img/menu_3.png",
    "items_count": "155",
  },
  {
    "name": "Promotions",
    "image": "assets/img/menu_4.png",
    "items_count": "25",
  },
];

class _MenuViewState extends State<MenuView> {
  TextEditingController textSearch = TextEditingController();
  List filteredMenuArray = menuArray; // قائمة للبحث

  @override
  void initState() {
    super.initState();
    textSearch.addListener(_filterMenu); // إضافة مستمع لحقل البحث
  }

  void _filterMenu() {
    String query = textSearch.text.toLowerCase();
    setState(() {
      filteredMenuArray = menuArray.where((menu) {
        return menu["name"].toString().toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    textSearch.removeListener(_filterMenu); // إزالة المستمع عند التخلص من الواجهة
    textSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 180),
            width: media.width * 0.27,
            height: media.height * 0.6,
            decoration: BoxDecoration(
              color: app_colors.main,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
          ),
          SingleChildScrollView(
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
                        Text(
                          "Menu",
                          style: TextStyle(
                              color: app_colors.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        IconButton(
                          onPressed: () {
                            // يمكنك إضافة فعل للزر هنا
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: roundtext(
                      hintText: "Search Food",
                      bgColor: app_colors.placeholder,
                      controller: textSearch,
                      left: Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Image.asset(
                          "assets/img/search.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredMenuArray.length,
                    itemBuilder: (context, index) {
                      var menuObject = filteredMenuArray[index] as Map? ?? {};
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuItemsView(
                                menuObject: menuObject,
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 20),
                              width: media.width - 100,
                              height: 90,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 7,
                                      offset: Offset(0, 4))
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  menuObject["image"].toString(),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menuObject["name"].toString(),
                                        style: TextStyle(
                                            color: app_colors.primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${menuObject["items_count"].toString()} items",
                                        style: TextStyle(
                                            color: app_colors.secondaryText,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(17.5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2))
                                      ]),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/img/btn_next.png",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 54, 31, 31)),
              onPressed: () {
                Navigator.pop(context); // العودة إلى الصفحة الرئيسية
              },
            ),
          ),
        ],
      ),
    );
  }
}