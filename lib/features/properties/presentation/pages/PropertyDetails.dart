import 'package:flutter/material.dart';

import '../widgets/Custom_PropertyDetails.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPropertyDetails(
        imagePath: 'assets/images/villa.jpg',
        price: '500',
        title: 'Luxury villa',
        location: 'Qalamoun, Deir Atiyah',
        area: '240 m²',
        beds: '2',
        baths: '3',
        details: 'This is a beautiful villa located in a quiet area with amazing views...'
            '\n............................................................'
            '\n............................................................'
            '\n............................................................'
            '\n............................................................'
            '\n............................................................'
            '\n............................................................'
            '\n............................................................'
            '\n........................................................... ',
      ),
    );
  }
}
