import 'dart:convert';

class DetailRegpo {
  DetailRegpo({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegpo.fromRawJson(String str) => DetailRegpo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegpo.fromJson(Map<String, dynamic> json) => DetailRegpo(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
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
    "detail": detail!.toJson(),
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

class Detail {
  Detail({
    this.idPurchaseOrder,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.idVendor,
    this.namaVendor,
    this.diskon,
    this.ppn,
    this.tglPengiriman,
    this.alamatTujuanPengiriman,
    this.keterangan,
    this.statusPurchaseOrder,
    this.baseline,
    this.tglSeleksiVendor,
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
    this.contactPerson,
    this.alamatVendor,
    this.kodeVendor,
    this.pembayaran,
    this.svDetail,
    this.poDetail,
  });

  final String? idPurchaseOrder;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? idVendor;
  final String? namaVendor;
  final String? diskon;
  final String? ppn;
  final DateTime? tglPengiriman;
  final String? alamatTujuanPengiriman;
  final String? keterangan;
  final String? statusPurchaseOrder;
  final String? baseline;
  final DateTime? tglSeleksiVendor;
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
  final String? contactPerson;
  final String? alamatVendor;
  final String? kodeVendor;
  final String? pembayaran;
  final List<SvDetail?>? svDetail;
  final List<PoDetail?>? poDetail;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idPurchaseOrder: json["id_purchase_order"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    idVendor: json["id_vendor"],
    namaVendor: json["nama_vendor"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    tglPengiriman: json["tgl_pengiriman"] == null ? null : DateTime.parse(json["tgl_pengiriman"]),
    alamatTujuanPengiriman: json["alamat_tujuan_pengiriman"],
    keterangan: json["keterangan"],
    statusPurchaseOrder: json["status_purchase_order"],
    baseline: json["baseline"],
    tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
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
    contactPerson: json["contact_person"],
    alamatVendor: json["alamat_vendor"],
    kodeVendor: json["kode_vendor"],
    pembayaran: json["pembayaran"],
    svDetail: json["sv_detail"] == null ? null : List<SvDetail>.from(json["sv_detail"].map((x) => SvDetail.fromJson(x))),
    poDetail: json["po_detail"] == null ? null : List<PoDetail>.from(json["po_detail"].map((x) => PoDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_order": idPurchaseOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "id_vendor": idVendor,
    "nama_vendor": namaVendor,
    "diskon": diskon,
    "ppn": ppn,
    "tgl_pengiriman": tglPengiriman == null ? null : "${tglPengiriman?.year.toString().padLeft(4, '0')}-${tglPengiriman?.month.toString().padLeft(2, '0')}-${tglPengiriman?.day.toString().padLeft(2, '0')}",
    "alamat_tujuan_pengiriman": alamatTujuanPengiriman,
    "keterangan": keterangan,
    "status_purchase_order": statusPurchaseOrder,
    "baseline": baseline,
    "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
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
    "contact_person": contactPerson,
    "alamat_vendor": alamatVendor,
    "kode_vendor": kodeVendor,
    "pembayaran": pembayaran,
    "sv_detail": svDetail == null ? null : List<dynamic>.from(svDetail!.map((x) => x?.toJson())),
    "po_detail": poDetail == null ? null : List<dynamic>.from(poDetail!.map((x) => x?.toJson())),
  };
}

class PoDetail {
  PoDetail({
    this.idPurchaseOrder,
    this.idPurchaseOrderDetail,
    this.idItemBuaso,
    this.qtyOrder,
    this.hargaKesepakatan,
    this.kodeItem,
    this.namaItem,
    this.idSeleksiVendorDetail,
    this.statusPenerimaan,
    this.idSatuan,
    this.namaSatuan,
    this.dimensi,
    this.lb,
    this.pj,
    this.tb,
  });

  final String? idPurchaseOrder;
  final String? idPurchaseOrderDetail;
  final String? idItemBuaso;
  final String? qtyOrder;
  final String? hargaKesepakatan;
  final String? kodeItem;
  final String? namaItem;
  final List<String?>? idSeleksiVendorDetail;
  final String? statusPenerimaan;
  final String? idSatuan;
  final String? namaSatuan;
  final String? dimensi;
  final String? lb;
  final String? pj;
  final String? tb;

  factory PoDetail.fromRawJson(String str) => PoDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PoDetail.fromJson(Map<String, dynamic> json) => PoDetail(
    idPurchaseOrder: json["id_purchase_order"],
    idPurchaseOrderDetail: json["id_purchase_order_detail"],
    idItemBuaso: json["id_item_buaso"],
    qtyOrder: json["qty_order"],
    hargaKesepakatan: json["harga_kesepakatan"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idSeleksiVendorDetail: json["id_seleksi_vendor_detail"] == null ? null : List<String>.from(json["id_seleksi_vendor_detail"].map((x) => x)),
    statusPenerimaan: json["status_penerimaan"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    dimensi: json["dimensi"],
    lb: json["lb"],
    pj: json["pj"],
    tb: json["tb"],
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_order": idPurchaseOrder,
    "id_purchase_order_detail": idPurchaseOrderDetail,
    "id_item_buaso": idItemBuaso,
    "qty_order": qtyOrder,
    "harga_kesepakatan": hargaKesepakatan,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_seleksi_vendor_detail": idSeleksiVendorDetail == null ? null : List<dynamic>.from(idSeleksiVendorDetail!.map((x) => x)),
    "status_penerimaan": statusPenerimaan,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "dimensi": dimensi,
    "lb": lb,
    "pj": pj,
    "tb": tb,
  };
}

class SvDetail {
  SvDetail({
    this.idSeleksiVendorDetail,
    this.idSeleksiVendor,
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.satuanBeli,
    this.qtyOrder,
    this.hargaKesepakatan,
    this.idPurchaseOrder,
    this.dimensi,
    this.pj,
    this.lb,
    this.tb,
  });

  final String? idSeleksiVendorDetail;
  final String? idSeleksiVendor;
  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? satuanBeli;
  final String? qtyOrder;
  final String? hargaKesepakatan;
  final String? idPurchaseOrder;
  final String? dimensi;
  final String? pj;
  final String? lb;
  final String? tb;

  factory SvDetail.fromRawJson(String str) => SvDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SvDetail.fromJson(Map<String, dynamic> json) => SvDetail(
    idSeleksiVendorDetail: json["id_seleksi_vendor_detail"],
    idSeleksiVendor: json["id_seleksi_vendor"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    satuanBeli: json["satuan_beli"],
    qtyOrder: json["qty_order"],
    hargaKesepakatan: json["harga_kesepakatan"],
    idPurchaseOrder: json["id_purchase_order"],
    dimensi: json["dimensi"],
    pj: json["pj"],
    lb: json["lb"],
    tb: json["tb"],
  );

  Map<String, dynamic> toJson() => {
    "id_seleksi_vendor_detail": idSeleksiVendorDetail,
    "id_seleksi_vendor": idSeleksiVendor,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "satuan_beli": satuanBeli,
    "qty_order": qtyOrder,
    "harga_kesepakatan": hargaKesepakatan,
    "id_purchase_order": idPurchaseOrder,
    "dimensi": dimensi,
    "pj": pj,
    "lb": lb,
    "tb": tb,
  };
}
