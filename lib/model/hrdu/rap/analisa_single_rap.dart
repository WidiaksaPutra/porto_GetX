import 'dart:convert';

class AnalisaSingleRegrap {
  AnalisaSingleRegrap({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegrap.fromRawJson(String str) => AnalisaSingleRegrap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegrap.fromJson(Map<String, dynamic> json) => AnalisaSingleRegrap(
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
    this.idRapDetail,
    this.idRap,
    this.idBarangJadi,
    this.qtyRap,
    this.hargaSatuanRap,
    this.refUid,
    this.kodeItem,
    this.namaItem,
    this.namaSatuan,
    this.gambar,
    this.analisaHardwood,
    this.analisaPlywood,
    this.analisaFinTpFs,
    this.analisaFinTpLc,
    this.analisaFinTpMp,
    this.analisaFinTpBop,
    this.analisaFinFnBp,
    this.analisaFinFnSc,
    this.analisaFinFnLc,
    this.analisaLabourCostOnsite,
    this.analisaBiayaOverheadKantor,
    this.analisaAlatBantuOnsite,
  });

  final String? idRapDetail;
  final String? idRap;
  final String? idBarangJadi;
  final String? qtyRap;
  final String? hargaSatuanRap;
  final String? refUid;
  final String? kodeItem;
  final String? namaItem;
  final String? namaSatuan;
  final List<Gambar?>? gambar;
  final List<AnalisaHardwood?>? analisaHardwood;
  final List<AnalisaPlywood?>? analisaPlywood;
  final List<AnalisaFinTp?>? analisaFinTpFs;
  final List<AnalisaFinTp?>? analisaFinTpLc;
  final List<AnalisaFinTp?>? analisaFinTpMp;
  final List<AnalisaFinTp?>? analisaFinTpBop;
  final List<AnalisaFinFn?>? analisaFinFnBp;
  final List<AnalisaFinFn?>? analisaFinFnSc;
  final List<AnalisaFinFn?>? analisaFinFnLc;
  final List<dynamic>? analisaLabourCostOnsite;
  final List<dynamic>? analisaBiayaOverheadKantor;
  final List<dynamic>? analisaAlatBantuOnsite;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idRapDetail: json["id_rap_detail"],
    idRap: json["id_rap"],
    idBarangJadi: json["id_barang_jadi"],
    qtyRap: json["qty_rap"],
    hargaSatuanRap: json["harga_satuan_rap"],
    refUid: json["ref_uid"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaSatuan: json["nama_satuan"],
    gambar: List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
    analisaHardwood: List<AnalisaHardwood>.from(json["analisa_hardwood"].map((x) => AnalisaHardwood.fromJson(x))),
    analisaPlywood: List<AnalisaPlywood>.from(json["analisa_plywood"].map((x) => AnalisaPlywood.fromJson(x))),
    analisaFinTpFs: List<AnalisaFinTp>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpLc: List<AnalisaFinTp>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpMp: List<AnalisaFinTp>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinTpBop: List<AnalisaFinTp>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTp.fromJson(x))),
    analisaFinFnBp: List<AnalisaFinFn>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinFn.fromJson(x))),
    analisaFinFnSc: List<AnalisaFinFn>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinFn.fromJson(x))),
    analisaFinFnLc: List<AnalisaFinFn>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinFn.fromJson(x))),
    analisaLabourCostOnsite: List<dynamic>.from(json["analisa_labour_cost_onsite"].map((x) => x)),
    analisaBiayaOverheadKantor: List<dynamic>.from(json["analisa_biaya_overhead_kantor"].map((x) => x)),
    analisaAlatBantuOnsite: List<dynamic>.from(json["analisa_alat_bantu_onsite"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id_rap_detail": idRapDetail,
    "id_rap": idRap,
    "id_barang_jadi": idBarangJadi,
    "qty_rap": qtyRap,
    "harga_satuan_rap": hargaSatuanRap,
    "ref_uid": refUid,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_satuan": namaSatuan,
    "gambar": List<dynamic>.from(gambar!.map((x) => x!.toJson())),
    "analisa_hardwood": List<dynamic>.from(analisaHardwood!.map((x) => x!.toJson())),
    "analisa_plywood": List<dynamic>.from(analisaPlywood!.map((x) => x!.toJson())),
    "analisa_fin_tp_fs": List<dynamic>.from(analisaFinTpFs!.map((x) => x!.toJson())),
    "analisa_fin_tp_lc": List<dynamic>.from(analisaFinTpLc!.map((x) => x!.toJson())),
    "analisa_fin_tp_mp": List<dynamic>.from(analisaFinTpMp!.map((x) => x!.toJson())),
    "analisa_fin_tp_bop": List<dynamic>.from(analisaFinTpBop!.map((x) => x!.toJson())),
    "analisa_fin_fn_bp": List<dynamic>.from(analisaFinFnBp!.map((x) => x!.toJson())),
    "analisa_fin_fn_sc": List<dynamic>.from(analisaFinFnSc!.map((x) => x!.toJson())),
    "analisa_fin_fn_lc": List<dynamic>.from(analisaFinFnLc!.map((x) => x!.toJson())),
    "analisa_labour_cost_onsite": List<dynamic>.from(analisaLabourCostOnsite!.map((x) => x)),
    "analisa_biaya_overhead_kantor": List<dynamic>.from(analisaBiayaOverheadKantor!.map((x) => x)),
    "analisa_alat_bantu_onsite": List<dynamic>.from(analisaAlatBantuOnsite!.map((x) => x)),
  };
}

class AnalisaHardwood {
  AnalisaHardwood({
    this.idRapAnalisaBarangJadiHardwood,
    this.idRapDetail,
    this.idJenisKayu,
    this.idFinishingBarangJadi,
    this.idTipeSisi,
    this.idPartKayu,
    this.idDeskripsi,
    this.deskripsi,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.unitPrice,
    this.konstanta,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaJenisKayu,
    this.namaFinishingBarangJadi,
    this.namaTipeSisi,
    this.namaPartKayu,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRapAnalisaBarangJadiHardwood;
  final String? idRapDetail;
  final String? idJenisKayu;
  final String? idFinishingBarangJadi;
  final String? idTipeSisi;
  final String? idPartKayu;
  final String? idDeskripsi;
  final String? deskripsi;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? unitPrice;
  final String? konstanta;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaJenisKayu;
  final String? namaFinishingBarangJadi;
  final String? namaTipeSisi;
  final String? namaPartKayu;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaHardwood.fromRawJson(String str) => AnalisaHardwood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaHardwood.fromJson(Map<String, dynamic> json) => AnalisaHardwood(
    idRapAnalisaBarangJadiHardwood: json["id_rap_analisa_barang_jadi_hardwood"],
    idRapDetail: json["id_rap_detail"],
    idJenisKayu: json["id_jenis_kayu"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    idPartKayu: json["id_part_kayu"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaJenisKayu: json["nama_jenis_kayu"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    namaPartKayu: json["nama_part_kayu"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rap_analisa_barang_jadi_hardwood": idRapAnalisaBarangJadiHardwood,
    "id_rap_detail": idRapDetail,
    "id_jenis_kayu": idJenisKayu,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "id_part_kayu": idPartKayu,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_jenis_kayu": namaJenisKayu,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "nama_tipe_sisi": namaTipeSisi,
    "nama_part_kayu": namaPartKayu,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaPlywood {
  AnalisaPlywood({
    this.idRapAnalisaBarangJadiPlywood,
    this.idRapDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.idTipeSisi,
    this.idDeskripsi,
    this.deskripsi,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.unitPrice,
    this.konstanta,
    this.kodeItem,
    this.namaItem,
    this.namaFinishingBarangJadi,
    this.namaTipeSisi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRapAnalisaBarangJadiPlywood;
  final String? idRapDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? idTipeSisi;
  final String? idDeskripsi;
  final String? deskripsi;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? unitPrice;
  final String? konstanta;
  final String? kodeItem;
  final String? namaItem;
  final String? namaFinishingBarangJadi;
  final String? namaTipeSisi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaPlywood.fromRawJson(String str) => AnalisaPlywood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaPlywood.fromJson(Map<String, dynamic> json) => AnalisaPlywood(
    idRapAnalisaBarangJadiPlywood: json["id_rap_analisa_barang_jadi_plywood"],
    idRapDetail: json["id_rap_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rap_analisa_barang_jadi_plywood": idRapAnalisaBarangJadiPlywood,
    "id_rap_detail": idRapDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "nama_tipe_sisi": namaTipeSisi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinTp {
  AnalisaFinTp({
    this.idRapAnalisaBarangJadiFinishing,
    this.idRapDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRapAnalisaBarangJadiFinishing;
  final String? idRapDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinTp.fromRawJson(String str) => AnalisaFinTp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTp.fromJson(Map<String, dynamic> json) => AnalisaFinTp(
    idRapAnalisaBarangJadiFinishing: json["id_rap_analisa_barang_jadi_finishing"],
    idRapDetail: json["id_rap_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rap_analisa_barang_jadi_finishing": idRapAnalisaBarangJadiFinishing,
    "id_rap_detail": idRapDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinFn {
  AnalisaFinFn({
    this.idRapAnalisaBarangJadiFinishing,
    this.idRapDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRapAnalisaBarangJadiFinishing;
  final String? idRapDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinFn.fromRawJson(String str) => AnalisaFinFn.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinFn.fromJson(Map<String, dynamic> json) => AnalisaFinFn(
    idRapAnalisaBarangJadiFinishing: json["id_rap_analisa_barang_jadi_finishing"],
    idRapDetail: json["id_rap_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rap_analisa_barang_jadi_finishing": idRapAnalisaBarangJadiFinishing,
    "id_rap_detail": idRapDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class Gambar {
  Gambar({
    this.idItemBuasoGambarBarangJadi,
    this.idItemBuaso,
    this.pathGambar,
    this.tglUpload,
  });

  final String? idItemBuasoGambarBarangJadi;
  final String? idItemBuaso;
  final String? pathGambar;
  final DateTime? tglUpload;

  factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
    idItemBuasoGambarBarangJadi: json["id_item_buaso_gambar_barang_jadi"],
    idItemBuaso: json["id_item_buaso"],
    pathGambar: json["path_gambar"],
    tglUpload: json["tgl_upload"] == null ? null : DateTime.parse(json["tgl_upload"]),
  );

  Map<String, dynamic> toJson() => {
    "id_item_buaso_gambar_barang_jadi": idItemBuasoGambarBarangJadi,
    "id_item_buaso": idItemBuaso,
    "path_gambar": pathGambar,
    "tgl_upload": tglUpload!.toIso8601String(),
  };
}
