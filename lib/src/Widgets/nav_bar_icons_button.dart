import 'package:app/src/Widgets/texted_icon.dart';
import 'package:flutter/material.dart';

class NavBarIconsButton extends StatefulWidget {
  final List<(String, IconData, void Function())> iconsList;
  const NavBarIconsButton({super.key, required this.iconsList});

  @override
  State<NavBarIconsButton> createState() => _NavBarIconsButtonState();
}

class _NavBarIconsButtonState extends State<NavBarIconsButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.iconsList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.iconsList[index].$3();
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 16.0 : 8.0,
                right: index == widget.iconsList.length - 1 ? 16.0 : 8.0,
              ),
              child: TextedIcon(
                text: widget.iconsList[index].$1,
                icon: widget.iconsList[index].$2,
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.iconsList[index].$3();
                },
                color: selectedIndex == index
                    ? Colors.red
                    : const Color.fromARGB(255, 179, 179, 179),
              ),
            ),
          );
        }),
      )
    );
  }
}