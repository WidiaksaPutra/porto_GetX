import 'dart:convert';

class AnalisaSingleRegplgPenunjang {
  AnalisaSingleRegplgPenunjang({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegplgPenunjang.fromRawJson(String str) => AnalisaSingleRegplgPenunjang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegplgPenunjang.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgPenunjang(
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
    this.analisaFinTpFs,
    this.analisaFinTpLc,
    this.analisaFinTpMp,
    this.analisaFinTpBop,
  });

  final List<AnalisaFinTp?>? analisaFinTpFs;
  final List<AnalisaFinTp?>? analisaFinTpLc;
  final List<AnalisaFinTp?>? analisaFinTpMp;
  final List<AnalisaFinTp?>? analisaFinTpBop;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    analisaFinTpFs: List<AnalisaFinTp>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpLc: List<AnalisaFinTp>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpMp: List<AnalisaFinTp>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpBop: List<AnalisaFinTp>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTp.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "analisa_fin_tp_fs": List<dynamic>.from(analisaFinTpFs!.map((x) => x!.toJson())),
    "analisa_fin_tp_lc": List<dynamic>.from(analisaFinTpLc!.map((x) => x!.toJson())),
    "analisa_fin_tp_mp": List<dynamic>.from(analisaFinTpMp!.map((x) => x!.toJson())),
    "analisa_fin_tp_bop": List<dynamic>.from(analisaFinTpBop!.map((x) => x!.toJson())),
  };
}

class AnalisaFinTp {
  AnalisaFinTp({
    this.idAnalisaBarangJadiTipeFs,
    this.idBarangJadi,
    this.idItemBahan,
    this.kodeItemBahan,
    this.namaItem,
    this.idSatuan,
    this.namaSatuan,
    this.qty,
    this.hargaSatuan,
    this.koefisien,
    this.ref,
    this.idFinishingBarangJadi,
    this.namaFinishingBarangJadi,
  });

  final String? idAnalisaBarangJadiTipeFs;
  final String? idBarangJadi;
  final String? idItemBahan;
  final String? kodeItemBahan;
  final String? namaItem;
  final String? idSatuan;
  final String? namaSatuan;
  final String? qty;
  final String? hargaSatuan;
  final String? koefisien;
  final String? ref;
  final String? idFinishingBarangJadi;
  final String? namaFinishingBarangJadi;

  factory AnalisaFinTp.fromRawJson(String str) => AnalisaFinTp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTp.fromJson(Map<String, dynamic> json) => AnalisaFinTp(
    idAnalisaBarangJadiTipeFs: json["id_analisa_barang_jadi_tipe_fs"],
    idBarangJadi: json["id_barang_jadi"],
    idItemBahan: json["id_item_bahan"],
    kodeItemBahan: json["kode_item_bahan"],
    namaItem: json["nama_item"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    qty: json["qty"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    ref: json["ref"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
  );

  Map<String, dynamic> toJson() => {
    "id_analisa_barang_jadi_tipe_fs": idAnalisaBarangJadiTipeFs,
    "id_barang_jadi": idBarangJadi,
    "id_item_bahan": idItemBahan,
    "kode_item_bahan": kodeItemBahan,
    "nama_item": namaItem,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "qty": qty,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "ref": ref,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
  };
}
