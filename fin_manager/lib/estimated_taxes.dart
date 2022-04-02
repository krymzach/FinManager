import 'package:flutter/material.dart';

class EstTaxes extends StatefulWidget {
  const EstTaxes({Key? key, required this.wealth}) : super(key: key);

  final double wealth;

  @override
  State<EstTaxes> createState() => EstTaxesState();
}

class EstTaxesState extends State<EstTaxes> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
            child: Text(
              "\$${(widget.wealth * 0.3).toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w500
              ),
            )
          )
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.012, left: MediaQuery.of(context).size.width * 0.015),
            child: const Text(
              "Estimated Taxes",
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