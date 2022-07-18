import 'dart:convert';

class Pvspr {
  Pvspr({
    this.status,
    this.message,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory Pvspr.fromRawJson(String str) => Pvspr.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pvspr.fromJson(Map<String, dynamic> json) => Pvspr(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  );

  Map<String, dynamic> toJson() => {
    "id_seleksi_vendor": idSeleksiVendor,
    "no_seleksi_vendor": noSeleksiVendor,
    "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
    "id_purchase_request": idPurchaseRequest,
    "no_purchase_request": noPurchaseRequest,
    "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian?.year.toString().padLeft(4, '0')}-${tglPemakaian?.month.toString().padLeft(2, '0')}-${tglPemakaian?.day.toString().padLeft(2, '0')}",
    "keperluan": keperluan,
    "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest?.year.toString().padLeft(4, '0')}-${tglPurchaseRequest?.month.toString().padLeft(2, '0')}-${tglPurchaseRequest?.day.toString().padLeft(2, '0')}",
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
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
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
  };
}
