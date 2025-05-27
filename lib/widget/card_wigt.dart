import 'package:flutter/material.dart';

class CardWigt extends StatefulWidget{
  final String image;
  final String text;
final String? name;
final String? image2;
  const CardWigt({
    super.key,
    required this.image,
    required this.text,
    this.name,
    this.image2
  });


  @override
  _CardWigtState createState() => _CardWigtState();
}

class _CardWigtState extends State<CardWigt> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      height: 240,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: 
                    Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    ),
                
                    const SizedBox(width: 10),
                  
                
                  Column(
                    children: [
                      Text(widget.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                      Image.asset(
                        widget.image2 ?? 'asset/image/rateing.png',
                        height: 30,
                        width: 60,
                      ),
                    ],
                  ),
                
                
                
                ],
              ),const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    
                    widget.text.trim(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.w300)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}