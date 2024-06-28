import 'package:e_store/utils/formatters/formatter.dart';

/// Model class represent model data
class UserModel {
  // keep those values which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number
  String get formatPhoneNo => EFormatter.formatNumber(phoneNumber);

  /// Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a userName from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName =
        "$firstName$lastName"; // Combine first and last name

    String userNameWithPrefix = "cwt_$camelCaseUserName"; // Add "cwt_" prefix
    return userNameWithPrefix;
  }

  /// Static function to crate a empty user model.
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// Convert model to Json structure to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'Phone': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to crate UserModel from a Firebase document snapshot.
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data();
  //     return UserModel(
  //       id: document.id,
  //       firstName: data?['FirstName'] ?? '',
  //       lastName: data?['FirstName'] ?? '',
  //       userName: data?['FirstName'] ?? '',
  //       email: data?['FirstName'] ?? '',
  //       phoneNumber: data?['FirstName'] ?? '',
  //       profilePicture: data?['FirstName'] ?? '',
  //     );
  //   }
  // }
}
