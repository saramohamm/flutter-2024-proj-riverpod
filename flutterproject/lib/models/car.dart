final class Car {
  final int? id;
  final String title;
  final String description;
  final String genre;
  final String platform;
  final String publisher;
  final String releaseDate;
  final String imageUrl;

  Car({
    this.id,
    required this.title,
    required this.description,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.releaseDate,
    required this.imageUrl,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      genre: json['genre'],
      platform: json['platform'],
      publisher: json['publisher'],
      releaseDate: json['releaseDate'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'genre': genre,
      'platform': platform,
      'publisher': publisher,
      'releaseDate': releaseDate,
      'imageUrl': imageUrl,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Car otherCar = other as Car;
    return id == otherCar.id &&
           title == otherCar.title &&
           description == otherCar.description &&
           genre == otherCar.genre &&
           platform == otherCar.platform &&
           publisher == otherCar.publisher &&
           releaseDate == otherCar.releaseDate &&
           imageUrl == otherCar.imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode ^ genre.hashCode ^ platform.hashCode ^ publisher.hashCode ^ releaseDate.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'Car{id: $id, title: $title, description: $description, genre: $genre, platform: $platform, publisher: $publisher, releaseDate: $releaseDate, imageUrl: $imageUrl}';
  }
}
