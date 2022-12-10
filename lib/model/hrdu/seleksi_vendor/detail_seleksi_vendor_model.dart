// To parse this JSON data, do
//
//     final DetailPvspr = DetailPvsprFromJson(jsonString);

import 'dart:convert';

class DetailPvspr {
    DetailPvspr({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailPvspr.fromRawJson(String str) => DetailPvspr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailPvspr.fromJson(Map<String, dynamic> json) => DetailPvspr(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data == null ? "-" : data?.toJson(),
    };
}

class Data {
    Data({
        this.detail,
        this.behavior,
        required this.approval,
    });

    final Detail? detail;
    final String? behavior;
    final List<Approval> approval;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        detail: Detail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail?.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": List<dynamic>.from(approval.map((x) => x.toJson())),
    };
}

class Approval {
    Approval({
        this.idApprovalTransaksi,
        this.noTransaksi,
        this.kodeTransaksi,
        this.idKaryawan,
        this.idJabatan,
        this.statusApproval,
        this.catatan,
        this.createdAt,
        this.tglApproval,
        this.approvalLevel,
        this.namaKaryawan,
        this.namaJabatan,
        this.approvalBaseline,
    });

    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawan;
    final String? idJabatan;
    final String? statusApproval;
    final String? catatan;
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? approvalBaseline;

    factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        approvalBaseline: json["approval_baseline"] == null ? "-" : json["approval_baseline"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString(),
    };
}

class Detail {
    Detail({
        this.idSeleksiVendor,
        this.noSeleksiVendor,
        this.tglSeleksiVendor,
        this.idPurchaseRequest,
        this.noPurchaseRequest,
        this.tglPemakaian,
        this.keperluan,
        this.tglPurchaseRequest,
        this.idVendor,
        this.namaVendor,
        this.baseline,
        this.idPurchaseOrder,
        this.idSeleksiVendorDetail,
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.satuanBeli,
        this.qtyOrder,
        this.hargaKesepakatan,
        this.dimensi,
        this.lb,
        this.tb,
        this.pj,
        this.idApprovalTransaksi,
        this.noTransaksi,
        this.kodeTransaksi,
        this.idKaryawan,
        this.idJabatan,
        this.statusApproval,
        this.catatan,
        this.createdAt,
        this.tglApproval,
        this.approvalLevel,
        this.namaKaryawan,
        this.namaJabatan,
        this.idKaryawanPengaju,
        this.idJabatanPengaju,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
        this.qtyPr,
        this.hargaPerkiraanSendiri,
        this.qtyOrdered,
        this.idProyek,
        this.namaProyek,
        this.keterangan,
        this.createdAtPurchaseRequest,
        this.prDetail,
        this.detail,
    });

    final String? idSeleksiVendor;
    final String? noSeleksiVendor;
    final DateTime? tglSeleksiVendor;
    final String? idPurchaseRequest;
    final String? noPurchaseRequest;
    final DateTime? tglPemakaian;
    final String? keperluan;
    final DateTime? tglPurchaseRequest;
    final String? idVendor;
    final String? namaVendor;
    final String? baseline;
    final String? idPurchaseOrder;
    final String? idSeleksiVendorDetail;
    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? satuanBeli;
    final String? qtyOrder;
    final String? hargaKesepakatan;
    final String? dimensi;
    final String? lb;
    final String? tb;
    final String? pj;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawan;
    final String? idJabatan;
    final String? statusApproval;
    final String? catatan;
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? qtyPr;
    final String? hargaPerkiraanSendiri;
    final String? qtyOrdered;
    final String? idProyek;
    final String? namaProyek;
    final String? keterangan;
    final DateTime? createdAtPurchaseRequest;
    final List<Detail>? prDetail;
    final List<Detail>? detail;

    factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        idSeleksiVendor: json["id_seleksi_vendor"] == null ? "-" : json["id_seleksi_vendor"].toString(),
        noSeleksiVendor: json["no_seleksi_vendor"] == null ? "-" : json["no_seleksi_vendor"].toString(),
        tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
        idPurchaseRequest: json["id_purchase_request"] == null ? "-" : json["id_purchase_request"].toString(),
        noPurchaseRequest: json["no_purchase_request"] == null ? "-" : json["no_purchase_request"].toString(),
        tglPemakaian: json["tgl_pemakaian"] == null ? null : DateTime.parse(json["tgl_pemakaian"]),
        keperluan: json["keperluan"] == null ? "-" : json["keperluan"].toString(),
        tglPurchaseRequest: json["tgl_purchase_request"] == null ? null : DateTime.parse(json["tgl_purchase_request"]),
        idVendor: json["id_vendor"] == null ? "-" : json["id_vendor"].toString(),
        namaVendor: json["nama_vendor"] == null ? "-" : json["nama_vendor"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idPurchaseOrder: json["id_purchase_order"] == null ? "-" : json["id_purchase_order"].toString(),
        idSeleksiVendorDetail: json["id_seleksi_vendor_detail"] == null ? "-" : json["id_seleksi_vendor_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        satuanBeli: json["satuan_beli"] == null ? "-" : json["satuan_beli"].toString(),
        qtyOrder: json["qty_order"] == null ? "-" : json["qty_order"].toString(),
        hargaKesepakatan: json["harga_kesepakatan"] == null ? "-" : json["harga_kesepakatan"].toString(),
        dimensi: json["dimensi"] == null ? "-" : json["dimensi"].toString(),
        lb: json["lb"] == null ? "-" : json["lb"].toString(),
        tb: json["tb"] == null ? "-" : json["tb"].toString(),
        pj: json["pj"] == null ? "-" : json["pj"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        qtyPr: json["qty_pr"] == null ? "-" : json["qty_pr"].toString(),
        hargaPerkiraanSendiri: json["harga_perkiraan_sendiri"] == null ? "-" : json["harga_perkiraan_sendiri"].toString(),
        qtyOrdered: json["qty_ordered"] == null ? "-" : json["qty_ordered"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        keterangan: json["keterangan"] == null ? "-" : json["keterangan"].toString(),
        createdAtPurchaseRequest: json["created_at_purchase_request"] == null ? null : DateTime.parse(json["created_at_purchase_request"]),
        prDetail: json["pr_detail"] == List.empty() ? [] : json["pr_detail"] == null ? null : List<Detail>.from(json["pr_detail"].map((x) => Detail.fromJson(x))),
        detail: json["detail"] == List.empty() ? [] : json["detail"] == null ? null : List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_seleksi_vendor": idSeleksiVendor == null ? "-" : idSeleksiVendor.toString(),
        "no_seleksi_vendor": noSeleksiVendor == null ? "-" : noSeleksiVendor.toString(),
        "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
        "id_purchase_request": idPurchaseRequest == null ? "-" : idPurchaseRequest.toString(),
        "no_purchase_request": noPurchaseRequest == null ? "-" : noPurchaseRequest.toString(),
        "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian?.year.toString().padLeft(4, '0')}-${tglPemakaian?.month.toString().padLeft(2, '0')}-${tglPemakaian?.day.toString().padLeft(2, '0')}",
        "keperluan": keperluan == null ? "-" : keperluan.toString(),
        "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest?.year.toString().padLeft(4, '0')}-${tglPurchaseRequest?.month.toString().padLeft(2, '0')}-${tglPurchaseRequest?.day.toString().padLeft(2, '0')}",
        "id_vendor": idVendor == null ? "-" : idVendor.toString(),
        "nama_vendor": namaVendor == null ? "-" : namaVendor.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_purchase_order": idPurchaseOrder == null ? "-" : idPurchaseOrder.toString(),
        "id_seleksi_vendor_detail": idSeleksiVendorDetail == null ? "-" : idSeleksiVendorDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "satuan_beli": satuanBeli == null ? "-" : satuanBeli.toString(),
        "qty_order": qtyOrder == null ? "-" : qtyOrder.toString(),
        "harga_kesepakatan": hargaKesepakatan == null ? "-" : hargaKesepakatan.toString(),
        "dimensi": dimensi == null ? "-" : dimensi.toString(),
        "lb": lb == null ? "-" : lb.toString(),
        "tb": tb == null ? "-" : tb.toString(),
        "pj": pj == null ? "-" : pj.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "qty_pr": qtyPr == null ? "-" : qtyPr.toString(),
        "harga_perkiraan_sendiri": hargaPerkiraanSendiri == null ? "-" : hargaPerkiraanSendiri.toString(),
        "qty_ordered": qtyOrdered == null ? "-" : qtyOrdered.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "keterangan": keterangan == null ? "-" : keterangan.toString(),
        "created_at_purchase_request": createdAtPurchaseRequest == null ? null : createdAtPurchaseRequest!.toIso8601String(),
        "pr_detail": prDetail == List.empty() ? [] : prDetail == null ? null : List<dynamic>.from(prDetail!.map((x) => x.toJson())),
        "detail": detail == List.empty() ? [] : detail == null ? null : List<dynamic>.from(detail!.map((x) => x.toJson())),
    };
}