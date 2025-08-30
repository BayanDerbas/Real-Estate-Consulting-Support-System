import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewImagePage extends StatelessWidget {
  final ImageProvider imageProvider;

  ViewImagePage(this.imageProvider);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(child: Image(image: imageProvider));
  }
}

class ViewImageController extends GetxController {
  TransformationController? transformationController;
}
