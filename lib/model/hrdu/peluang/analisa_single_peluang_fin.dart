import 'dart:convert';

class AnalisaSingleRegplgFinishing {
  AnalisaSingleRegplgFinishing({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegplgFinishing.fromRawJson(String str) => AnalisaSingleRegplgFinishing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegplgFinishing.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgFinishing(
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
    this.analisaFinFnBp,
    this.analisaFinFnSc,
    this.analisaFinFnLc,
  });

  final List<AnalisaFinFn?>? analisaFinFnBp;
  final List<AnalisaFinFn?>? analisaFinFnSc;
  final List<AnalisaFinFn?>? analisaFinFnLc;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    analisaFinFnBp: List<AnalisaFinFn>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinFn.fromJson(x))),
    analisaFinFnSc: List<AnalisaFinFn>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinFn.fromJson(x))),
    analisaFinFnLc: List<AnalisaFinFn>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinFn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "analisa_fin_fn_bp": List<dynamic>.from(analisaFinFnBp!.map((x) => x!.toJson())),
    "analisa_fin_fn_sc": List<dynamic>.from(analisaFinFnSc!.map((x) => x!.toJson())),
    "analisa_fin_fn_lc": List<dynamic>.from(analisaFinFnLc!.map((x) => x!.toJson())),
  };
}

class AnalisaFinFn {
  AnalisaFinFn({
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

  factory AnalisaFinFn.fromRawJson(String str) => AnalisaFinFn.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinFn.fromJson(Map<String, dynamic> json) => AnalisaFinFn(
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
