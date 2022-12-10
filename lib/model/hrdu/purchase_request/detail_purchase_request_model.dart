import 'dart:convert';

class DetailPr {
    DetailPr({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailPr.fromRawJson(String str) => DetailPr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailPr.fromJson(Map<String, dynamic> json) => DetailPr(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.detail,
        this.behavior,
        required this.approval,
    });

    final DataDetail? detail;
    final String? behavior;
    final List<Approval> approval;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        detail: DataDetail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? "-" : detail?.toJson(),
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
        "created_at": createdAt == null ? "-" : createdAt?.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString(),
    };
}

class DataDetail {
    DataDetail({
        this.idPurchaseRequest,
        this.tglPurchaseRequest,
        this.noPurchaseRequest,
        this.tglPemakaian,
        this.keperluan,
        this.catatanPurchaseRequest,
        this.baseline,
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
        this.statusPr,
        this.idProyek,
        this.namaProyek,
        this.listItemBarang,
        this.detail,
    });

    final String? idPurchaseRequest;
    final DateTime? tglPurchaseRequest;
    final String? noPurchaseRequest;
    final DateTime? tglPemakaian;
    final String? keperluan;
    final String? catatanPurchaseRequest;
    final String? baseline;
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
    final String? statusPr;
    final String? idProyek;
    final String? namaProyek;
    final String? listItemBarang;
    final List<DetailElement>? detail;

    factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
        idPurchaseRequest: json["id_purchase_request"] == null ? "-" : json["id_purchase_request"].toString(),
        tglPurchaseRequest: json["tgl_purchase_request"] == null ? null : DateTime.parse(json["tgl_purchase_request"]),
        noPurchaseRequest: json["no_purchase_request"] == null ? "-" : json["no_purchase_request"].toString(),
        tglPemakaian: json["tgl_pemakaian"] == null ? null : DateTime.parse(json["tgl_pemakaian"]),
        keperluan: json["keperluan"] == null ? "-" : json["keperluan"].toString(),
        catatanPurchaseRequest: json["catatan_purchase_request"] == null ? "-" : json["catatan_purchase_request"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
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
        statusPr: json["status_pr"] == null ? "-" : json["status_pr"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        listItemBarang: json["list_item_barang"] == null ? "-" : json["list_item_barang"].toString(),
        detail: json["detail"] == List.empty() ? [] : json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_purchase_request": idPurchaseRequest == null ? "-" : idPurchaseRequest.toString(),
        "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest?.year.toString().padLeft(4, '0')}-${tglPurchaseRequest?.month.toString().padLeft(2, '0')}-${tglPurchaseRequest?.day.toString().padLeft(2, '0')}",
        "no_purchase_request": noPurchaseRequest == null ? "-" : noPurchaseRequest.toString(),
        "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian?.year.toString().padLeft(4, '0')}-${tglPemakaian?.month.toString().padLeft(2, '0')}-${tglPemakaian?.day.toString().padLeft(2, '0')}",
        "keperluan": keperluan == null ? "-" : keperluan.toString(),
        "catatan_purchase_request": catatanPurchaseRequest == null ? "-" : catatanPurchaseRequest.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? "-" : createdAt?.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "status_pr": statusPr == null ? "-" : statusPr.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "list_item_barang": listItemBarang == null ? "-" : listItemBarang.toString(),
        "detail": detail == List.empty() ? [] : detail == null ? null : List<dynamic>.from(detail!.map((x) => x.toJson())),
    };
}

class DetailElement {
    DetailElement({
        this.idPurchaseRequestDetail,
        this.idPurchaseRequest,
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.qty,
        this.qtyOrdered,
        this.dimensi,
        this.lb,
        this.pj,
        this.tb,
        this.pathGambar,
    });

    final String? idPurchaseRequestDetail;
    final String? idPurchaseRequest;
    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? qty;
    final String? qtyOrdered;
    final String? dimensi;
    final String? lb;
    final String? pj;
    final String? tb;
    final List<String>? pathGambar;

    factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        idPurchaseRequestDetail: json["id_purchase_request_detail"] == null ? "-" : json["id_purchase_request_detail"].toString(),
        idPurchaseRequest: json["id_purchase_request"] == null ? "-" : json["id_purchase_request"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        qtyOrdered: json["qty_ordered"] == null ? "-" : json["qty_ordered"].toString(),
        dimensi: json["dimensi"] == null ? "-" : json["dimensi"].toString(),
        lb: json["lb"] == null ? "-" : json["lb"].toString(),
        pj: json["pj"] == null ? "-" : json["pj"].toString(),
        tb: json["tb"] == null ? "-" : json["tb"].toString(),
        pathGambar: json["path_gambar"] == List.empty() ? [] : json["path_gambar"] == null ? null : List<String>.from(json["path_gambar"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id_purchase_request_detail": idPurchaseRequestDetail == null ? "-" : idPurchaseRequestDetail.toString(),
        "id_purchase_request": idPurchaseRequest == null ? "-" : idPurchaseRequest.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "qty_ordered": qtyOrdered == null ? "-" : qtyOrdered.toString(),
        "dimensi": dimensi == null ? "-" : dimensi.toString(),
        "lb": lb == null ? "-" : lb.toString(),
        "pj": pj == null ? "-" : pj.toString(),
        "tb": tb == null ? "-" : tb.toString(),
        "path_gambar": pathGambar == List.empty() ? [] : pathGambar == null ? null : List<dynamic>.from(pathGambar!.map((x) => x)),
    };
}