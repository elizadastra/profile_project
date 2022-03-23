import 'package:flutter/material.dart';

import '../../../constants/assets_images.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_texts.dart';
import 'friends.dart';

class Media extends StatefulWidget {
  const Media({
    Key? key,
  }) : super(key: key);

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final List<String> images = [
    AssetsImages.rectangle6,
    AssetsImages.rectangle7,
    AssetsImages.rectangle8,
    AssetsImages.rectangle9,
    AssetsImages.rectangle10,
    AssetsImages.rectangle11,
    AssetsImages.rectangle12,
    AssetsImages.rectangle13,
    AssetsImages.rectangle14,
  ];

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: images.isNotEmpty
              ? Text(
                  'My media',
                  style: CustomText.s24W400,
                )
              : Text(
                  'Список галареи пуст!!!',
                  style: CustomText.s24W400,
                ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Image(
                  image: AssetImage(
                    images[index],
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 14,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.9),
                        color: CustomColors.foriconButton,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        splashRadius: 1.0,
                        onPressed: () {
                          setState(() {
                            images.removeAt(index);
                            snackBarShow(context);
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 25, right: 15.0, left: 15.0, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff6200EE),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 243, 6, 6),
                    ),
                  ),
                  onPressed: () {
                    if (images.isNotEmpty) {
                      setState(() {
                        images.removeRange(0, images.length);
                        snackBarShow(context);
                      });
                    } else {
                      snackBarShow(context, message: 'Галерия Пустая!!!');
                      print('empty');
                    }
                  },
                  child: const Text('Delete'),
                ),
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xff6200EE),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
