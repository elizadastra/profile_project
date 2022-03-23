import 'package:profile_project/screens/profile/user_screen.dart';
import 'package:profile_project/screens/profile/widgets/buttons.dart';
import 'package:profile_project/screens/profile/widgets/friends.dart';
import 'package:flutter/material.dart';
import 'package:profile_project/screens/profile/widgets/media.dart';

import '../../constants/custom_texts.dart';

class UserScreenSecondVersion extends StatelessWidget {
  const UserScreenSecondVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 2,
            expandedHeight: 300,
            title: Text(
              'Profile',
              style: CustomText.s20W500,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'SLIVER',
                style: TextStyle(color: Colors.white),
              ),
              background: Image.network(
                'https://images.immediate.co.uk/production/volatile/sites/4/2021/08/mountains-7ddde89.jpg?quality=90&resize=768,574',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                splashRadius: 1,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const CircleAvatarCustom(),
              const SizedBox(height: 12),
              const Categories(),
              const Friends(),
              const SizedBox(height: 38),
              const ButtonAddFriend(),
              const SizedBox(height: 16),
              const Media(),
            ]),
          ),
        ],
      ),
    );
  }
}
