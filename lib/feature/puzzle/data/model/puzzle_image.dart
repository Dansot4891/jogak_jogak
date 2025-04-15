// ignore_for_file: public_member_api_docs, sort_constructors_first
class PuzzleImage {
  final String imageUrl;
  final String source;
  PuzzleImage({required this.imageUrl, required this.source});

  @override
  String toString() => 'PuzzleImage(imageUrl: $imageUrl, source: $source)';

  @override
  bool operator ==(covariant PuzzleImage other) {
    if (identical(this, other)) return true;

    return other.imageUrl == imageUrl && other.source == source;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ source.hashCode;

  PuzzleImage copyWith({String? imageUrl, String? source}) {
    return PuzzleImage(
      imageUrl: imageUrl ?? this.imageUrl,
      source: source ?? this.source,
    );
  }
}
