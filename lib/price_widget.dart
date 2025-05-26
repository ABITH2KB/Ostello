import 'package:flutter/material.dart';

class ThreeOptionSelector extends StatefulWidget {
  const ThreeOptionSelector({super.key});

  @override
  _ThreeOptionSelectorState createState() => _ThreeOptionSelectorState();
}

class _ThreeOptionSelectorState extends State<ThreeOptionSelector> {
  int selectedIndex = 0;

  void onSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

 Widget buildOption(int index, String optionText, String price) {
  bool isSelected = selectedIndex == index;

  return GestureDetector(
    onTap: () => onSelect(index),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,  
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.purple : Colors.grey.shade400,
          width: isSelected ? 1 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.20),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ?Colors.purple: Colors.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                         color: Colors.purple,
                      ),
                    ),
                  )
                : null,
          ),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                optionText,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Schyler',
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          // Right side: price text
          Text(
            price,
            style: const TextStyle(
             color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontFamily: 'Schyler',
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            buildOption(0, 'Monthly', '₹600'),
        buildOption(1, 'Quarterly', '₹1900'),
        buildOption(2, 'Full Course', '₹5591'),
      ],
    );
  }
}
