// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/filters.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget buildListtile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xfffdfdfd),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            height: 175,
            // color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://app.znaplink.com/uploads/avatars/1634217360.png"),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "AmirHossein Bayat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AmirBayat.dev@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.4)),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          GestureDetector(
            child: buildListtile("Meals", Icons.restaurant),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          GestureDetector(
            child: buildListtile("Filters", Icons.settings),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
