import 'package:flutter/material.dart';

class NavigationBarAppBar extends StatefulWidget {
  final bool isChanged;
  final int index;
  const NavigationBarAppBar(
      {super.key, required this.isChanged, required this.index});

  @override
  State<NavigationBarAppBar> createState() => NavigationBarAppBarState();
}

class NavigationBarAppBarState extends State<NavigationBarAppBar> {
  List items = ['Погода', 'Города'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == index
                        ? Colors.white
                        : Colors.grey.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
