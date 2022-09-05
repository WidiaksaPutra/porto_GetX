// To parse this JSON data, do
//
//     final regsospk = regsospkFromJson(jsonString);

import 'dart:convert';

class Regsospk {
    Regsospk({
        this.status,
        this.message,
        this.xqry,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory Regsospk.fromRawJson(String str) => Regsospk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regsospk.fromJson(Map<String, dynamic> json) => Regsospk(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry!.toJson(),
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount!.toInt(),
        "total_page": totalPage == null ? 0 : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
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
        this.namaBarang,
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
    final List<NamaBarang>? namaBarang;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSalesOrderSpk: json["id_sales_order_spk"] == null ? "-" : json["id_sales_order_spk"].toString(),
        tglSalesOrderSpk: json["tgl_sales_order_spk"] == null ? null : DateTime.parse(json["tgl_sales_order_spk"]),
        noSalesOrderSpk: json["no_sales_order_spk"] == null ? "-" : json["no_sales_order_spk"].toString(),
        tglBatasWaktu: json["tgl_batas_waktu"] == null ? null : DateTime.parse(json["tgl_batas_waktu"]),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
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
        uangMuka: json["uang_muka"] == null ? "-" : json["uang_muka"].toString(),
        namaBarang: json["nama_barang"] == List.empty() ? [] : List<NamaBarang>.from(json["nama_barang"].map((x) => NamaBarang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order_spk": idSalesOrderSpk == null ? "-" : idSalesOrderSpk.toString(),
        "tgl_sales_order_spk": tglSalesOrderSpk == null ? "-" : "${tglSalesOrderSpk?.year.toString().padLeft(4, '0')}-${tglSalesOrderSpk?.month.toString().padLeft(2, '0')}-${tglSalesOrderSpk?.day.toString().padLeft(2, '0')}",
        "no_sales_order_spk": noSalesOrderSpk == null ? "-" : noSalesOrderSpk.toString(),
        "tgl_batas_waktu": tglBatasWaktu == null ? "-" : "${tglBatasWaktu?.year.toString().padLeft(4, '0')}-${tglBatasWaktu?.month.toString().padLeft(2, '0')}-${tglBatasWaktu?.day.toString().padLeft(2, '0')}".toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_spk": idSpk == null ? "-" : idSpk.toString(),
        "no_spk": noSpk == null ? "-" : noSpk.toString(),
        "tgl_spk": tglSpk == null ? "-" : "${tglSpk?.year.toString().padLeft(4, '0')}-${tglSpk?.month.toString().padLeft(2, '0')}-${tglSpk?.day.toString().padLeft(2, '0')}".toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? "-" : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}".toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "att": att == null ? "-" : att.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "tgl_rab": tglRab == null ? "-" : "${tglRab?.year.toString().padLeft(4, '0')}-${tglRab?.month.toString().padLeft(2, '0')}-${tglRab?.day.toString().padLeft(2, '0')}".toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "tgl_rae": tglRae == null ? "-" : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}".toString(),
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "tgl_penawaran": tglPenawaran == null ? "-" : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}".toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? "-" : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}".toString(),
        "tgl_selesai": tglSelesai == null ? "-" : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}".toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? "-" : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? "-" : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}".toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "uang_muka": uangMuka == null ? "-" : uangMuka.toString(),
        "nama_barang": namaBarang == List.empty() ? [] : List<dynamic>.from(namaBarang!.map((x) => x.toJson())),
    };
}

class NamaBarang {
    NamaBarang({
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

    factory NamaBarang.fromRawJson(String str) => NamaBarang.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NamaBarang.fromJson(Map<String, dynamic> json) => NamaBarang(
        idSalesOrderSpkDetail: json["id_sales_order_spk_detail"] == null ? "-" : json["id_sales_order_spk_detail"].toString().toString(),
        idSalesOrderSpk: json["id_sales_order_spk"] == null ? "-" : json["id_sales_order_spk"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeBarang: json["kode_barang"] == null ? "-" : json["kode_barang"].toString(),
        namaBarang: json["nama_barang"] == null ? "-" : json["nama_barang"].toString(),
        idGudang: json["id_gudang"] == null ? "-" : json["id_gudang"].toString(),
        namaGudang: json["nama_gudang"] == null ? "-" : json["nama_gudang"].toString(),
        qtySalesOrderSpk: json["qty_sales_order_spk"] == null ? "-" : json["qty_sales_order_spk"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaRate: json["harga_rate"] == null ? "-" : json["harga_rate"].toString(),
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
        "qty_sales_order_spk": qtySalesOrderSpk == null ? "-" : qtySalesOrderSpk.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_rate": hargaRate == null ? "-" : hargaRate.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.approvalLevel,
        this.statusApproval,
    });

    final String? page;
    final String? perPage;
    final int? approvalLevel;
    final List<String>? statusApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        approvalLevel: json["approval_level"] == null ? 0 : json["approval_level"].toInt(),
        statusApproval: json["status_approval"] == List.empty() ? [] : List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "approval_level": approvalLevel == null ? 0 : approvalLevel!.toInt(),
        "status_approval": statusApproval == List.empty() ? [] : List<dynamic>.from(statusApproval!.map((x) => x)).toString(),
    };
}