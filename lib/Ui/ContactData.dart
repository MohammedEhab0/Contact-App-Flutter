class ContactData {
  final int id; // Unique identifier for each contact
  String name;
  String email;
  String number;
  String image;

  ContactData({
    required this.id, // Make id required in the constructor
    required this.name,
    required this.image,
    required this.email,
    required this.number,
  });
}
