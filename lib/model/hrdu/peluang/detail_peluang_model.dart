import 'dart:convert';

class DetailRegplg {
  DetailRegplg({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegplg.fromRawJson(String str) => DetailRegplg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegplg.fromJson(Map<String, dynamic> json) => DetailRegplg(
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
    detail: DataDetail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail!.toJson(),
    "behavior": behavior,
    "approval": List<dynamic>.from(approval!.map((x) => x!.toJson())),
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
    "tgl_approval": "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}

class DataDetail {
  DataDetail({
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.idCustomer,
    this.namaCustomer,
    this.idPeringkatPeluang,
    this.namaPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.tglSelesai,
    this.att,
    this.instalasi,
    this.lainLain,
    this.isHidden,
    this.idProyek,
    this.kodeProyek,
    this.namaProyek,
    this.realisasiPenawaran,
    this.scheduleKebutuhanProyek,
    this.detail,
  });

  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? idCustomer;
  final String? namaCustomer;
  final String? idPeringkatPeluang;
  final String? namaPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final DateTime? tglSelesai;
  final String? att;
  final bool? instalasi;
  final String? lainLain;
  final bool? isHidden;
  final String? idProyek;
  final String? kodeProyek;
  final String? namaProyek;
  final DateTime? realisasiPenawaran;
  final String? scheduleKebutuhanProyek;
  final List<DetailElement?>? detail;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    idCustomer: json["id_customer"],
    namaCustomer: json["nama_customer"],
    idPeringkatPeluang: json["id_peringkat_peluang"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    att: json["att"],
    instalasi: json["instalasi"],
    lainLain: json["lain_lain"],
    isHidden: json["is_hidden"],
    idProyek: json["id_proyek"],
    kodeProyek: json["kode_proyek"],
    namaProyek: json["nama_proyek"],
    realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
    scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"],
    detail: List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "nama_customer": namaCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "id_proyek": idProyek,
    "kode_proyek": kodeProyek,
    "nama_proyek": namaProyek,
    "realisasi_penawaran": "${realisasiPenawaran!.year.toString().padLeft(4, '0')}-${realisasiPenawaran!.month.toString().padLeft(2, '0')}-${realisasiPenawaran!.day.toString().padLeft(2, '0')}",
    "schedule_kebutuhan_proyek": scheduleKebutuhanProyek,
    "detail": List<dynamic>.from(detail!.map((x) => x!.toJson())),
  };
}

class DetailElement {
  DetailElement({
    this.idPeluangDetail,
    this.idPeluang,
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.qty,
    this.idJenis,
    this.namaJenis,
    this.idSatuanJual,
    this.namaSatuanJual,
  });

  final String? idPeluangDetail;
  final String? idPeluang;
  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? qty;
  final String? idJenis;
  final String? namaJenis;
  final String? idSatuanJual;
  final String? namaSatuanJual;

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idPeluangDetail: json["id_peluang_detail"],
    idPeluang: json["id_peluang"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    qty: json["qty"],
    idJenis: json["id_jenis"],
    namaJenis: json["nama_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaSatuanJual: json["nama_satuan_jual"],
  );

  Map<String, dynamic> toJson() => {
    "id_peluang_detail": idPeluangDetail,
    "id_peluang": idPeluang,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "qty": qty,
    "id_jenis": idJenis,
    "nama_jenis": namaJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan_jual": namaSatuanJual,
  };
}
