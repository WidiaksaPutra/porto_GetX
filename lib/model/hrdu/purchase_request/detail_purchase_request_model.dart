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
    this.detail,
    this.behavior,
    this.approval,
  });

  final DataDetail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x?.toJson())),
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
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawan;
  final String? namaJabatan;
  final String? approvalBaseline;

  factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawan: json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    approvalBaseline: json["approval_baseline"],
  );

  Map<String, dynamic> toJson() => {
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
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
  final String? createdAt;
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
  final List<DetailElement?>? detail;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idPurchaseRequest: json["id_purchase_request"],
    tglPurchaseRequest: json["tgl_purchase_request"] == null ? null : DateTime.parse(json["tgl_purchase_request"]),
    noPurchaseRequest: json["no_purchase_request"],
    tglPemakaian: json["tgl_pemakaian"] == null ? null : DateTime.parse(json["tgl_pemakaian"]),
    keperluan: json["keperluan"],
    catatanPurchaseRequest: json["catatan_purchase_request"],
    baseline: json["baseline"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawan: json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    statusPr: json["status_pr"],
    idProyek: json["id_proyek"],
    namaProyek: json["nama_proyek"],
    detail: json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_request": idPurchaseRequest,
    "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest!.year.toString().padLeft(4, '0')}-${tglPurchaseRequest!.month.toString().padLeft(2, '0')}-${tglPurchaseRequest!.day.toString().padLeft(2, '0')}",
    "no_purchase_request": noPurchaseRequest,
    "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian!.year.toString().padLeft(4, '0')}-${tglPemakaian!.month.toString().padLeft(2, '0')}-${tglPemakaian!.day.toString().padLeft(2, '0')}",
    "keperluan": keperluan,
    "catatan_purchase_request": catatanPurchaseRequest,
    "baseline": baseline,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "status_pr": statusPr,
    "id_proyek": idProyek,
    "nama_proyek": namaProyek,
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x!.toJson())),
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

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idPurchaseRequestDetail: json["id_purchase_request_detail"],
    idPurchaseRequest: json["id_purchase_request"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaSatuan: json["nama_satuan"],
    qty: json["qty"],
    qtyOrdered: json["qty_ordered"],
    dimensi: json["dimensi"],
    lb: json["lb"],
    pj: json["pj"],
    tb: json["tb"],
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_request_detail": idPurchaseRequestDetail,
    "id_purchase_request": idPurchaseRequest,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_satuan": namaSatuan,
    "qty": qty,
    "qty_ordered": qtyOrdered,
    "dimensi": dimensi,
    "lb": lb,
    "pj": pj,
    "tb": tb,
  };
}