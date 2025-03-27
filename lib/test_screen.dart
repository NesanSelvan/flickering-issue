import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;

class ImageWidget extends StatelessWidget {
  final String? imageUrl;

  const ImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl!,
      color: const Color.fromARGB(255, 59, 59, 59).withOpacity(0.2),
      colorBlendMode: BlendMode.lighten,
      fit: BoxFit.cover,
      // placeholder: (context, url) =>
      //     const Center(child: CupertinoActivityIndicator()),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final String imageUrl =
      'https://thumbs.dreamstime.com/b/mobile-phone-wallpaper-soft-focus-delicate-flower-amidst-blurred-orange-meadow-sunset-354016436.jpg';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize with default values
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: [
              ImageWidget(
                imageUrl: imageUrl,
              ),
              ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent.withOpacity(1),
                          Colors.transparent.withOpacity(0.8),
                          Colors.transparent.withOpacity(0.6),
                          Colors.transparent.withOpacity(0.3),
                          Colors.transparent.withOpacity(0.1),
                          Colors.transparent,
                        ],
                        stops: const [0.33, 0.35, 0.38, 0.41, 0.45, 0.50],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ImageWidget(
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: CupertinoColors.black.withOpacity(0.6),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Navbar(),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent.withOpacity(0.3),
                ],
              ),
            ),
            child: Container(
              color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.05),
              child: Padding(
                padding: EdgeInsets.only(
                  top: topPadding + 0,
                  left: 0,
                  right: 10,
                  bottom: 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.xmark,
                        color: CupertinoColors.white,
                      ),
                    ),
                    Row(
                      children: [
                        CupertinoButton(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          minSize: 40,
                          child: const Icon(
                            CupertinoIcons.doc_on_doc,
                            color: CupertinoColors.white,
                          ),
                          onPressed: () {},
                        ),
                        CupertinoButton(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          minSize: 44,
                          child: const Icon(
                            CupertinoIcons.trash,
                            color: CupertinoColors.white,
                          ),
                          onPressed: () {},
                        ),
                        CupertinoButton(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          minSize: 44,
                          child: const Icon(
                            CupertinoIcons.arrow_up_circle,
                            color: CupertinoColors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
