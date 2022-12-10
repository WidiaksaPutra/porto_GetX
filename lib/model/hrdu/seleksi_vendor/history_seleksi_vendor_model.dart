// To parse this JSON data, do
//
//     final historyPvspr = historyPvsprFromJson(jsonString);

import 'dart:convert';

class HistoryPvspr {
    HistoryPvspr({
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

    factory HistoryPvspr.fromRawJson(String str) => HistoryPvspr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryPvspr.fromJson(Map<String, dynamic> json) => HistoryPvspr(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        identity: Identity.fromJson(json["identity"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry?.toJson(),
        "identity": identity?.toJson(),
        "data": data == List.empty() ? [] : data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount?.toInt(),
        "total_page": totalPage == null ? 0 : totalPage?.toInt(),
    };
}

class Datum {
    Datum({
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
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawanApproval: json["id_karyawan_approval"] == null ? "-" : json["id_karyawan_approval"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatanApproval: json["catatan_approval"] == null ? "-" : json["catatan_approval"].toString(),
        approvalCreatedAt: json["approval_created_at"] == null ? null : DateTime.parse(json["approval_created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
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