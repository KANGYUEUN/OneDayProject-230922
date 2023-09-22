// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class GimProductDto {
  String? p_code; //CHAR(10)		PK
  String? p_gimbab; //VARCHAR(30)	NOT NULL
  String? p_ramen; //VARCHAR(30)	NOT NULL
  String? p_ddeck; //VARCHAR(30)	NOT NULL
  num? p_price; //INT	NOT NULL
  String? p_rem; //VARCHAR(30)
  int? quantity;

  GimProductDto({
    this.p_code,
    this.p_gimbab,
    this.p_ramen,
    this.p_ddeck,
    this.p_price,
    this.p_rem,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_code': p_code,
      'p_gimbab': p_gimbab,
      'p_ramen': p_ramen,
      'p_ddeck': p_ddeck,
      'p_price': p_price,
      'p_rem': p_rem,
    };
  }

  factory GimProductDto.fromMap(Map<String, dynamic> map) {
    return GimProductDto(
      p_code: map['p_code'] != null ? map['p_code'] as String : null,
      p_gimbab: map['p_gimbab'] != null ? map['p_gimbab'] as String : null,
      p_ramen: map['p_ramen'] != null ? map['p_ramen'] as String : null,
      p_ddeck: map['p_ddeck'] != null ? map['p_ddeck'] as String : null,
      p_price: map['p_price'] != null ? map['p_price'] as num : null,
      p_rem: map['p_rem'] != null ? map['p_rem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GimProductDto.fromJson(String source) =>
      GimProductDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GimProductDto(p_code: $p_code, p_gimbab: $p_gimbab, p_ramen: $p_ramen, p_ddeck: $p_ddeck, p_price: $p_price, p_rem: $p_rem)';
  }

  GimProductDto copyWith({
    String? p_code,
    String? p_gimbab,
    String? p_ramen,
    String? p_ddeck,
    num? p_price,
    String? p_rem,
  }) {
    return GimProductDto(
      p_code: p_code ?? this.p_code,
      p_gimbab: p_gimbab ?? this.p_gimbab,
      p_ramen: p_ramen ?? this.p_ramen,
      p_ddeck: p_ddeck ?? this.p_ddeck,
      p_price: p_price ?? this.p_price,
      p_rem: p_rem ?? this.p_rem,
    );
  }

  @override
  bool operator ==(covariant GimProductDto other) {
    if (identical(this, other)) return true;

    return other.p_code == p_code &&
        other.p_gimbab == p_gimbab &&
        other.p_ramen == p_ramen &&
        other.p_ddeck == p_ddeck &&
        other.p_price == p_price &&
        other.p_rem == p_rem;
  }

  @override
  int get hashCode {
    return p_code.hashCode ^
        p_gimbab.hashCode ^
        p_ramen.hashCode ^
        p_ddeck.hashCode ^
        p_price.hashCode ^
        p_rem.hashCode;
  }
}
