import 'package:flutter/material.dart';

class IncomeExpenseButton extends StatefulWidget {
  const IncomeExpenseButton({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<IncomeExpenseButton> createState() => IncomeExpenseButtonState();
}

class IncomeExpenseButtonState extends State<IncomeExpenseButton> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.height * 0.15,
        height: MediaQuery.of(context).size.height * 0.15,
        child: ElevatedButton(
          onPressed: () {
            print(widget.type);
          },
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(12, 25, 122, 1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ))
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009375),
            child: Text(
              "Add ${widget.type}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          )
        )
      )
    );
  }
}