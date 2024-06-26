import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinone_gallery/core/colors.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/models/product_model.dart';
import 'package:coinone_gallery/network/urls.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: buttonBgColor),
          color: bgColor),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "${Urls.imageUrl}${product.imgUrlPath}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "${Urls.imageUrl}${product.imgUrlPath}",
                  placeholder: (context, url) {
                    return Lottie.asset(
                      "assets/imgLoading.json",
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          height10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          height15
        ],
      ),
    );
  }
}
