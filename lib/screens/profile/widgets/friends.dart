import 'package:flutter/material.dart';

import '../../../constants/custom_colors.dart';
import '../../../constants/custom_texts.dart';
import 'workers.dart';

class Friends extends StatefulWidget {
  const Friends({
    Key? key,
  }) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 16),
              EmployeeInfo.isEmpty
                  ? const Text(
                      'Список друзей пуст!!!!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 214, 91, 83)),
                    )
                  : Text(
                      'Friends',
                      style: CustomText.s16W400,
                    ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        SizedBox(
          height: EmployeeInfo.isEmpty ? 0: 310,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(EmployeeInfo[index].image),
                  ),
                  title: Text(EmployeeInfo[index].fullName),
                  subtitle: Text(EmployeeInfo[index].specialist),
                  trailing: IconButton(
                    onPressed: () {
                      _deleteFriends(index);
                    },
                    icon: GestureDetector(
                      onDoubleTap: () => setState(() {
                        EmployeeInfo.removeAt(index);
                        snackBarShow(context);
                      }),
                      child: Icon(
                        Icons.close,
                        color: CustomColors.foricon,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  indent: 93,
                  thickness: 2,
                );
              },
              itemCount: EmployeeInfo.length),
        )
      ],
    );
  }

  void _deleteFriends(int index) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text('Are you sure to delete?? '),
          content: Text(EmployeeInfo[index].fullName),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.red)),
              child: const Text("Yes"),
              onPressed: () {
                setState(() {
                  EmployeeInfo.removeAt(index);
                  snackBarShow(context);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

void snackBarShow(context, {String message = 'Successfully Deleted!!'}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Color.fromARGB(255, 14, 228, 21)),
    ),
    duration: const Duration(seconds: 2),
  ));
}
