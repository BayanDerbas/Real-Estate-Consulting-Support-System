import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/Custom_Buttom.dart';
import 'package:graduation_project/core/constants/colors.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.aquaBlue,
      ),
      body: Center(
        child: CustomButtom(
            text:"text_bayan",
            backgroundColor: colors.purple,
            textColor: colors.goldenYellow,
            width: 200,
            onPressed: (){},
        ),
      ),
    );
  }
}
