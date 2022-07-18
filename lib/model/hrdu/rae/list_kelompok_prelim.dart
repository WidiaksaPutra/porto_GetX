import 'dart:convert';

class ListKelompokPrelimRegrae {
  ListKelompokPrelimRegrae({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum?>? data;

  factory ListKelompokPrelimRegrae.fromRawJson(String str) => ListKelompokPrelimRegrae.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListKelompokPrelimRegrae.fromJson(Map<String, dynamic> json) => ListKelompokPrelimRegrae(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
  };
}

class Datum {
  Datum({
    this.idKelompok,
    this.namaKelompok,
    this.keteranganKelompok,
    this.idBuaso,
    this.namaBuaso,
    this.isHidden,
    this.flag,
  });

  final String? idKelompok;
  final String? namaKelompok;
  final String? keteranganKelompok;
  final String? idBuaso;
  final String? namaBuaso;
  final bool? isHidden;
  final String? flag;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idKelompok: json["id_kelompok"],
    namaKelompok: json["nama_kelompok"],
    keteranganKelompok: json["keterangan_kelompok"],
    idBuaso: json["id_buaso"],
    namaBuaso: json["nama_buaso"],
    isHidden: json["is_hidden"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "id_kelompok": idKelompok,
    "nama_kelompok": namaKelompok,
    "keterangan_kelompok": keteranganKelompok,
    "id_buaso": idBuaso,
    "nama_buaso": namaBuaso,
    "is_hidden": isHidden,
    "flag": flag,
  };
}
