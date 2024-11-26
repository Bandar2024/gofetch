import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';

class MenuItemRow extends StatelessWidget {
  final Map menuObject;
  final VoidCallback onTap;
  const MenuItemRow({super.key, required this.menuObject, required this.onTap, required void Function() onDelete, required void Function() onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              menuObject["image"].toString(),
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuObject["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: app_colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/img/rate.png",
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            menuObject["rate"],
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: app_colors.main, fontSize: 11),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            menuObject["type"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: app_colors.white, fontSize: 11),
                          ),
                          Text(
                            " . ",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: app_colors.main, fontSize: 11),
                          ),
                          Text(
                            menuObject["food_type"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: app_colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
