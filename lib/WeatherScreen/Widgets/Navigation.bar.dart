import 'package:flutter/material.dart';

class NavigationBarAppBar extends StatefulWidget {
  const NavigationBarAppBar({super.key});

  @override
  State<NavigationBarAppBar> createState() => NavigationBarAppBarState();
}

class NavigationBarAppBarState extends State<NavigationBarAppBar> {
  List items = ['Погода', 'Города'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            selectedIndex == index ? Colors.white : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index],
                      style: TextStyle(
                        color:
                            selectedIndex == index ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
