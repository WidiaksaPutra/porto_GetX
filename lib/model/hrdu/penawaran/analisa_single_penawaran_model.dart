import 'dart:convert';

class AnalisaSingleRegpnw {
  AnalisaSingleRegpnw({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegpnw.fromRawJson(String str) => AnalisaSingleRegpnw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegpnw.fromJson(Map<String, dynamic> json) => AnalisaSingleRegpnw(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data!.toJson(),
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
    this.analisaHardwood,
    this.analisaPlywood,
    this.analisaFinTpFs,
    this.analisaFinTpLc,
    this.analisaFinTpMp,
    this.analisaFinTpBop,
    this.analisaFinFnBp,
    this.analisaFinFnSc,
    this.analisaFinFnLc,
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
  final List<AnalisaWood?>? analisaHardwood;
  final List<AnalisaWood?>? analisaPlywood;
  final List<AnalisaFin?>? analisaFinTpFs;
  final List<AnalisaFin?>? analisaFinTpLc;
  final List<AnalisaFin?>? analisaFinTpMp;
  final List<AnalisaFin?>? analisaFinTpBop;
  final List<AnalisaFin?>? analisaFinFnBp;
  final List<AnalisaFin?>? analisaFinFnSc;
  final List<AnalisaFin?>? analisaFinFnLc;
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
    analisaHardwood: json["analisa_hardwood"] == null ? null : List<AnalisaWood>.from(json["analisa_hardwood"].map((x) => AnalisaWood.fromJson(x))),
    analisaPlywood: json["analisa_plywood"] == null ? null : List<AnalisaWood>.from(json["analisa_plywood"].map((x) => AnalisaWood.fromJson(x))),
    analisaFinTpFs: json["analisa_fin_tp_fs"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinTpLc: json["analisa_fin_tp_lc"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinTpMp: json["analisa_fin_tp_mp"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinTpBop: json["analisa_fin_tp_bop"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinFnBp: json["analisa_fin_fn_bp"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinFnSc: json["analisa_fin_fn_sc"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFin.fromJson(x))),
    analisaFinFnLc: json["analisa_fin_fn_lc"] == null ? null : List<AnalisaFin>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFin.fromJson(x))),
    gambar: json["gambar"] == null ? null : List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
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
    "analisa_hardwood": analisaHardwood == null ? null : List<dynamic>.from(analisaHardwood!.map((x) => x!.toJson())),
    "analisa_plywood": analisaPlywood == null ? null : List<dynamic>.from(analisaPlywood!.map((x) => x!.toJson())),
    "analisa_fin_tp_fs": analisaFinTpFs == null ? null : List<dynamic>.from(analisaFinTpFs!.map((x) => x!.toJson())),
    "analisa_fin_tp_lc": analisaFinTpLc == null ? null : List<dynamic>.from(analisaFinTpLc!.map((x) => x!.toJson())),
    "analisa_fin_tp_mp": analisaFinTpMp == null ? null : List<dynamic>.from(analisaFinTpMp!.map((x) => x!.toJson())),
    "analisa_fin_tp_bop": analisaFinTpBop == null ? null : List<dynamic>.from(analisaFinTpBop!.map((x) => x!.toJson())),
    "analisa_fin_fn_bp": analisaFinFnBp == null ? null : List<dynamic>.from(analisaFinFnBp!.map((x) => x!.toJson())),
    "analisa_fin_fn_sc": analisaFinFnSc == null ? null : List<dynamic>.from(analisaFinFnSc!.map((x) => x!.toJson())),
    "analisa_fin_fn_lc": analisaFinFnLc == null ? null : List<dynamic>.from(analisaFinFnLc!.map((x) => x!.toJson())),
    "gambar": gambar == null ? null : List<dynamic>.from(gambar!.map((x) => x!.toJson())),
  };
}

class AnalisaFin {
  AnalisaFin({
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

  factory AnalisaFin.fromRawJson(String str) => AnalisaFin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFin.fromJson(Map<String, dynamic> json) => AnalisaFin(
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
  };
}

class AnalisaWood {
  AnalisaWood({
    this.idAnalisaBarangJadiHardwood,
    this.idBarangJadi,
    this.urutanItem,
    this.deskripsi,
    this.isHeader,
    this.idKayu,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
    this.namaItem,
    this.namaKayu,
    this.idSatuan,
    this.namaSatuan,
    this.idAnalisaBarangJadiPlywood,
  });

  final String? idAnalisaBarangJadiHardwood;
  final String? idBarangJadi;
  final String? urutanItem;
  final String? deskripsi;
  final bool? isHeader;
  final String? idKayu;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;
  final String? namaItem;
  final String? namaKayu;
  final String? idSatuan;
  final String? namaSatuan;
  final String? idAnalisaBarangJadiPlywood;

  factory AnalisaWood.fromRawJson(String str) => AnalisaWood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaWood.fromJson(Map<String, dynamic> json) => AnalisaWood(
    idAnalisaBarangJadiHardwood: json["id_analisa_barang_jadi_hardwood"],
    idBarangJadi: json["id_barang_jadi"],
    urutanItem: json["urutan_item"],
    deskripsi: json["deskripsi"],
    isHeader: json["is_header"],
    idKayu: json["id_kayu"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
    namaItem: json["nama_item"],
    namaKayu: json["nama_kayu"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    idAnalisaBarangJadiPlywood: json["id_analisa_barang_jadi_plywood"],
  );

  Map<String, dynamic> toJson() => {
    "id_analisa_barang_jadi_hardwood": idAnalisaBarangJadiHardwood,
    "id_barang_jadi": idBarangJadi,
    "urutan_item": urutanItem,
    "deskripsi": deskripsi,
    "is_header": isHeader,
    "id_kayu": idKayu,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
    "nama_item": namaItem,
    "nama_kayu": namaKayu,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "id_analisa_barang_jadi_plywood": idAnalisaBarangJadiPlywood,
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
