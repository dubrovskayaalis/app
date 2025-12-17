import 'package:flutter/material.dart';

class HorSliderBar extends StatefulWidget {
  final List<Object> items;
  final void Function(String) onCategoryChanged;
  
  const HorSliderBar({super.key, required this.items, required this.onCategoryChanged}); 

  @override
  State<HorSliderBar> createState() => _HorSliderBarState();
}

class _HorSliderBarState extends State<HorSliderBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      height: 50.0, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: _createListView,
      ),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onCategoryChanged(widget.items[index].toString());
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 0 : 10, right: 10),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
        decoration: BoxDecoration(
          color: index == selectedIndex 
              ? Color.fromARGB(255, 255, 0, 0) 
              : Color.fromARGB(255, 63, 63, 63),
          borderRadius: BorderRadius.circular(35),
          boxShadow: index != selectedIndex 
            ? null
            : [BoxShadow(
                color: const Color.fromARGB(174, 255, 3, 3),
                blurRadius: 10,
                offset: Offset(0, 0),
              )]
        ),
        alignment: Alignment.center,
        child: Text(
          widget.items[index].toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}