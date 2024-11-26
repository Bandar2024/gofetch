import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/round_icon_button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtCardMonth = TextEditingController();
  TextEditingController txtCardYear = TextEditingController();
  TextEditingController txtCardCode = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  bool isAnyTime = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      width: media.width,
      decoration: BoxDecoration(
          color: app_colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Credit/Debit Card",
                style: TextStyle(
                    color: app_colors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: app_colors.primaryText,
                  size: 25,
                ),
              )
            ],
          ),
          Divider(
            color: app_colors.secondaryText.withOpacity(0.4),
            height: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          roundtext(
            hintText: "Card Number",
            controller: txtCardNumber,
            bgColor: app_colors.placeholder,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "Expiry",
                style: TextStyle(
                    color: app_colors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: roundtext(
                  hintText: "MM",
                  controller: txtCardMonth,
                  bgColor: app_colors.placeholder,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 25),
              SizedBox(
                width: 100,
                child: roundtext(
                  hintText: "YYYY",
                  controller: txtCardYear,
                  bgColor: app_colors.placeholder,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          roundtext(
            hintText: "Card Security Code",
            controller: txtCardCode,
            bgColor: app_colors.placeholder,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 15,
          ),
          roundtext(
            hintText: "First Name",
            controller: txtFirstName,
            bgColor: app_colors.placeholder,
          ),
          const SizedBox(
            height: 15,
          ),
          roundtext(
            hintText: "Last Name",
            controller: txtLastName,
            bgColor: app_colors.placeholder,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(children: [
            Text(
              "You can remove this card at anytime",
              style: TextStyle(
                  color: app_colors.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Switch(
                value: isAnyTime,
                activeColor: app_colors.main,
                onChanged: (newVal) {
                  setState(() {
                    isAnyTime = newVal;
                  });
                })
          ]),
          const SizedBox(
            height: 25,
          ),
          RoundIconButton(
              title: "Add Card",
              icon: "assets/img/add.png",
              color: app_colors.main,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              onPressed: () {}),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
