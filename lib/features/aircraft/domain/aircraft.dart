class Aircraft {
  const Aircraft({
    required this.id,
    required this.registration,
    this.model,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String registration;
  final String? model;
  final DateTime createdAt;
  final DateTime updatedAt;

  Aircraft copyWith({
    String? id,
    String? registration,
    String? model,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Aircraft(
      id: id ?? this.id,
      registration: registration ?? this.registration,
      model: model ?? this.model,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'registration': registration,
      'model': model,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory Aircraft.fromMap(Map<String, Object?> map) {
    return Aircraft(
      id: map['id']! as String,
      registration: map['registration']! as String,
      model: map['model'] as String?,
      createdAt: DateTime.parse(map['created_at']! as String),
      updatedAt: DateTime.parse(map['updated_at']! as String),
    );
  }
}
