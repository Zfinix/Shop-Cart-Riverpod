import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:shop_cart/core/provider_registry.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';

class BottomCard extends HookWidget {
  const BottomCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeProvider);
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        children: [
          Flexible(
              flex: 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  height: 50,
                  child: Material(
                    color: darkGrey,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text('Pay Order',
                                style: TextStyle(
                                  color: orange,
                                  fontSize: 14,
                                )),
                            Spacer(),
                            Text(
                                '\$${provider?.totalCost?.toStringAsFixed(2) ?? 0.00}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: orange,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          const XMargin(10),
          Flexible(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: darkGrey,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Icon(
                  Icons.face,
                  color: yellow,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
