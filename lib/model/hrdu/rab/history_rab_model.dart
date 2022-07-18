import 'dart:convert';

class HistoryRegrab {
  HistoryRegrab({
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

  factory HistoryRegrab.fromRawJson(String str) => HistoryRegrab.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegrab.fromJson(Map<String, dynamic> json) => HistoryRegrab(
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
    this.idRab,
    this.tglRab,
    this.noRab,
    this.profit,
    this.prelim,
    this.idRae,
    this.noRae,
    this.tglRae,
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.idCustomer,
    this.idPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.tglSelesai,
    this.att,
    this.instalasi,
    this.lainLain,
    this.isHidden,
    this.namaCustomer,
    this.baseline,
    this.namaPeringkatPeluang,
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

  final String? idRab;
  final DateTime? tglRab;
  final String? noRab;
  final String? profit;
  final String? prelim;
  final String? idRae;
  final String? noRae;
  final DateTime? tglRae;
  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? idCustomer;
  final String? idPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final DateTime? tglSelesai;
  final String? att;
  final bool? instalasi;
  final String? lainLain;
  final bool? isHidden;
  final String? namaCustomer;
  final String? baseline;
  final String? namaPeringkatPeluang;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatanApproval;
  final String? approvalCreatedAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idRab: json["id_rab"],
    tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
    noRab: json["no_rab"],
    profit: json["profit"],
    prelim: json["prelim"],
    idRae: json["id_rae"],
    noRae: json["no_rae"],
    tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    idCustomer: json["id_customer"],
    idPeringkatPeluang: json["id_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    att: json["att"],
    instalasi: json["instalasi"],
    lainLain: json["lain_lain"],
    isHidden: json["is_hidden"],
    namaCustomer: json["nama_customer"],
    baseline: json["baseline"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatanApproval: json["catatan_approval"],
    approvalCreatedAt: json["approval_created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_rab": idRab,
    "tgl_rab": "${tglRab!.year.toString().padLeft(4, '0')}-${tglRab!.month.toString().padLeft(2, '0')}-${tglRab!.day.toString().padLeft(2, '0')}",
    "no_rab": noRab,
    "profit": profit,
    "prelim": prelim,
    "id_rae": idRae,
    "no_rae": noRae,
    "tgl_rae": "${tglRae!.year.toString().padLeft(4, '0')}-${tglRae!.month.toString().padLeft(2, '0')}-${tglRae!.day.toString().padLeft(2, '0')}",
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "nama_customer": namaCustomer,
    "baseline": baseline,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}
