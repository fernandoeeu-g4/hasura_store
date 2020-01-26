import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {

  ProductCardWidget({this.screenWidth, this.productName, this.mainCategory, this.secondaryCategory, this.productPrice});

  final double screenWidth;
  final String productName;
  final String mainCategory;
  final String secondaryCategory;
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            // boxShadow: [BoxShadow(
            //   color: Colors.grey,
            //   blurRadius: 10.0,
            //   spreadRadius: 1.0,
            //   offset: Offset(0.0, 0.0)
            // )],
            ),
        height: 122,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: screenWidth / 2,
                    child: Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mainCategory.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffA1A1A1),
                        ),
                      ),
                      Text(
                        secondaryCategory.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffA1A1A1)),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'R\$ ${productPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
