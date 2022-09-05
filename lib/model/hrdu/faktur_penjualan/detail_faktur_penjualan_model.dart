// To parse this JSON data, do
//
//     final detailRegfpnj = detailRegfpnjFromJson(jsonString);

import 'dart:convert';

class DetailRegfpnj {
    DetailRegfpnj({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailRegfpnj.fromRawJson(String str) => DetailRegfpnj.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailRegfpnj.fromJson(Map<String, dynamic> json) => DetailRegfpnj(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data!.toJson(),
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
        detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail!.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": List<dynamic>.from(approval.map((x) => x.toJson())),
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
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString()
    };
}

class DataDetail {
    DataDetail({
        this.idFakturPenjualan,
        this.tglFaktur,
        this.noFaktur,
        this.idSalesOrder,
        this.tglSalesOrder,
        this.noSalesOrder,
        this.idCustomer,
        this.batasWaktu,
        this.catatan,
        this.alamatPengiriman,
        this.diskon,
        this.ppn,
        this.createdAt,
        this.idSales,
        this.namaSales,
        this.namaCustomer,
        this.noJurnal,
        this.baseline,
        this.idProyek,
        this.namaProyek,
        this.persentasePrelim,
        this.uangMuka,
        this.detail,
        this.prelim,
    });

    final String? idFakturPenjualan;
    final DateTime? tglFaktur;
    final String? noFaktur;
    final String? idSalesOrder;
    final DateTime? tglSalesOrder;
    final String? noSalesOrder;
    final String? idCustomer;
    final DateTime? batasWaktu;
    final String? catatan;
    final String? alamatPengiriman;
    final String? diskon;
    final String? ppn;
    final DateTime? createdAt;
    final String? idSales;
    final String? namaSales;
    final String? namaCustomer;
    final String? noJurnal;
    final String? baseline;
    final String? idProyek;
    final String? namaProyek;
    final String? persentasePrelim;
    final String? uangMuka;
    final List<DetailElement>? detail;
    final List<Prelim>? prelim;

    factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
        idFakturPenjualan: json["id_faktur_penjualan"] == null ? "-" : json["id_faktur_penjualan"].toString(),
        tglFaktur: json["tgl_faktur"] == null ? null : DateTime.parse(json["tgl_faktur"]),
        noFaktur: json["no_faktur"] == null ? "-" : json["no_faktur"].toString(),
        idSalesOrder: json["id_sales_order"] == null ? "-" : json["id_sales_order"].toString(),
        tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
        noSalesOrder: json["no_sales_order"] == null ? "-" : json["no_sales_order"].toString(),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        alamatPengiriman: json["alamat_pengiriman"] == null ? "-" : json["alamat_pengiriman"].toString(),
        diskon: json["diskon"] == null ? "0.00" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "0.00" : json["ppn"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        idSales: json["id_sales"] == null ? "-" : json["id_sales"].toString(),
        namaSales: json["nama_sales"] == null ? "-" : json["nama_sales"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        noJurnal: json["no_jurnal"] == null ? "-" : json["no_jurnal"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        persentasePrelim: json["persentase_prelim"] == null ? "0.00" : json["persentase_prelim"].toString(),
        uangMuka: json["uang_muka"] == null ? "0.00" : json["uang_muka"].toString(),
        detail: json["detail"] == List.empty() ? [] : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
        prelim: json["prelim"] == null ? [] : json["prelim"] == List.empty() ? [] : List<Prelim>.from(json["prelim"].map((x) => Prelim.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_faktur_penjualan": idFakturPenjualan == null ? "-" : idFakturPenjualan.toString(),
        "tgl_faktur": tglFaktur == null ? null : "${tglFaktur?.year.toString().padLeft(4, '0')}-${tglFaktur?.month.toString().padLeft(2, '0')}-${tglFaktur?.day.toString().padLeft(2, '0')}",
        "no_faktur": noFaktur == null ? "-" : noFaktur.toString(),
        "id_sales_order": idSalesOrder == null ? "-" : idSalesOrder.toString(),
        "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
        "no_sales_order": noSalesOrder == null ? "-" : noSalesOrder.toString(),
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
        "catatan": catatan == null ? "-" : catatan.toString(),
        "alamat_pengiriman": alamatPengiriman == null ? "-" : alamatPengiriman.toString(),
        "diskon": diskon == null ? "0.00" : diskon.toString(),
        "ppn": ppn == null ? "0.00" : ppn.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "no_jurnal": noJurnal == null ? "-" : noJurnal.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "persentase_prelim": persentasePrelim == null ? "0.00" : persentasePrelim.toString(),
        "uang_muka": uangMuka == null ? "0.00" : uangMuka.toString(),
        "detail": detail == List.empty() ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())),
        "prelim": prelim == List.empty()? [] : List<dynamic>.from(prelim!.map((x) => x.toJson())),
    };
}

class DetailElement {
    DetailElement({
        this.idFakturPenjualanDetail,
        this.idFakturPenjualan,
        this.idSuratJalanDetail,
        this.idSuratJalan,
        this.noSuratJalan,
        this.tglSuratJalan,
        this.idDeliveryOrder,
        this.noDeliveryOrder,
        this.tglDeliveryOrder,
        this.idDeliveryOrderDetail,
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.idSatuan,
        this.namaSatuan,
        this.hargaSatuanJual,
        this.qty,
        this.jumlah,
        this.tglPenerimaanSuratJalan,
        this.noPenerimaanSuratJalan,
        this.persentaseProgress,
    });

    final String? idFakturPenjualanDetail;
    final String? idFakturPenjualan;
    final String? idSuratJalanDetail;
    final String? idSuratJalan;
    final String? noSuratJalan;
    final DateTime? tglSuratJalan;
    final String? idDeliveryOrder;
    final String? noDeliveryOrder;
    final DateTime? tglDeliveryOrder;
    final String? idDeliveryOrderDetail;
    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? idSatuan;
    final String? namaSatuan;
    final String? hargaSatuanJual;
    final String? qty;
    final String? jumlah;
    final DateTime? tglPenerimaanSuratJalan;
    final String? noPenerimaanSuratJalan;
    final String? persentaseProgress;

    factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        idFakturPenjualanDetail: json["id_faktur_penjualan_detail"] == null ? "-" : json["id_faktur_penjualan_detail"].toString(),
        idFakturPenjualan: json["id_faktur_penjualan"] == null ? "-" : json["id_faktur_penjualan"].toString(),
        idSuratJalanDetail: json["id_surat_jalan_detail"] == null ? "-" : json["id_surat_jalan_detail"].toString(),
        idSuratJalan: json["id_surat_jalan"] == null ? "-" : json["id_surat_jalan"].toString(),
        noSuratJalan: json["no_surat_jalan"] == null ? "-" : json["no_surat_jalan"].toString(),
        tglSuratJalan: json["tgl_surat_jalan"] == null ? null : DateTime.parse(json["tgl_surat_jalan"]),
        idDeliveryOrder: json["id_delivery_order"] == null ? "-" : json["id_delivery_order"].toString(),
        noDeliveryOrder: json["no_delivery_order"] == null ? "-" : json["no_delivery_order"].toString(),
        tglDeliveryOrder: json["tgl_delivery_order"] == null ? null : DateTime.parse(json["tgl_delivery_order"]),
        idDeliveryOrderDetail: json["id_delivery_order_detail"] == null ? "-" : json["id_delivery_order_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaSatuanJual: json["harga_satuan_jual"] == null ? "0.00" : json["harga_satuan_jual"].toString(),
        qty: json["qty"] == null ? "0.00" : json["qty"].toString(),
        jumlah: json["jumlah"] == null ? "-" : json["jumlah"].toString(),
        tglPenerimaanSuratJalan: json["tgl_penerimaan_surat_jalan"] == null ? null : DateTime.parse(json["tgl_penerimaan_surat_jalan"]),
        noPenerimaanSuratJalan: json["no_penerimaan_surat_jalan"] == null ? "-" : json["no_penerimaan_surat_jalan"].toString(),
        persentaseProgress: json["persentase_progress"] == null ? "-" : json["persentase_progress"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_faktur_penjualan_detail": idFakturPenjualanDetail == null ? "-" : idFakturPenjualanDetail.toString(),
        "id_faktur_penjualan": idFakturPenjualan == null ? "-" : idFakturPenjualan.toString(),
        "id_surat_jalan_detail": idSuratJalanDetail == null ? "-" : idSuratJalanDetail.toString(),
        "id_surat_jalan": idSuratJalan == null ? "-" : idSuratJalan.toString(),
        "no_surat_jalan": noSuratJalan == null ? "-" : noSuratJalan.toString(),
        "tgl_surat_jalan": tglSuratJalan == null ? null : "${tglSuratJalan?.year.toString().padLeft(4, '0')}-${tglSuratJalan?.month.toString().padLeft(2, '0')}-${tglSuratJalan?.day.toString().padLeft(2, '0')}",
        "id_delivery_order": idDeliveryOrder == null ? "-" : idDeliveryOrder.toString(),
        "no_delivery_order": noDeliveryOrder == null ? "-" : noDeliveryOrder.toString(),
        "tgl_delivery_order": tglDeliveryOrder == null ? null : "${tglDeliveryOrder?.year.toString().padLeft(4, '0')}-${tglDeliveryOrder?.month.toString().padLeft(2, '0')}-${tglDeliveryOrder?.day.toString().padLeft(2, '0')}",
        "id_delivery_order_detail": idDeliveryOrderDetail == null ? "-" : idDeliveryOrderDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_satuan_jual": hargaSatuanJual == null ? "0.00" : hargaSatuanJual.toString(),
        "qty": qty == null ? "0.00" : qty.toString(),
        "jumlah": jumlah == null ? "-" : jumlah.toString(),
        "tgl_penerimaan_surat_jalan": tglPenerimaanSuratJalan == null ? null : "${tglPenerimaanSuratJalan?.year.toString().padLeft(4, '0')}-${tglPenerimaanSuratJalan?.month.toString().padLeft(2, '0')}-${tglPenerimaanSuratJalan?.day.toString().padLeft(2, '0')}",
        "no_penerimaan_surat_jalan": noPenerimaanSuratJalan == null ? "-" : noPenerimaanSuratJalan.toString(),
        "persentase_progress": persentaseProgress == null ? "-" : persentaseProgress.toString(),
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
        qtyAnalisa: json["qty_analisa"] == null ? "0.00" : json["qty_analisa"].toString(),
        idSatuanPrelim: json["id_satuan_prelim"] == null ? "-" : json["id_satuan_prelim"].toString(),
        kodeSatuanPrelim: json["kode_satuan_prelim"] == null ? "-" : json["kode_satuan_prelim"].toString(),
        namaSatuanPrelim: json["nama_satuan_prelim"] == null ? "-" : json["nama_satuan_prelim"].toString(),
        qtyDurasi: json["qty_durasi"] == null ? "-" : json["qty_durasi"].toString(),
        idSatuanWaktu: json["id_satuan_waktu"] == null ? "-" : json["id_satuan_waktu"].toString(),
        kodeSatuanWaktu: json["kode_satuan_waktu"] == null ? "-" : json["kode_satuan_waktu"].toString(),
        namaSatuanWaktu: json["nama_satuan_waktu"] == null ? "-" : json["nama_satuan_waktu"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        konstanta: json["konstanta"] == null ? "0.00" : json["konstanta"].toString(),
        unitPrice: json["unit_price"] == null ? "0.00" : json["unit_price"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab_prelim": idRabPrelim == null ? "-" : idRabPrelim.toString(),
        "id_item_prelim": idItemPrelim == null ? "-" : idItemPrelim.toString(),
        "kode_item_prelim": kodeItemPrelim == null ? "-" : kodeItemPrelim.toString(),
        "nama_item_prelim": namaItemPrelim == null ? "-" : namaItemPrelim.toString(),
        "id_kelompok": idKelompok == null ? "-" : idKelompok.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "harga_satuan_prelim": hargaSatuanPrelim == null ? "-" : hargaSatuanPrelim.toString(),
        "qty_analisa": qtyAnalisa == null ? "0.00" : qtyAnalisa.toString(),
        "id_satuan_prelim": idSatuanPrelim == null ? "-" : idSatuanPrelim.toString(),
        "kode_satuan_prelim": kodeSatuanPrelim == null ? "-" : kodeSatuanPrelim.toString(),
        "nama_satuan_prelim": namaSatuanPrelim == null ? "-" : namaSatuanPrelim.toString(),
        "qty_durasi": qtyDurasi == null ? "-" : qtyDurasi.toString(),
        "id_satuan_waktu": idSatuanWaktu == null ? "-" : idSatuanWaktu.toString(),
        "kode_satuan_waktu": kodeSatuanWaktu == null ? "-" : kodeSatuanWaktu.toString(),
        "nama_satuan_waktu": namaSatuanWaktu == null ? "-" : namaSatuanWaktu.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "konstanta": konstanta == null ? "0.00" : konstanta.toString(),
        "unit_price": unitPrice == null ? "0.00" : unitPrice.toString(),
    };
}
