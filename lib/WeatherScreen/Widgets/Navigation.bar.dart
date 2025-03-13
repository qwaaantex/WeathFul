import 'package:WeathFul/Providers/NavigationProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBarAppBar extends StatefulWidget {
  const NavigationBarAppBar({super.key});

  @override
  State<NavigationBarAppBar> createState() => NavigationBarAppBarState();
}

class NavigationBarAppBarState extends State<NavigationBarAppBar> {
  List items = ['Погода', 'Города'];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
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
                    color: navigationProvider.indexing == index
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
