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
Widget buildOption(int index, String optionText, String price, [String? label]) {
  bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onSelect(index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? Color(0xFF7D23E0) : Colors.grey.shade400,
              width: 1,
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
                    color: isSelected ? Color(0xFF7D23E0) : Colors.grey,
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
                            color: Color(0xFF7D23E0),
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
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFF7D23E0),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  fontSize: 20,
                ),
              ),
                SizedBox(width: 10), // Add some space between price and label
               Text(
                '999',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),

       
        if (label != null)
          Positioned(
            top: -10,
            right: 30,
            child: Container(

              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFF7D23E0), width: 1),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color:Color(0xFF7D23E0),

                  fontWeight: FontWeight.w600,
                  fontFamily: 'Schyler',
                ),
              ),
            ),
          ),
      ],
    ),
  );
}


@override
Widget build(BuildContext context) {
  return Column(
    children: [
      buildOption(0, 'Monthly', '₹699', '₹8.5 Per day'),SizedBox(height: 10),
      buildOption(1, 'Quarterly', '₹1900', '₹6.5 Per day'),SizedBox(height: 10),
      buildOption(2, 'Full Course', '₹5591', 'Most Valued ₹4.5 Per day'),
    ],
  );
}
}