import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/Order/checkout_view.dart';
import 'package:gofetch/shared_wedget/button.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List<Map<String, dynamic>> itemArray = [];

  void addItem(String name, double price) {
    setState(() {
      itemArray.add({
        "name": name,
        "quantity": 1,
        "price": price,
      });
    });
  }

  void removeItem(int index) {
    setState(() {
      itemArray.removeAt(index);
    });
  }

  double getTotal() {
    return itemArray.fold(0, (total, item) => total + (item["price"] * item["quantity"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        "My Order",
                        style: TextStyle(
                            color: app_colors.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: app_colors.textFiled),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: itemArray.length,
                  separatorBuilder: (context, index) => Divider(
                    indent: 25,
                    endIndent: 25,
                    color: app_colors.secondaryText.withOpacity(0.5),
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    var itemOrderObject = itemArray[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${itemOrderObject["name"]} x${itemOrderObject["quantity"]}",
                              style: TextStyle(
                                  color: app_colors.primaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "\$${(itemOrderObject["price"] * itemOrderObject["quantity"]).toStringAsFixed(2)}",
                            style: TextStyle(
                                color: app_colors.primaryText,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 25),
                          IconButton(
                            onPressed: () {
                              removeItem(index);
                            },
                            icon: Icon(Icons.delete, size: 20), // Use delete icon for trash bin
                            color: Colors.red, // Set the color to red
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                              color: app_colors.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\$${getTotal().toStringAsFixed(2)}",
                          style: TextStyle(
                              color: app_colors.main,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Divider(
                      color: app_colors.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: app_colors.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "\$${(getTotal() + 2).toStringAsFixed(2)}", // Including delivery cost
                          style: TextStyle(
                              color: app_colors.main,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Button(
                      title: "Checkout",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutView(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // هنا يمكنك فتح صفحة الطعام لاختيار الأصناف
          // على سبيل المثال، يمكنك استخدام Navigator للانتقال إلى صفحة الطعام
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodSelectionView(
                onAddItem: addItem,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: app_colors.main,
      ),
    );
  }
}

// صفحة اختيار الطعام (مؤقتة)
class FoodSelectionView extends StatelessWidget {
  final Function(String, double) onAddItem;

  const FoodSelectionView({Key? key, required this.onAddItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> foodItems = [
      {"name": "Beef Burger", "price": 16.0},
      {"name": "Classic Burger", "price": 14.0},
      {"name": "Cheese Chicken Burger", "price": 17.0},
      {"name": "Chicken Legs Basket", "price": 15.0},
      {"name": "French Fries Large", "price": 6.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Food"),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          var food = foodItems[index];
          return ListTile(
            title: Text(food["name"]),
            subtitle: Text("\$${food["price"]}"),
            trailing: ElevatedButton(
              onPressed: () {
                onAddItem(food["name"], food["price"]);
                Navigator.pop(context); // العودة إلى الصفحة السابقة بعد الإضافة
              },
              child: Text("Add"),
            ),
          );
        },
      ),
    );
  }
}
