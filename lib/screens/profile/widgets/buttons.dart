import 'package:profile_project/screens/profile/userscreen_secondversion.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int colorButton = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            itemCount: brand.length,
            itemBuilder: (context, index) {
              return TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: index == colorButton
                              ? const Color(0xffdbb2ff)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(68),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    index == colorButton
                        ? const Color(0xfff2e7fe)
                        : const Color(0xffebebeb),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserScreenSecondVersion(),
                    ),
                  );
                  setState(
                    () {
                      colorButton = index;
                    },
                  );
                },
                child: Text(
                  brand[index].name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: index == colorButton
                        ? const Color(0xff6200EE)
                        : const Color(0xff929292),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
