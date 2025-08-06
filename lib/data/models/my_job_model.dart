class MyJobModel {
  final int id;
  final String title;
  final String userName;
  final String location;
  final String price;
  final int rating;
  final String description;
  final String timeAgo;
  final String avatarPath;
  final bool isFavorite;
  final String status; // in_progress / done

  MyJobModel({
    required this.id,
    required this.title,
    required this.userName,
    required this.location,
    required this.price,
    required this.rating,
    required this.description,
    required this.timeAgo,
    required this.avatarPath,
    required this.isFavorite,
    required this.status,
  });

  factory MyJobModel.fromJson(Map<String, dynamic> json) {
    return MyJobModel(
      id: json['id'],
      title: json['title'],
      userName: json['user_name'],
      location: json['location'],
      price: json['price'],
      rating: json['rating'],
      description: json['description'],
      timeAgo: json['time_ago'],
      avatarPath: json['avatar_path'],
      isFavorite: json['is_favorite'] ?? false,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'user_name': userName,
      'location': location,
      'price': price,
      'rating': rating,
      'description': description,
      'time_ago': timeAgo,
      'avatar_path': avatarPath,
      'is_favorite': isFavorite,
      'status': status,
    };
  }
}
