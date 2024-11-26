import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/round_icon_button.dart';
import 'package:gofetch/screens/Order/my_order_view.dart'; // تأكد من استيراد الصفحة الصحيحة

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  double price = 15;
  int quantity = 1;
  bool isFavorite = false;
  
  List<String> ingredients = ["Cheese", "Pepperoni", "Olives", "Mushrooms", "Onions"];
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: app_colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/img/detail_top.png",
            width: media.width,
            height: media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: media.width - 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: app_colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 35),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Tandoori Chicken Pizza",
                                  style: TextStyle(
                                      color: app_colors.primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          " 4 Star Ratings",
                                          style: TextStyle(
                                              color: app_colors.main,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$${price.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: app_colors.primaryText,
                                              fontSize: 31,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "/per Portion",
                                          style: TextStyle(
                                              color: app_colors.primaryText,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      color: app_colors.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
                                  style: TextStyle(
                                      color: app_colors.secondaryText,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Divider(
                                    color: app_colors.secondaryText.withOpacity(0.4),
                                    height: 1,
                                  )),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Customize your Order",
                                  style: TextStyle(
                                      color: app_colors.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: app_colors.textFiled,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: ["small", "Big"].map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                color: app_colors.primaryText,
                                                fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                      hint: Text(
                                        "- Select the size of portion -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: app_colors.secondaryText,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: ingredients.map((ingredient) {
                                    return ListTile(
                                      title: Text(ingredient),
                                      onTap: () {
                                        // يمكن إضافة فعل عند الضغط على المكون
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    Text(
                                      "Number of Portions",
                                      style: TextStyle(
                                          color: app_colors.primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        quantity = quantity - 1;

                                        if (quantity < 1) {
                                          quantity = 1;
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: app_colors.main,
                                            borderRadius: BorderRadius.circular(12.5)),
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: app_colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: app_colors.main,
                                          ),
                                          borderRadius: BorderRadius.circular(12.5)),
                                      child: Text(
                                        quantity.toString(),
                                        style: TextStyle(
                                            color: app_colors.main,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        quantity = quantity + 1;
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: app_colors.main,
                                            borderRadius: BorderRadius.circular(12.5)),
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: app_colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 220,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: media.width * 0.25,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: app_colors.main,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(35),
                                            bottomRight: Radius.circular(35)),
                                      ),
                                    ),
                                    Center(
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 10,
                                                  right: 20),
                                              width: media.width - 80,
                                              height: 120,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(35),
                                                      bottomLeft: Radius.circular(35),
                                                      topRight: Radius.circular(10),
                                                      bottomRight: Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 12,
                                                        offset: Offset(0, 4))
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total Price",
                                                    style: TextStyle(
                                                        color: app_colors.primaryText,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Text(
                                                    "\$${(price * quantity).toString()}",
                                                    style: TextStyle(
                                                        color: app_colors.primaryText,
                                                        fontSize: 21,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  SizedBox(
                                                    width: 130,
                                                    height: 25,
                                                    child: RoundIconButton(
                                                      title: "Add to Cart",
                                                      icon: "assets/img/shopping_add.png",
                                                      color: app_colors.main,
                                                      onPressed: () {
                                                        // الانتقال إلى صفحة my_order_view
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => MyOrderView(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              )),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(22.5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 4,
                                                        offset: Offset(0, 2))
                                                  ]),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                  "assets/img/shopping_cart.png",
                                                  width: 20,
                                                  height: 20,
                                                  color: app_colors.main),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                            ]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Container(
                    height: media.width - 20,
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(right: 4),
                    child: InkWell(
                        onTap: () {
                          isFavorite = !isFavorite;
                          setState(() {});
                        },
                        child: Image.asset(
                            isFavorite
                                ? "assets/img/favorites_btn.png"
                                : "assets/img/favorites_btn_2.png",
                            width: 70,
                            height: 70)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/img/btn_back.png",
                          width: 20,
                          height: 20,
                          color: app_colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/shopping_cart.png",
                          width: 25,
                          height: 25,
                          color: app_colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}