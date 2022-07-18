import 'dart:convert';

class AnalisaSingleRegplgGambar {
  AnalisaSingleRegplgGambar({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegplgGambar.fromRawJson(String str) => AnalisaSingleRegplgGambar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegplgGambar.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgGambar(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.idBarangJadi,
    this.kodeItem,
    this.namaItem,
    this.idJenis,
    this.idSatuanJual,
    this.namaSatuan,
    this.namaJenis,
    this.kodeSatuan,
    this.linkReferensi,
    this.uraian,
    this.gambar,
  });

  final String? idBarangJadi;
  final String? kodeItem;
  final String? namaItem;
  final String? idJenis;
  final String? idSatuanJual;
  final String? namaSatuan;
  final String? namaJenis;
  final String? kodeSatuan;
  final String? linkReferensi;
  final String? uraian;
  final List<Gambar?>? gambar;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idBarangJadi: json["id_barang_jadi"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idJenis: json["id_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaSatuan: json["nama_satuan"],
    namaJenis: json["nama_jenis"],
    kodeSatuan: json["kode_satuan"],
    linkReferensi: json["link_referensi"],
    uraian: json["uraian"],
    gambar: List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_barang_jadi": idBarangJadi,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_jenis": idJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan": namaSatuan,
    "nama_jenis": namaJenis,
    "kode_satuan": kodeSatuan,
    "link_referensi": linkReferensi,
    "uraian": uraian,
    "gambar": List<dynamic>.from(gambar!.map((x) => x!.toJson())),
  };
}

class Gambar {
  Gambar({
    this.idItemBuasoGambarBarangJadi,
    this.idItemBuaso,
    this.pathGambar,
  });

  final String? idItemBuasoGambarBarangJadi;
  final String? idItemBuaso;
  final String? pathGambar;

  factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
    idItemBuasoGambarBarangJadi: json["id_item_buaso_gambar_barang_jadi"],
    idItemBuaso: json["id_item_buaso"],
    pathGambar: json["path_gambar"],
  );

  Map<String, dynamic> toJson() => {
    "id_item_buaso_gambar_barang_jadi": idItemBuasoGambarBarangJadi,
    "id_item_buaso": idItemBuaso,
    "path_gambar": pathGambar,
  };
}
