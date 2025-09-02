class BookModel {
  final String id;
  final String title;
  final String? subtitle;
  final List<String> authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String> categories;
  final String? thumbnail;

  BookModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    required this.categories,
    this.thumbnail,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No Title',
      subtitle: volumeInfo['subtitle'],
      authors: volumeInfo['authors'] != null
          ? List<String>.from(volumeInfo['authors'])
          : [],
      publisher: volumeInfo['publisher'],
      publishedDate: volumeInfo['publishedDate'],
      description: volumeInfo['description'],
      pageCount: volumeInfo['pageCount'],
      categories: volumeInfo['categories'] != null
          ? List<String>.from(volumeInfo['categories'])
          : [], 
    thumbnail: volumeInfo['imageLinks'] != null
    ? (volumeInfo['imageLinks']['thumbnail'] as String).replaceAll("http://", "https://")
    : null,
    );
  }
}
