import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key, this.icon, required this.title, required this.preview}) : super(key: key);

  final Image? icon;
  final String title;
  final String preview;

  @override
  State<News> createState() => NewsState();
}

class NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ElevatedButton(
        onPressed: () {
          print(widget.title);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(12, 25, 122, 1)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.height * 0.12,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.065)
              ),
              child: widget.icon
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.215 - MediaQuery.of(context).size.height * 0.12,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Text(
                    widget.preview,
                    maxLines: (((MediaQuery.of(context).size.height * 0.11).toInt() - 24) ~/ 14) - 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                ]
              )
            )
          ]
        )
      )
    );
  }
}