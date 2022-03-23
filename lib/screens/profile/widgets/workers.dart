import 'package:profile_project/constants/assets_images.dart';

class Employee {
  final int id;
  final String fullName;
  final String image;
  final String specialist;

  Employee({
    required this.id,
    required this.image,
    required this.fullName,
    required this.specialist,
  });
}

final List<Employee> EmployeeInfo = [
  Employee(
    id: 1,
    fullName: 'Tiana Rosser',
    image: AssetsImages.tina,
    specialist: 'Developer',
  ),
  Employee(
    id: 2,
    fullName: 'Corey George',
    image: AssetsImages.corey,
    specialist: 'Developer',
  ),
  Employee(
    id: 3,
    fullName: 'Ahmad Vetrovs',
    image: AssetsImages.ahmad,
    specialist: 'Developer',
  ),
  Employee(
    id: 4,
    fullName: 'Cristofer Workman',
    image: AssetsImages.cristofer,
    specialist: 'Developer',
  ),
  Employee(
    id: 5,
    fullName: 'Tiana Korsgaard',
    image: AssetsImages.tina,
    specialist: 'Developer',
  ),
];
