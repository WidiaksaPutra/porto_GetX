import 'dart:convert';

class TipeFinishingRegrab {
  TipeFinishingRegrab({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum?>? data;

  factory TipeFinishingRegrab.fromRawJson(String str) => TipeFinishingRegrab.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TipeFinishingRegrab.fromJson(Map<String, dynamic> json) => TipeFinishingRegrab(
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
    this.idFinishingBarangJadi,
    this.namaFinishingBarangJadi,
    this.deskripsi,
    this.isHidden,
  });

  final String? idFinishingBarangJadi;
  final String? namaFinishingBarangJadi;
  final String? deskripsi;
  final bool? isHidden;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    deskripsi: json["deskripsi"],
    isHidden: json["is_hidden"],
  );

  Map<String, dynamic> toJson() => {
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "deskripsi": deskripsi,
    "is_hidden": isHidden,
  };
}
