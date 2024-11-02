// user_repository.dart
import 'package:hookee/features/home/data/models/user_model.dart';

class UserRepository {
  List<User> getUsers() {
    return [
      User(
        name: 'Alexa',
        age: 22,
        profession: 'UI/UX Designer',
        imageUrl: 'assets/model.webp',
      ),
      // Add more users as needed
    ];
  }
}
