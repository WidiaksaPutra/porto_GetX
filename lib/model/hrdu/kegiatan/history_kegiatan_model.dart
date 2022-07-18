import 'dart:convert';

class HistoryRk {
  HistoryRk({
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

  factory HistoryRk.fromRawJson(String str) => HistoryRk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRk.fromJson(Map<String, dynamic> json) => HistoryRk(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data":List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idKegiatan,
    this.noKegiatan,
    this.namaKegiatan,
    this.deskripsiKegiatan,
    this.tglInput,
    this.idKaryawan,
    this.tglMulai,
    this.tglSelesai,
    this.idProgram,
    this.isClose,
    this.baseline,
    this.createdAt,
    this.bulanTahun,
    this.noProgram,
    this.namaProgram,
    this.idJabatan,
    this.namaJabatan,
    this.idSubKelompokAnggaran,
    this.namaSubKelompokAnggaran,
    this.idUnitOrganisasi,
    this.namaUnitOrganisasi,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatan,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.namaKaryawan,
  });

  final String? idKegiatan;
  final String? noKegiatan;
  final String? namaKegiatan;
  final String? deskripsiKegiatan;
  final DateTime? tglInput;
  final String? idKaryawan;
  final DateTime? tglMulai;
  final DateTime? tglSelesai;
  final String? idProgram;
  final bool? isClose;
  final String? baseline;
  final String? createdAt;
  final DateTime? bulanTahun;
  final String? noProgram;
  final String? namaProgram;
  final String? idJabatan;
  final String? namaJabatan;
  final String? idSubKelompokAnggaran;
  final String? namaSubKelompokAnggaran;
  final String? idUnitOrganisasi;
  final String? namaUnitOrganisasi;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatan;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? namaKaryawan;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idKegiatan: json["id_kegiatan"],
    noKegiatan: json["no_kegiatan"],
    namaKegiatan: json["nama_kegiatan"],
    deskripsiKegiatan: json["deskripsi_kegiatan"],
    tglInput: json["tgl_input"] == null ? null : DateTime.parse(json["tgl_input"]),
    idKaryawan: json["id_karyawan"],
    tglMulai: json["tgl_mulai"] == null ? null : DateTime.parse(json["tgl_mulai"]),
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    idProgram: json["id_program"],
    isClose: json["is_close"],
    baseline: json["baseline"],
    createdAt: json["created_at"],
    bulanTahun: json["bulan_tahun"] == null ? null : DateTime.parse(json["bulan_tahun"]),
    noProgram: json["no_program"],
    namaProgram: json["nama_program"],
    idJabatan: json["id_jabatan"],
    namaJabatan: json["nama_jabatan"],
    idSubKelompokAnggaran: json["id_sub_kelompok_anggaran"],
    namaSubKelompokAnggaran: json["nama_sub_kelompok_anggaran"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    namaKaryawan: json["nama_karyawan"],
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan": idKegiatan,
    "no_kegiatan": noKegiatan,
    "nama_kegiatan": namaKegiatan,
    "deskripsi_kegiatan": deskripsiKegiatan,
    "tgl_input": tglInput == null ? null : "${tglInput?.year.toString().padLeft(4, '0')}-${tglInput?.month.toString().padLeft(2, '0')}-${tglInput?.day.toString().padLeft(2, '0')}",
    "id_karyawan": idKaryawan,
    "tgl_mulai": tglMulai == null ? null : "${tglMulai?.year.toString().padLeft(4, '0')}-${tglMulai?.month.toString().padLeft(2, '0')}-${tglMulai?.day.toString().padLeft(2, '0')}",
    "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
    "id_program": idProgram,
    "is_close": isClose,
    "baseline": baseline,
    "created_at": createdAt,
    "bulan_tahun": bulanTahun == null ? null : "${bulanTahun?.year.toString().padLeft(4, '0')}-${bulanTahun?.month.toString().padLeft(2, '0')}-${bulanTahun?.day.toString().padLeft(2, '0')}",
    "no_program": noProgram,
    "nama_program": namaProgram,
    "id_jabatan": idJabatan,
    "nama_jabatan": namaJabatan,
    "id_sub_kelompok_anggaran": idSubKelompokAnggaran,
    "nama_sub_kelompok_anggaran": namaSubKelompokAnggaran,
    "id_unit_organisasi": idUnitOrganisasi,
    "nama_unit_organisasi": namaUnitOrganisasi,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan": catatan,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "nama_karyawan": namaKaryawan,
  };
}
