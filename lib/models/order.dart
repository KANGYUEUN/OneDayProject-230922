// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class OderInfo {
  num? o_seq; //auto increment	PK
  String? o_table; //NOT NULL
  num? o_pcode; //NOT NULL
  num? o_price; //NOT NULL
  num? o_count; //NOT NULL
  num? o_total; //NOT NULL
  String? o_buyer;

  OderInfo({
    this.o_seq,
    this.o_table,
    this.o_pcode,
    this.o_price,
    this.o_count,
    this.o_total,
    this.o_buyer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'o_seq': o_seq,
      'o_table': o_table,
      'o_pcode': o_pcode,
      'o_price': o_price,
      'o_count': o_count,
      'o_total': o_total,
      'o_buyer': o_buyer,
    };
  }

  factory OderInfo.fromMap(Map<String, dynamic> map) {
    return OderInfo(
      o_seq: map['o_seq'] != null ? map['o_seq'] as num : null,
      o_table: map['o_table'] != null ? map['o_table'] as String : null,
      o_pcode: map['o_pcode'] != null ? map['o_pcode'] as num : null,
      o_price: map['o_price'] != null ? map['o_price'] as num : null,
      o_count: map['o_count'] != null ? map['o_count'] as num : null,
      o_total: map['o_total'] != null ? map['o_total'] as num : null,
      o_buyer: map['o_buyer'] != null ? map['o_buyer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OderInfo.fromJson(String source) =>
      OderInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OderInfo(o_seq: $o_seq, o_table: $o_table, o_pcode: $o_pcode, o_price: $o_price, o_count: $o_count, o_total: $o_total, o_buyer: $o_buyer)';
  }

  OderInfo copyWith({
    num? o_seq,
    String? o_table,
    num? o_pcode,
    num? o_price,
    num? o_count,
    num? o_total,
    String? o_buyer,
  }) {
    return OderInfo(
      o_seq: o_seq ?? this.o_seq,
      o_table: o_table ?? this.o_table,
      o_pcode: o_pcode ?? this.o_pcode,
      o_price: o_price ?? this.o_price,
      o_count: o_count ?? this.o_count,
      o_total: o_total ?? this.o_total,
      o_buyer: o_buyer ?? this.o_buyer,
    );
  }

  @override
  bool operator ==(covariant OderInfo other) {
    if (identical(this, other)) return true;

    return other.o_seq == o_seq &&
        other.o_table == o_table &&
        other.o_pcode == o_pcode &&
        other.o_price == o_price &&
        other.o_count == o_count &&
        other.o_total == o_total &&
        other.o_buyer == o_buyer;
  }

  @override
  int get hashCode {
    return o_seq.hashCode ^
        o_table.hashCode ^
        o_pcode.hashCode ^
        o_price.hashCode ^
        o_count.hashCode ^
        o_total.hashCode ^
        o_buyer.hashCode;
  }
}
