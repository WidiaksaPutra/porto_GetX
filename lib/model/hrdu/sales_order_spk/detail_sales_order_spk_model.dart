// To parse this JSON data, do
//
//     final detailRegsospk = detailRegsospkFromJson(jsonString);

import 'dart:convert';

class DetailRegsospk {
    DetailRegsospk({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailRegsospk.fromRawJson(String str) => DetailRegsospk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailRegsospk.fromJson(Map<String, dynamic> json) => DetailRegsospk(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data == null ? null : data!.toJson(),
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
        approval: json["approval"] == List.empty() ? [] : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail!.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": approval == List.empty() ? [] : List<dynamic>.from(approval.map((x) => x.toJson())),
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
        "created_at": createdAt == null ? "-" : createdAt.toString(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString(),
    };
}

class DataDetail {
    DataDetail({
        this.idSalesOrderSpk,
        this.tglSalesOrderSpk,
        this.noSalesOrderSpk,
        this.tglBatasWaktu,
        this.diskon,
        this.ppn,
        this.idSales,
        this.namaSales,
        this.baseline,
        this.idSpk,
        this.noSpk,
        this.tglSpk,
        this.idPeluang,
        this.noPeluang,
        this.tglPeluang,
        this.namaPeringkatPeluang,
        this.keteranganPengiriman,
        this.lokasiPengiriman,
        this.att,
        this.namaProyek,
        this.lainLain,
        this.idRab,
        this.noRab,
        this.tglRab,
        this.idRae,
        this.tglRae,
        this.noRae,
        this.idPenawaran,
        this.noPenawaran,
        this.tglPenawaran,
        this.namaCustomer,
        this.linkReferensi,
        this.scheduleKebutuhanProyek,
        this.realisasiPenawaran,
        this.tglSelesai,
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
        this.namaKaryawanApproval,
        this.namaJabatanApproval,
        this.idKaryawanPengaju,
        this.idJabatanPengaju,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
        this.uangMuka,
        this.detail,
        this.stakeholder,
        this.prelim,
    });

    final String? idSalesOrderSpk;
    final DateTime? tglSalesOrderSpk;
    final String? noSalesOrderSpk;
    final DateTime? tglBatasWaktu;
    final String? diskon;
    final String? ppn;
    final String? idSales;
    final String? namaSales;
    final String? baseline;
    final String? idSpk;
    final String? noSpk;
    final DateTime? tglSpk;
    final String? idPeluang;
    final String? noPeluang;
    final DateTime? tglPeluang;
    final String? namaPeringkatPeluang;
    final String? keteranganPengiriman;
    final String? lokasiPengiriman;
    final String? att;
    final String? namaProyek;
    final String? lainLain;
    final String? idRab;
    final String? noRab;
    final DateTime? tglRab;
    final String? idRae;
    final DateTime? tglRae;
    final String? noRae;
    final String? idPenawaran;
    final String? noPenawaran;
    final DateTime? tglPenawaran;
    final String? namaCustomer;
    final String? linkReferensi;
    final String? scheduleKebutuhanProyek;
    final DateTime? realisasiPenawaran;
    final DateTime? tglSelesai;
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
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? uangMuka;
    final List<DetailElement>? detail;
    final List<Approval>? stakeholder;
    final List<Prelim>? prelim;

    factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
        idSalesOrderSpk: json["id_sales_order_spk"] == null ? "-" : json["id_sales_order_spk"].toString(),
        tglSalesOrderSpk: json["tgl_sales_order_spk"] == null ? null : DateTime.parse(json["tgl_sales_order_spk"]),
        noSalesOrderSpk: json["no_sales_order_spk"] == null ? "-" : json["no_sales_order_spk"].toString(),
        tglBatasWaktu: json["tgl_batas_waktu"] == null ? null : DateTime.parse(json["tgl_batas_waktu"]),
        diskon: json["diskon"] == null ? "0.0" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "0.0" : json["ppn"].toString(),
        idSales: json["id_sales"] == null ? "-" : json["id_sales"].toString(),
        namaSales: json["nama_sales"] == null ? "-" : json["nama_sales"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idSpk: json["id_spk"] == null ? "-" : json["id_spk"].toString(),
        noSpk: json["no_spk"] == null ? "-" : json["no_spk"].toString(),
        tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        namaPeringkatPeluang: json["nama_peringkat_peluang"] == null ? "-" : json["nama_peringkat_peluang"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        att: json["att"] == null ? "-" : json["att"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        noRab: json["no_rab"] == null ? "-" : json["no_rab"].toString(),
        tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
        noRae: json["no_rae"] == null ? "-" : json["no_rae"].toString(),
        idPenawaran: json["id_penawaran"] == null ? "-" : json["id_penawaran"].toString(),
        noPenawaran: json["no_penawaran"] == null ? "-" : json["no_penawaran"].toString(),
        tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"] == null ? "-" : json["schedule_kebutuhan_proyek"].toString(),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
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
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        uangMuka: json["uang_muka"] == null ? "0.0" : json["uang_muka"].toString(),
        detail: json["detail"] == List.empty() ? [] : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
        stakeholder: json["stakeholder"] == List.empty() ? [] : List<Approval>.from(json["stakeholder"].map((x) => Approval.fromJson(x))),
        prelim: json["prelim"] == List.empty() ? [] : List<Prelim>.from(json["prelim"].map((x) => Prelim.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order_spk": idSalesOrderSpk == null ? "-" : idSalesOrderSpk.toString(),
        "tgl_sales_order_spk": tglSalesOrderSpk == null ? null : "${tglSalesOrderSpk?.year.toString().padLeft(4, '0')}-${tglSalesOrderSpk?.month.toString().padLeft(2, '0')}-${tglSalesOrderSpk?.day.toString().padLeft(2, '0')}".toString(),
        "no_sales_order_spk": noSalesOrderSpk == null ? "-" : noSalesOrderSpk.toString(),
        "tgl_batas_waktu": tglBatasWaktu == null ? null : "${tglBatasWaktu?.year.toString().padLeft(4, '0')}-${tglBatasWaktu?.month.toString().padLeft(2, '0')}-${tglBatasWaktu?.day.toString().padLeft(2, '0')}".toString(),
        "diskon": diskon == null ? "0.0" : diskon.toString(),
        "ppn": ppn == null ? "0.0" : ppn.toString(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_spk": idSpk == null ? "-" : idSpk.toString(),
        "no_spk": noSpk == null ? "-" : noSpk.toString(),
        "tgl_spk": tglSpk == null ? null : "${tglSpk?.year.toString().padLeft(4, '0')}-${tglSpk?.month.toString().padLeft(2, '0')}-${tglSpk?.day.toString().padLeft(2, '0')}".toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? null : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}".toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "att": att == null ? "-" : att.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "tgl_rab": tglRab == null ? null : "${tglRab?.year.toString().padLeft(4, '0')}-${tglRab?.month.toString().padLeft(2, '0')}-${tglRab?.day.toString().padLeft(2, '0')}".toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}".toString(),
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}".toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? null : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}".toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}".toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? "-" : createdAt.toString(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}".toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "uang_muka": uangMuka == null ? "0.0" : uangMuka.toString(),
        "detail": detail == List.empty() ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())).toString(),
        "stakeholder": stakeholder == List.empty() ? [] : List<dynamic>.from(stakeholder!.map((x) => x.toJson())).toString(),
        "prelim": prelim == List.empty() ? [] : List<dynamic>.from(prelim!.map((x) => x.toJson())).toString(),
    };
}

class DetailElement {
    DetailElement({
        this.idSalesOrderSpkDetail,
        this.idSalesOrderSpk,
        this.idItemBuaso,
        this.kodeBarang,
        this.namaBarang,
        this.idGudang,
        this.namaGudang,
        this.qtySalesOrderSpk,
        this.idSatuan,
        this.kodeSatuan,
        this.namaSatuan,
        this.hargaRate,
        this.idRab,
    });

    final String? idSalesOrderSpkDetail;
    final String? idSalesOrderSpk;
    final String? idItemBuaso;
    final String? kodeBarang;
    final String? namaBarang;
    final String? idGudang;
    final String? namaGudang;
    final String? qtySalesOrderSpk;
    final String? idSatuan;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? hargaRate;
    final String? idRab;

    factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        idSalesOrderSpkDetail: json["id_sales_order_spk_detail"] == null ? "-" : json["id_sales_order_spk_detail"].toString(),
        idSalesOrderSpk: json["id_sales_order_spk"] == null ? "-" : json["id_sales_order_spk"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeBarang: json["kode_barang"] == null ? "-" : json["kode_barang"].toString(),
        namaBarang: json["nama_barang"] == null ? "-" : json["nama_barang"].toString(),
        idGudang: json["id_gudang"] == null ? "-" : json["id_gudang"].toString(),
        namaGudang: json["nama_gudang"] == null ? "-" : json["nama_gudang"].toString(),
        qtySalesOrderSpk: json["qty_sales_order_spk"] == null ? "0.0" : json["qty_sales_order_spk"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaRate: json["harga_rate"] == null ? "0.0" : json["harga_rate"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order_spk_detail": idSalesOrderSpkDetail == null ? "-" : idSalesOrderSpkDetail.toString(),
        "id_sales_order_spk": idSalesOrderSpk == null ? "-" : idSalesOrderSpk.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_barang": kodeBarang == null ? "-" : kodeBarang.toString(),
        "nama_barang": namaBarang == null ? "-" : namaBarang.toString(),
        "id_gudang": idGudang == null ? "-" : idGudang.toString(),
        "nama_gudang": namaGudang == null ? "-" : namaGudang.toString(),
        "qty_sales_order_spk": qtySalesOrderSpk == null ? "0.0" : qtySalesOrderSpk.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_rate": hargaRate == null ? "0.0" : hargaRate.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
    };
}

class Prelim {
    Prelim({
        this.idRabPrelim,
        this.idItemPrelim,
        this.kodeItemPrelim,
        this.namaItemPrelim,
        this.idKelompok,
        this.namaKelompok,
        this.hargaSatuanPrelim,
        this.qtyAnalisa,
        this.idSatuanPrelim,
        this.kodeSatuanPrelim,
        this.namaSatuanPrelim,
        this.qtyDurasi,
        this.idSatuanWaktu,
        this.kodeSatuanWaktu,
        this.namaSatuanWaktu,
        this.idRab,
        this.konstanta,
        this.unitPrice,
    });

    final String? idRabPrelim;
    final String? idItemPrelim;
    final String? kodeItemPrelim;
    final String? namaItemPrelim;
    final String? idKelompok;
    final String? namaKelompok;
    final String? hargaSatuanPrelim;
    final String? qtyAnalisa;
    final String? idSatuanPrelim;
    final String? kodeSatuanPrelim;
    final String? namaSatuanPrelim;
    final String? qtyDurasi;
    final String? idSatuanWaktu;
    final String? kodeSatuanWaktu;
    final String? namaSatuanWaktu;
    final String? idRab;
    final String? konstanta;
    final String? unitPrice;

    factory Prelim.fromRawJson(String str) => Prelim.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Prelim.fromJson(Map<String, dynamic> json) => Prelim(
        idRabPrelim: json["id_rab_prelim"] == null ? "-" : json["id_rab_prelim"].toString(),
        idItemPrelim: json["id_item_prelim"] == null ? "-" : json["id_item_prelim"].toString(),
        kodeItemPrelim: json["kode_item_prelim"] == null ? "-" : json["kode_item_prelim"].toString(),
        namaItemPrelim: json["nama_item_prelim"] == null ? "-" : json["nama_item_prelim"].toString(),
        idKelompok: json["id_kelompok"] == null ? "-" : json["id_kelompok"].toString(),
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
        hargaSatuanPrelim: json["harga_satuan_prelim"] == null ? "-" : json["harga_satuan_prelim"].toString(),
        qtyAnalisa: json["qty_analisa"] == null ? "-" : json["qty_analisa"].toString(),
        idSatuanPrelim: json["id_satuan_prelim"] == null ? "-" : json["id_satuan_prelim"].toString(),
        kodeSatuanPrelim: json["kode_satuan_prelim"] == null ? "-" : json["kode_satuan_prelim"].toString(),
        namaSatuanPrelim: json["nama_satuan_prelim"] == null ? "-" : json["nama_satuan_prelim"].toString(),
        qtyDurasi: json["qty_durasi"] == null ? "-" : json["qty_durasi"].toString(),
        idSatuanWaktu: json["id_satuan_waktu"] == null ? "-" : json["id_satuan_waktu"].toString(),
        kodeSatuanWaktu: json["kode_satuan_waktu"] == null ? "-" : json["kode_satuan_waktu"].toString(),
        namaSatuanWaktu: json["nama_satuan_waktu"] == null ? "-" : json["nama_satuan_waktu"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab_prelim": idRabPrelim == null ? "-" : idRabPrelim.toString(),
        "id_item_prelim": idItemPrelim == null ? "-" : idItemPrelim.toString(),
        "kode_item_prelim": kodeItemPrelim == null ? "-" : kodeItemPrelim.toString(),
        "nama_item_prelim": namaItemPrelim == null ? "-" : namaItemPrelim.toString(),
        "id_kelompok": idKelompok == null ? "-" : idKelompok.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "harga_satuan_prelim": hargaSatuanPrelim == null ? "-" : hargaSatuanPrelim.toString(),
        "qty_analisa": qtyAnalisa == null ? "-" : qtyAnalisa.toString(),
        "id_satuan_prelim": idSatuanPrelim == null ? "-" : idSatuanPrelim.toString(),
        "kode_satuan_prelim": kodeSatuanPrelim == null ? "-" : kodeSatuanPrelim.toString(),
        "nama_satuan_prelim": namaSatuanPrelim == null ? "-" : namaSatuanPrelim.toString(),
        "qty_durasi": qtyDurasi == null ? "-" : qtyDurasi.toString(),
        "id_satuan_waktu": idSatuanWaktu == null ? "-" : idSatuanWaktu.toString(),
        "kode_satuan_waktu": kodeSatuanWaktu == null ? "-" : kodeSatuanWaktu.toString(),
        "nama_satuan_waktu": namaSatuanWaktu == null ? "-" : namaSatuanWaktu.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
    };
}
