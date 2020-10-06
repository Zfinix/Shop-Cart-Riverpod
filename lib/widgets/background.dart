import 'package:flutter/material.dart';
import 'package:shop_cart/utils/colors.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: Container(
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/mesh.png'),
          ),
          child ?? Container()
        ]),
      ),
    );
  }
}
