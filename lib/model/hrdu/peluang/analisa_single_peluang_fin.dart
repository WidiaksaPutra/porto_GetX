// To parse this JSON data, do
//
//     final analisaSingleRegplgFinishing = analisaSingleRegplgFinishingFromJson(jsonString);

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
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.analisaFinFnBp,
        this.analisaFinFnSc,
        this.analisaFinFnLc,
    });

    final List<AnalisaFinFn>? analisaFinFnBp;
    final List<AnalisaFinFn>? analisaFinFnSc;
    final List<AnalisaFinFn>? analisaFinFnLc;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        analisaFinFnBp: json["analisa_fin_fn_bp"] == null ? null : List<AnalisaFinFn>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinFn.fromJson(x))),
        analisaFinFnSc: json["analisa_fin_fn_sc"] == null ? null : List<AnalisaFinFn>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinFn.fromJson(x))),
        analisaFinFnLc: json["analisa_fin_fn_lc"] == null ? null : List<AnalisaFinFn>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinFn.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "analisa_fin_fn_bp": analisaFinFnBp == null ? null : List<dynamic>.from(analisaFinFnBp!.map((x) => x.toJson())),
        "analisa_fin_fn_sc": analisaFinFnSc == null ? null : List<dynamic>.from(analisaFinFnSc!.map((x) => x.toJson())),
        "analisa_fin_fn_lc": analisaFinFnLc == null ? null : List<dynamic>.from(analisaFinFnLc!.map((x) => x.toJson())),
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
        idAnalisaBarangJadiTipeFs: json["id_analisa_barang_jadi_tipe_fs"] == null ? "-" : json["id_analisa_barang_jadi_tipe_fs"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        idItemBahan: json["id_item_bahan"] == null ? "-" : json["id_item_bahan"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_analisa_barang_jadi_tipe_fs": idAnalisaBarangJadiTipeFs == null ? "-" : idAnalisaBarangJadiTipeFs.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "id_item_bahan": idItemBahan == null ? "-" : idItemBahan.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
    };
}