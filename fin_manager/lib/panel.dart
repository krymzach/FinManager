import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  const Panel({Key? key, this.width, this.height, required this.child,}) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;

  @override
  State<Panel> createState() => PanelState();
}

class PanelState extends State<Panel> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 100,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(122, 95, 0, 1), width: 3),
        borderRadius: BorderRadius.circular(50)
      ),
      child: widget.child
    );
  }
}