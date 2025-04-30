import 'package:flutter/material.dart';

import '../widgets/Custom_PropertyDetails.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      CustomPropertyDetails(
        images: [
          'assets/images/balcony.jpg',
          'assets/images/bedroom.jpg',
          'assets/images/livingroom.jpg',
        ],
        price: '1200',
        title: 'Villa',
        location: 'New Cairo',
        area: '200m²',
        beds: '3',
        baths: '2',
        details: 'Spacious villa with garden and pool...',
        imagePath: 'assets/images/villa.jpg',
      ),
    );
  }
}
