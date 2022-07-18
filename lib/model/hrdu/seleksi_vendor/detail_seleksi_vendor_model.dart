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

  final Detail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x!.toJson())),
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
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
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
  final String? createdAt;
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
  final List<Detail?>? prDetail;
  final List<Detail?>? detail;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idSeleksiVendor: json["id_seleksi_vendor"],
    noSeleksiVendor: json["no_seleksi_vendor"],
    tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
    idPurchaseRequest: json["id_purchase_request"],
    noPurchaseRequest: json["no_purchase_request"],
    tglPemakaian: json["tgl_pemakaian"] == null ? null : DateTime.parse(json["tgl_pemakaian"]),
    keperluan: json["keperluan"],
    tglPurchaseRequest: json["tgl_purchase_request"] == null ? null : DateTime.parse(json["tgl_purchase_request"]),
    idVendor: json["id_vendor"],
    namaVendor: json["nama_vendor"],
    baseline: json["baseline"],
    idPurchaseOrder: json["id_purchase_order"],
    idSeleksiVendorDetail: json["id_seleksi_vendor_detail"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    satuanBeli: json["satuan_beli"],
    qtyOrder: json["qty_order"],
    hargaKesepakatan: json["harga_kesepakatan"],
    dimensi: json["dimensi"],
    lb: json["lb"],
    tb: json["tb"],
    pj: json["pj"],
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
    qtyPr: json["qty_pr"],
    hargaPerkiraanSendiri: json["harga_perkiraan_sendiri"],
    qtyOrdered: json["qty_ordered"],
    idProyek: json["id_proyek"],
    namaProyek: json["nama_proyek"],
    prDetail: json["pr_detail"] == null ? null : List<Detail>.from(json["pr_detail"].map((x) => Detail.fromJson(x))),
    detail: json["detail"] == null ? null : List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_seleksi_vendor": idSeleksiVendor,
    "no_seleksi_vendor": noSeleksiVendor,
    "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor!.year.toString().padLeft(4, '0')}-${tglSeleksiVendor!.month.toString().padLeft(2, '0')}-${tglSeleksiVendor!.day.toString().padLeft(2, '0')}",
    "id_purchase_request": idPurchaseRequest,
    "no_purchase_request": noPurchaseRequest,
    "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian!.year.toString().padLeft(4, '0')}-${tglPemakaian!.month.toString().padLeft(2, '0')}-${tglPemakaian!.day.toString().padLeft(2, '0')}",
    "keperluan": keperluan,
    "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest!.year.toString().padLeft(4, '0')}-${tglPurchaseRequest!.month.toString().padLeft(2, '0')}-${tglPurchaseRequest!.day.toString().padLeft(2, '0')}",
    "id_vendor": idVendor,
    "nama_vendor": namaVendor,
    "baseline": baseline,
    "id_purchase_order": idPurchaseOrder,
    "id_seleksi_vendor_detail": idSeleksiVendorDetail,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "satuan_beli": satuanBeli,
    "qty_order": qtyOrder,
    "harga_kesepakatan": hargaKesepakatan,
    "dimensi": dimensi,
    "lb": lb,
    "tb": tb,
    "pj": pj,
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
    "qty_pr": qtyPr,
    "harga_perkiraan_sendiri": hargaPerkiraanSendiri,
    "qty_ordered": qtyOrdered,
    "id_proyek": idProyek,
    "nama_proyek": namaProyek,
    "pr_detail": prDetail == null ? null : List<dynamic>.from(prDetail!.map((x) => x!.toJson())),
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x!.toJson())),
  };
}
