/// Notification entity representing user's notification data
class NotificationEntity {
  final int count;
  final bool hasUnread;

  const NotificationEntity({
    required this.count,
    this.hasUnread = true,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationEntity &&
        other.count == count &&
        other.hasUnread == hasUnread;
  }

  @override
  int get hashCode => count.hashCode ^ hasUnread.hashCode;

  NotificationEntity copyWith({
    int? count,
    bool? hasUnread,
  }) {
    return NotificationEntity(
      count: count ?? this.count,
      hasUnread: hasUnread ?? this.hasUnread,
    );
  }
}
