
import 'package:daniel_ui_template_lib/enums/banner_type.dart';

class BannerModel {
  final String? announceId;
  final BannerType type;
  final String? title;
  final String? content;
  final String? imageUrl;
  final String? eventUrl;
  final DateTime? dateTime;

//<editor-fold desc="Data Methods">
  const BannerModel({
    this.announceId,
    required this.type,
    this.title,
    this.content,
    this.imageUrl,
    this.eventUrl,
    this.dateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BannerModel &&
          runtimeType == other.runtimeType &&
          announceId == other.announceId &&
          type == other.type &&
          title == other.title &&
          content == other.content &&
          imageUrl == other.imageUrl &&
          eventUrl == other.eventUrl &&
          dateTime == other.dateTime);

  @override
  int get hashCode =>
      announceId.hashCode ^
      type.hashCode ^
      title.hashCode ^
      content.hashCode ^
      imageUrl.hashCode ^
      eventUrl.hashCode ^
      dateTime.hashCode;

  @override
  String toString() {
    return 'BannerModel{' +
        ' announceId: $announceId,' +
        ' type: $type,' +
        ' title: $title,' +
        ' content: $content,' +
        ' imageUrl: $imageUrl,' +
        ' eventUrl: $eventUrl,' +
        ' dateTime: $dateTime,' +
        '}';
  }

  BannerModel copyWith({
    String? announceId,
    BannerType? type,
    String? title,
    String? content,
    String? imageUrl,
    String? eventUrl,
    DateTime? dateTime,
  }) {
    return BannerModel(
      announceId: announceId ?? this.announceId,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      eventUrl: eventUrl ?? this.eventUrl,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'announceId': this.announceId,
      'type': this.type,
      'title': this.title,
      'content': this.content,
      'imageUrl': this.imageUrl,
      'eventUrl': this.eventUrl,
      'dateTime': this.dateTime,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      announceId: map['announceId'] as String,
      type: map['type'] as BannerType,
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      eventUrl: map['eventUrl'] as String,
      dateTime: map['dateTime'] as DateTime,
    );
  }

//</editor-fold>
}