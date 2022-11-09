import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Flexible(
                flex: 10,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search Now',
                    fillColor: Color(0xFFE8E8E8),
                    isDense: true,
                    contentPadding: EdgeInsets.all(8.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Flexible(
                flex: 1,
                child: Icon(
                  Icons.search,
                  color: Color(0xFF555555),
                ),
              )
            ],
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}
