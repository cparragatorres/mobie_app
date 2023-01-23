import 'package:flutter/material.dart';

class ItemFilterWidget extends StatelessWidget {

  String textFilter;
  bool isSelected;
  ItemFilterWidget({
    required this.textFilter,
    required this.isSelected,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        gradient: isSelected ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff5DE09C),
            Color(0xff23DEC3),
          ],
        ) : null,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        textFilter,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}
