import 'package:fin_manager/api.dart';
import 'package:fin_manager/models.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key, required this.user,}) : super(key: key);

  final User user;

  @override
  State<ProfileWidget> createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(12, 25, 122, 1),
          borderRadius: BorderRadius.circular(25)
        ),
        child: DropdownButton(
          onChanged: (dynamic value) {
            value = value;
          },
          borderRadius: BorderRadius.circular(10),
          dropdownColor: const Color.fromRGBO(122, 95, 0, 1),
          iconEnabledColor: Colors.white,
          alignment: Alignment.center,
          iconSize: 0,
          isExpanded: true,
          icon: Container(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          underline: Container(),
          value: 0,
          items: [
            DropdownMenuItem(
              value: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.user.fullName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              )
            ),
            DropdownMenuItem(
              value: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                  ),
                ]
              )
            ),
            DropdownMenuItem(
              value: 2,
              onTap: () {
                signOut(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Logout",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
}