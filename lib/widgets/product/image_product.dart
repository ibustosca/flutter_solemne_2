import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String? url;
  final BorderRadius? borderRadius;

  const ImageProduct({super.key, this.url, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child:
            url == null
                ? const Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                )
                : FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(url!),
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
