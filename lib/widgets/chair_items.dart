import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_cart/core/models/chair_model.dart';
import 'package:shop_cart/core/provider_registry.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';

class ChairListItem extends StatefulHookWidget {
  final ChairModel model;

  const ChairListItem({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  _ChairListItemState createState() => _ChairListItemState();
}

class _ChairListItemState extends State<ChairListItem> {
  var numClicked = false;

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeProvider);
    return Material(
      color: provider.isSelected(widget.model) ? darkGrey : Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: _selected,
        onDoubleTap: numClicked ? null : _clear,
        onLongPress: !provider.isSelected(widget.model) ? null : _setNumClicked,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TOGGLE IMAGE
              if (!numClicked)
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      new BoxShadow(
                        spreadRadius: -17,
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 17,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/${widget.model.image}.png'),
                    ),
                  ),
                ),

              const XMargin(40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.model?.name ?? '',
                      style: TextStyle(
                        color: !provider.isSelected(widget.model)
                            ? darkGrey
                            : orange,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      )),
                  const YMargin(8),
                  Text('\$${widget.model?.price ?? ''}',
                      style: TextStyle(
                        color: !provider.isSelected(widget.model)
                            ? darkGrey
                            : orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      )),
                  //const YMargin(20),
                ],
              ),
              Spacer(),

              //Add/Subtract Button Rows & Quantity
              !numClicked
                  ? GestureDetector(
                      onTap: provider.isSelected(widget.model)
                          ? _setNumClicked
                          : null,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: !provider.isSelected(widget.model)
                                ? orange
                                : grey,
                            borderRadius: BorderRadius.circular(9)),
                        child: Center(
                          child: Text('${widget.model.quantity}',
                              style: TextStyle(
                                color: !provider.isSelected(widget.model)
                                    ? darkGrey
                                    : orange,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: !provider.isSelected(widget.model)
                                  ? orange
                                  : grey,
                              borderRadius: BorderRadius.circular(9)),
                          child: Center(
                            child: Text(widget.model.quantity.toString(),
                                style: TextStyle(
                                  color: !provider.isSelected(widget.model)
                                      ? darkGrey
                                      : orange,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                        const XMargin(15),
                        GestureDetector(
                          onTap: () => provider.addNum(widget.model),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: !provider.isSelected(widget.model)
                                    ? orange
                                    : grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text('+',
                                  style: TextStyle(
                                    color: !provider.isSelected(widget.model)
                                        ? darkGrey
                                        : orange,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ),
                        const XMargin(15),
                        GestureDetector(
                          onTap: () => provider.subNum(widget.model),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: !provider.isSelected(widget.model)
                                    ? orange
                                    : grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text('-',
                                  style: TextStyle(
                                    color: !provider.isSelected(widget.model)
                                        ? darkGrey
                                        : orange,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  _selected() {
    //Logic to handle onclick Event
    context.read(homeProvider).handleSelectedItemClick(widget.model);
  }

  _clear() {
    context.read(homeProvider).currentIndex = null;
    setState(() {
      numClicked = false;
    });
  }

  //Logic to handle longClick/ longPressed Event
  void _setNumClicked() {
    var provider = context.read(homeProvider);

    setState(() {
      numClicked = !numClicked;
    });
  }
}
