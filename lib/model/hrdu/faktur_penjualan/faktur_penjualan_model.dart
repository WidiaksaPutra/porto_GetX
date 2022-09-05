// To parse this JSON data, do
//
//     final regfpnj = regfpnjFromJson(jsonString);

import 'dart:convert';

class Regfpnj {
    Regfpnj({
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

    factory Regfpnj.fromRawJson(String str) => Regfpnj.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regfpnj.fromJson(Map<String, dynamic> json) => Regfpnj(
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
        this.idFakturPenjualan,
        this.idSalesOrder,
        this.tglFaktur,
        this.noFaktur,
        this.tglSalesOrder,
        this.noSalesOrder,
        this.idCustomer,
        this.batasWaktu,
        this.alamatPengiriman,
        this.diskon,
        this.ppn,
        this.idSales,
        this.namaSales,
        this.namaCustomer,
        this.noJurnal,
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
        this.namaKaryawanApproval,
        this.namaJabatanApproval,
        this.idKaryawanPengaju,
        this.idJabatanPengaju,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
        this.idProyek,
        this.namaProyek,
        this.persentasePrelim,
        this.uangMuka,
    });

    final String? idFakturPenjualan;
    final String? idSalesOrder;
    final DateTime? tglFaktur;
    final String? noFaktur;
    final DateTime? tglSalesOrder;
    final String? noSalesOrder;
    final String? idCustomer;
    final DateTime? batasWaktu;
    final String? alamatPengiriman;
    final String? diskon;
    final String? ppn;
    final String? idSales;
    final String? namaSales;
    final String? namaCustomer;
    final String? noJurnal;
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
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? idProyek;
    final String? namaProyek;
    final String? persentasePrelim;
    final String? uangMuka;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idFakturPenjualan: json["id_faktur_penjualan"] == null ? "-" : json["id_faktur_penjualan"].toString(),
        idSalesOrder: json["id_sales_order"] == null ? "-" : json["id_sales_order"].toString(),
        tglFaktur: json["tgl_faktur"] == null ? null : DateTime.parse(json["tgl_faktur"]),
        noFaktur: json["no_faktur"] == null ? "-" : json["no_faktur"].toString(),
        tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
        noSalesOrder: json["no_sales_order"] == null ? "-" : json["no_sales_order"].toString(),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
        alamatPengiriman: json["alamat_pengiriman"] == null ? "-" : json["alamat_pengiriman"].toString(),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        idSales: json["id_sales"] == null ? "-" : json["id_sales"].toString(),
        namaSales: json["nama_sales"] == null ? "-" : json["nama_sales"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        noJurnal: json["no_jurnal"] == null ? "-" : json["no_jurnal"].toString(),
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
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        persentasePrelim: json["persentase_prelim"] == null ? "-" : json["persentase_prelim"].toString(),
        uangMuka: json["uang_muka"] == null ? "-" : json["uang_muka"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_faktur_penjualan": idFakturPenjualan == null ? "-" : idFakturPenjualan.toString(),
        "id_sales_order": idSalesOrder == null ? "-" : idSalesOrder.toString(),
        "tgl_faktur": tglFaktur == null ? "-" : "${tglFaktur?.year.toString().padLeft(4, '0')}-${tglFaktur?.month.toString().padLeft(2, '0')}-${tglFaktur?.day.toString().padLeft(2, '0')}".toString(),
        "no_faktur": noFaktur == null ? "-" : noFaktur.toString(),
        "tgl_sales_order": tglSalesOrder == null ? "-" : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}".toString(),
        "no_sales_order": noSalesOrder == null ? "-" : noSalesOrder.toString(),
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "batas_waktu": batasWaktu == null ? "-" : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}".toString(),
        "alamat_pengiriman": alamatPengiriman == null ? "-" : alamatPengiriman.toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "no_jurnal": noJurnal == null ? "-" : noJurnal.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? "-" : createdAt.toString(),
        "tgl_approval": tglApproval == null ? "-" : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}".toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "persentase_prelim": persentasePrelim == null ? "-" : persentasePrelim.toString(),
        "uang_muka": uangMuka == null ? "-" : uangMuka.toString()
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
        "status_approval": statusApproval == List.empty() ? [] : List<dynamic>.from(statusApproval!.map((x) => x)),
    };
}
