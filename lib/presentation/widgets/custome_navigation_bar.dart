import 'dart:math';

import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Temproray Screen")),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 3, right: 3, bottom: 2),
        child: BottomAppBar(
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade700,
                    border: Border.all(color: Colors.grey.shade500)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Icon(Icons.bookmark),
                    Icon(Icons.person)
                  ],
                ),
              ),
            )),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        margin: EdgeInsets.only(top: 45),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {},
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 5, color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(80)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
