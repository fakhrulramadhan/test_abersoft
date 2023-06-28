class PaginationFilter {
  int offset = 0;
  int limit = 10;

  @override
  String toString() => 'PaginationFilter(offset: $offset, limit: $limit)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginationFilter &&
        other.offset == offset &&
        other.limit == limit;
  }

  @override
  int get hashCode => offset.hashCode ^ limit.hashCode;
}
