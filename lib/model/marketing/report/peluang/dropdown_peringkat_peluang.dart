import 'dart:convert';

class DropdownPeringkatPeluang {
  DropdownPeringkatPeluang({
    this.status,
    this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory DropdownPeringkatPeluang.fromRawJson(String str) => DropdownPeringkatPeluang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DropdownPeringkatPeluang.fromJson(Map<String, dynamic> json) => DropdownPeringkatPeluang(
      status: json["status"],
      message: json["message"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idPeringkatPeluang,
    this.namaPeringkatPeluang,
    this.keterangan,
    this.isHidden,
  });

  final String? idPeringkatPeluang;
  final String? namaPeringkatPeluang;
  final String? keterangan;
  final bool? isHidden;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPeringkatPeluang: json["id_peringkat_peluang"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    keterangan: json["keterangan"],
    isHidden: json["is_hidden"],
  );

  Map<String, dynamic> toJson() => {
    "id_peringkat_peluang": idPeringkatPeluang,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan": keterangan,
    "is_hidden": isHidden,
  };
}
