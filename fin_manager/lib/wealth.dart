import 'package:fin_manager/models.dart';
import 'package:flutter/material.dart';

class Wealth extends StatefulWidget {
  const Wealth({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<Wealth> createState() => WealthState();
}

class WealthState extends State<Wealth> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
            child: Text(
              "\$${widget.user.wealth.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 72,
                fontWeight: FontWeight.w600
              ),
            )
          )
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.012, left: MediaQuery.of(context).size.width * 0.015),
            child: const Text(
              "Wealth",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
          )
        )
      ],
    );
  }
}