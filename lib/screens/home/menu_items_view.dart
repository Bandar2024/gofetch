import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/home/item_details_view.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';
import '../../shared_wedget/menu_item_row.dart';

class MenuItemsView extends StatefulWidget {
  final Map menuObject;
  const MenuItemsView({super.key, required this.menuObject});

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController textSearch = TextEditingController();
  
  List menuItemsArray = [
    {
      "image": "assets/img/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_3.png",
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Desserts"
    },
    {
      "image": "assets/img/dess_4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Desserts"
    },
  ];

  List filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = menuItemsArray; // تعيين العناصر المصفاة في البداية
    textSearch.addListener(_filterMenuItems); // إضافة مستمع لحقل البحث
  }

  void _filterMenuItems() {
    String query = textSearch.text.toLowerCase();
    setState(() {
      filteredItems = menuItemsArray.where((item) {
        return item['name'].toLowerCase().contains(query); // تصفية العناصر
      }).toList();
    });
  }

  @override
  void dispose() {
    textSearch.removeListener(_filterMenuItems); // إزالة المستمع عند التخلص من الواجهة
    textSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png", width: 20, height: 20),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.menuObject["name"].toString(),
                        style: TextStyle(
                          color: app_colors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/img/shopping_cart.png", width: 25, height: 25),
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
                    child: Image.asset("assets/img/search.png", width: 20, height: 20),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredItems.length, // استخدام العناصر المصفاة
                itemBuilder: ((context, index) {
                  var menuObject = filteredItems[index] as Map? ?? {};
                  return MenuItemRow(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ItemDetailsView()),
                      );
                    },
                    menuObject: menuObject, onDelete: () {  }, onEdit: () {  },
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