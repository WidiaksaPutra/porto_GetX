// To parse this JSON data, do
//
//     final historyPenpo = historyPenpoFromJson(jsonString);

import 'dart:convert';

class HistoryPenpo {
    HistoryPenpo({
        this.status,
        this.message,
        this.xqry,
        this.identity,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final Identity? identity;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory HistoryPenpo.fromRawJson(String str) => HistoryPenpo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryPenpo.fromJson(Map<String, dynamic> json) => HistoryPenpo(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
        identity: json["identity"] == null ? null : Identity.fromJson(json["identity"]),
        data: json["data"] == List.empty() ? [] : json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry == null ? null : xqry!.toJson(),
        "identity": identity == null ? null : identity!.toJson(),
        "data": data == List.empty() ? [] : data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount?.toInt(),
        "total_page": totalPage == null ? 0 : totalPage?.toInt(),
    };
}

class Datum {
    Datum({
        this.idPenerimaanBarang,
        this.tglPenerimaanBarang,
        this.noPenerimaanBarang,
        this.idPurchaseOrderDetail,
        this.tglPurchaseOrder,
        this.noPurchaseOrder,
        this.noSuratJalan,
        this.petugasPenerimaan,
        this.namaKaryawan,
        this.gudangPenerimaan,
        this.namaGudang,
        this.idItemBuaso,
        this.namaItem,
        this.dimensi,
        this.pj,
        this.lb,
        this.tb,
        this.idVendor,
        this.namaVendor,
        this.hargaKesepakatan,
        this.qtyOrder,
        this.idSatuanOrder,
        this.namaSatuanOrder,
        this.qtyBeli,
        this.idSatuanBeli,
        this.namaSatuanBeli,
        this.qtyPakai,
        this.idSatuanPakai,
        this.namaSatuanPakai,
        this.fotoSuratJalan,
        this.baseline,
        this.idApprovalTransaksi,
        this.noTransaksi,
        this.kodeTransaksi,
        this.idKaryawanApproval,
        this.idJabatanApproval,
        this.statusApproval,
        this.catatanApproval,
        this.approvalCreatedAt,
        this.tglApproval,
        this.approvalLevel,
        this.namaKaryawanApproval,
        this.namaJabatanApproval,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
    });

    final String? idPenerimaanBarang;
    final DateTime? tglPenerimaanBarang;
    final String? noPenerimaanBarang;
    final String? idPurchaseOrderDetail;
    final DateTime? tglPurchaseOrder;
    final String? noPurchaseOrder;
    final String? noSuratJalan;
    final String? petugasPenerimaan;
    final String? namaKaryawan;
    final String? gudangPenerimaan;
    final String? namaGudang;
    final String? idItemBuaso;
    final String? namaItem;
    final String? dimensi;
    final String? pj;
    final String? lb;
    final String? tb;
    final String? idVendor;
    final String? namaVendor;
    final String? hargaKesepakatan;
    final String? qtyOrder;
    final String? idSatuanOrder;
    final String? namaSatuanOrder;
    final String? qtyBeli;
    final String? idSatuanBeli;
    final String? namaSatuanBeli;
    final String? qtyPakai;
    final String? idSatuanPakai;
    final String? namaSatuanPakai;
    final String? fotoSuratJalan;
    final String? baseline;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawanApproval;
    final String? idJabatanApproval;
    final String? statusApproval;
    final String? catatanApproval;
    final DateTime? approvalCreatedAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPenerimaanBarang: json["id_penerimaan_barang"] == null ? "-" : json["id_penerimaan_barang"].toString() ,
        tglPenerimaanBarang: json["tgl_penerimaan_barang"] == null ? null : DateTime.parse(json["tgl_penerimaan_barang"]),
        noPenerimaanBarang: json["no_penerimaan_barang"] == null ? "-" : json["no_penerimaan_barang"].toString() ,
        idPurchaseOrderDetail: json["id_purchase_order_detail"] == null ? "-" : json["id_purchase_order_detail"].toString() ,
        tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
        noPurchaseOrder: json["no_purchase_order"] == null ? "-" : json["no_purchase_order"].toString() ,
        noSuratJalan: json["no_surat_jalan"] == null ? "-" : json["no_surat_jalan"].toString() ,
        petugasPenerimaan: json["petugas_penerimaan"] == null ? "-" : json["petugas_penerimaan"].toString() ,
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString() ,
        gudangPenerimaan: json["gudang_penerimaan"] == null ? "-" : json["gudang_penerimaan"].toString() ,
        namaGudang: json["nama_gudang"] == null ? "-" : json["nama_gudang"].toString() ,
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString() ,
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString() ,
        dimensi: json["dimensi"] == null ? "-" : json["dimensi"].toString() ,
        pj: json["pj"] == null ? "-" : json["pj"].toString() ,
        lb: json["lb"] == null ? "-" : json["lb"].toString() ,
        tb: json["tb"] == null ? "-" : json["tb"].toString() ,
        idVendor: json["id_vendor"] == null ? "-" : json["id_vendor"].toString() ,
        namaVendor: json["nama_vendor"] == null ? "-" : json["nama_vendor"].toString() ,
        hargaKesepakatan: json["harga_kesepakatan"] == null ? "-" : json["harga_kesepakatan"].toString() ,
        qtyOrder: json["qty_order"] == null ? "-" : json["qty_order"].toString() ,
        idSatuanOrder: json["id_satuan_order"] == null ? "-" : json["id_satuan_order"].toString() ,
        namaSatuanOrder: json["nama_satuan_order"] == null ? "-" : json["nama_satuan_order"].toString() ,
        qtyBeli: json["qty_beli"] == null ? "-" : json["qty_beli"].toString() ,
        idSatuanBeli: json["id_satuan_beli"] == null ? "-" : json["id_satuan_beli"].toString() ,
        namaSatuanBeli: json["nama_satuan_beli"] == null ? "-" : json["nama_satuan_beli"].toString() ,
        qtyPakai: json["qty_pakai"] == null ? "-" : json["qty_pakai"].toString() ,
        idSatuanPakai: json["id_satuan_pakai"] == null ? "-" : json["id_satuan_pakai"].toString() ,
        namaSatuanPakai: json["nama_satuan_pakai"] == null ? "-" : json["nama_satuan_pakai"].toString() ,
        fotoSuratJalan: json["foto_surat_jalan"] == null ? "-" : json["foto_surat_jalan"].toString() ,
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString() ,
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString() ,
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString() ,
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString() ,
        idKaryawanApproval: json["id_karyawan_approval"] == null ? "-" : json["id_karyawan_approval"].toString() ,
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString() ,
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString() ,
        catatanApproval: json["catatan_approval"] == null ? "-" : json["catatan_approval"].toString() ,
        approvalCreatedAt: json["approval_created_at"] == null ? null : DateTime.parse(json["approval_created_at"]) ,
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString() ,
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString() ,
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString() ,
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString() ,
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString() ,
    );

    Map<String, dynamic> toJson() => {
        "id_penerimaan_barang": idPenerimaanBarang == null ? "-" : idPenerimaanBarang.toString(),
        "tgl_penerimaan_barang": tglPenerimaanBarang == null ? null : "${tglPenerimaanBarang?.year.toString().padLeft(4, '0')}-${tglPenerimaanBarang?.month.toString().padLeft(2, '0')}-${tglPenerimaanBarang?.day.toString().padLeft(2, '0')}",
        "no_penerimaan_barang": noPenerimaanBarang == null ? "-" : noPenerimaanBarang.toString(),
        "id_purchase_order_detail": idPurchaseOrderDetail == null ? "-" : idPurchaseOrderDetail.toString(),
        "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
        "no_purchase_order": noPurchaseOrder == null ? "-" : noPurchaseOrder.toString(),
        "no_surat_jalan": noSuratJalan == null ? "-" : noSuratJalan.toString(),
        "petugas_penerimaan": petugasPenerimaan == null ? "-" : petugasPenerimaan.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "gudang_penerimaan": gudangPenerimaan == null ? "-" : gudangPenerimaan.toString(),
        "nama_gudang": namaGudang == null ? "-" : namaGudang.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "dimensi": dimensi == null ? "-" : dimensi.toString(),
        "pj": pj == null ? "-" : pj.toString(),
        "lb": lb == null ? "-" : lb.toString(),
        "tb": tb == null ? "-" : tb.toString(),
        "id_vendor": idVendor == null ? "-" : idVendor.toString(),
        "nama_vendor": namaVendor == null ? "-" : namaVendor.toString(),
        "harga_kesepakatan": hargaKesepakatan == null ? "-" : hargaKesepakatan.toString(),
        "qty_order": qtyOrder == null ? "-" : qtyOrder.toString(),
        "id_satuan_order": idSatuanOrder == null ? "-" : idSatuanOrder.toString(),
        "nama_satuan_order": namaSatuanOrder == null ? "-" : namaSatuanOrder.toString(),
        "qty_beli": qtyBeli == null ? "-" : qtyBeli.toString(),
        "id_satuan_beli": idSatuanBeli == null ? "-" : idSatuanBeli.toString(),
        "nama_satuan_beli": namaSatuanBeli == null ? "-" : namaSatuanBeli.toString(),
        "qty_pakai": qtyPakai == null ? "-" : qtyPakai.toString(),
        "id_satuan_pakai": idSatuanPakai == null ? "-" : idSatuanPakai.toString(),
        "nama_satuan_pakai": namaSatuanPakai == null ? "-" : namaSatuanPakai.toString(),
        "foto_surat_jalan": fotoSuratJalan == null ? "-" : fotoSuratJalan.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan_approval": idKaryawanApproval == null ? "-" : idKaryawanApproval.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan_approval": catatanApproval == null ? "-" : catatanApproval.toString(),
        "approval_created_at": approvalCreatedAt == null ? null : approvalCreatedAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
    };
}

class Identity {
    Identity({
        this.idJabatan,
        this.idUnitOrganisasi,
        this.idKaryawan,
        this.kodeProses,
        this.behavior,
        this.approvalLevel,
    });

    final String? idJabatan;
    final String? idUnitOrganisasi;
    final String? idKaryawan;
    final String? kodeProses;
    final String? behavior;
    final String? approvalLevel;

    factory Identity.fromRawJson(String str) => Identity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        idUnitOrganisasi: json["id_unit_organisasi"] == null ? "-" : json["id_unit_organisasi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        kodeProses: json["kode_proses"] == null ? "-" : json["kode_proses"].toString(),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "id_unit_organisasi": idUnitOrganisasi == null ? "-" : idUnitOrganisasi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "kode_proses": kodeProses == null ? "-" : kodeProses.toString(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.idJabatanApproval,
    });

    final String? page;
    final String? perPage;
    final String? idJabatanApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
    };
}