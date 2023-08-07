class Review {
  final String name;
  final double rating;
  final String reviewNote;
  final DateTime createdAt;

  Review({
    required this.name,
    this.rating = 0,
    this.reviewNote = '',
    required this.createdAt,
  });
}
