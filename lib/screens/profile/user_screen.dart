import 'package:profile_project/constants/assets_images.dart';
import 'package:profile_project/constants/custom_colors.dart';
import 'package:profile_project/constants/custom_texts.dart';
import 'package:profile_project/screens/profile/widgets/buttons.dart';
import 'package:profile_project/screens/profile/widgets/friends.dart';

import 'package:flutter/material.dart';
import 'package:profile_project/screens/profile/widgets/media.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String defaultImage = AssetsImages.tina;

  Future refresh() async {
    setState(() {
      defaultImage = AssetsImages.cristofer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.forBackground,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: CustomColors.appBar,
        title: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: Text(
            'Profile',
            style: CustomText.s20W500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.colorForIcon,
          ),
        ),
      ),
      body: RefreshIndicator(
        semanticsLabel: 'dsfafaftyghuijkodrcftvgyuhinjd5cf6vgyuhij',
        color: Colors.red,
        backgroundColor: Colors.blue,
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatarCustom(),
              SizedBox(height: 12),
              Categories(),
              Friends(),
              SizedBox(height: 38),
              ButtonAddFriend(),
              SizedBox(height: 16),
              Media()
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarCustom extends StatelessWidget {
  const CircleAvatarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Stack(
            children: [
              Image.asset(
                AssetsImages.tina,
                height: 118,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.9),
                      color: CustomColors.foriconAvatar,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      splashRadius: 1.0,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Tiana Rosserss',
            style: CustomText.s16W400.copyWith(height: 1.5),
          ),
          const SizedBox(height: 2),
          Text(
            'Developer',
            style: CustomText.s12W400Positions.copyWith(height: 1.5),
          ),
          const SizedBox(height: 24),
          const Divider(
            indent: 1,
            endIndent: 4,
            thickness: 2,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Select type',
                style: CustomText.s16W400,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ButtonAddFriend extends StatefulWidget {
  const ButtonAddFriend({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonAddFriend> createState() => ButtonAddFriendState();
}

class ButtonAddFriendState extends State<ButtonAddFriend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: OutlinedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: ((context) => AddFriends()),
                //   ),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add friend',
                    style: CustomText.s16W500,
                  ),
                  const SizedBox(width: 15),
                  const Icon(Icons.add)
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
