import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicina/models/products.dart';

import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 100,
    this.aspectRection = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRection;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRection,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(151, 151, 151, 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  product.images[0],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.title,
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   "\$${product.price}",
                //   style: TextStyle(
                //     fontSize: getProportionateScreenWidth(18),
                //     fontWeight: FontWeight.w600,
                //     color: kPrimaryColor,
                //   ),
                // ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? const Color.fromRGBO(255, 118, 67, 0.15)
                          : const Color.fromRGBO(255, 118, 67, 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      colorFilter: const ColorFilter.mode(
                          Color(0XFFFF4848), BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
