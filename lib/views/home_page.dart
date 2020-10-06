import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_cart/core/models/chair_model.dart';
import 'package:shop_cart/core/provider_registry.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';
import 'package:shop_cart/widgets/background.dart';
import 'package:shop_cart/widgets/bottom_card.dart';
import 'package:shop_cart/widgets/chair_items.dart';

final chairListProvider = homeProvider.select((v) => v.chairList);
final totalItemsProvider = homeProvider.select((v) => v.totalItems);
final totalCostProvider = homeProvider.select(
  (v) => v.totalCost?.toStringAsFixed(2),
);

class HomePage extends HookWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalItems = useProvider(totalItemsProvider);
    var totalCost = useProvider(totalCostProvider);

    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YMargin(130),
          Row(
            children: [
              const XMargin(40),
              Text('Shopping',
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 28)),
            ],
          ),
          Row(
            children: [
              const XMargin(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Cart',
                      style: TextStyle(
                          color: darkGrey,
                          fontWeight: FontWeight.w300,
                          fontSize: 28)),
                  XMargin(context.screenWidth(0.56)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      size: 32,
                      color: darkGrey,
                    ),
                  )
                ],
              ),
            ],
          ),
          const YMargin(10),
          Row(
            children: [
              const XMargin(40),
              Text(
                  '${totalItems ?? 0}'
                  ' items for ',
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 19)),
              Text(
                  '\$'
                  '${totalCost ?? 0.00}',
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 18)),
            ],
          ),
          const YMargin(10),
          CardList(),
          const BottomCard()
        ],
      ),
    );
  }
}

class CardList extends HookWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var chairList = useProvider(chairListProvider);
    return Expanded(
      child: FadingEdgeScrollView.fromScrollView(
        gradientFractionOnEnd: 0.5,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: chairList?.length ?? 0,
          itemBuilder: (BuildContext context, int i) {
            return ChairListItem(model: chairList[i]);
          },
        ),
      ),
    );
  }
}
