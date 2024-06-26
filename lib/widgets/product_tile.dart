import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/models/product_model.dart';
import 'package:coinone_gallery/network/urls.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade700),
      ),
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          height10,
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          height15
        ],
      ),
    );
  }
}
