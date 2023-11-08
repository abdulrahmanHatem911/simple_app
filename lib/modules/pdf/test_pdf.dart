Future<void> generatePdf(BuildContext context) async {
    final doc = pw.Document();
    final font = await rootBundle.load("assets/fonts/IBMPlexSansArabic/IBMPlexSansArabic-Regular.ttf");
    final ttf = pw.Font.ttf(font);
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.letter,
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: HiveHelper.getAppLanguage() == "ar" ? pw.TextDirection.rtl : pw.TextDirection.ltr,
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                    height: Get.height * .11,
                    alignment: pw.Alignment.bottomCenter,
                    child: pw.Container(
                      margin: const pw.EdgeInsets.only(bottom: 10),
                      child: pw.Text(
                        S.current.experienceCertification,
                        textDirection: pw.TextDirection.rtl,
                        textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(font: ttf, fontSize: 24, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 6.h),
                  pw.Padding(
                    padding: pw.EdgeInsets.symmetric(horizontal: 10.w),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Column(
                          crossAxisAlignment: HiveHelper.getAppLanguage() == "ar"
                              ? pw.CrossAxisAlignment.end
                              : pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              S.current.ToWhomConcern,
                              textDirection:
                                  HiveHelper.getAppLanguage() == "ar" ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                              textAlign: HiveHelper.getAppLanguage() == "ar" ? pw.TextAlign.left : pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 4.h),
                            pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    HiveHelper.getUserTenant()?.name ?? "",
                                    textDirection: HiveHelper.getAppLanguage() == "ar"
                                        ? pw.TextDirection.rtl
                                        : pw.TextDirection.ltr,
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(
                                      font: ttf,
                                      fontSize: 18,
                                    ),
                                  ),
                                  pw.SizedBox(width: 2.w),
                                  pw.Text(
                                    S.current.CompanyAcknowledges,
                                    textDirection: HiveHelper.getAppLanguage() == "ar"
                                        ? pw.TextDirection.rtl
                                        : pw.TextDirection.ltr,
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 4.h),
                            HiveHelper.getAppLanguage() == "ar"
                                ? pw.Row(
                                    children: [
                                      pw.Text(
                                        HiveHelper.getUserData()?.name ?? "",
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        S.current.thatMrs,
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : pw.Row(
                                    children: [
                                      pw.Text(
                                        S.current.thatMrs,
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        HiveHelper.getUserData()?.name ?? "",
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                            pw.SizedBox(height: 4.h),
                            HiveHelper.getAppLanguage() == "ar"
                                ? pw.Row(
                                    children: [
                                      pw.Text(
                                        HiveHelper.getUserData()?.workInformation?.job?.name ?? "",
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        S.current.wasWorkingCompanyJob,
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : pw.Row(
                                    children: [
                                      pw.Text(
                                        S.current.wasWorkingCompanyJob,
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        HiveHelper.getUserData()?.workInformation?.job?.name ?? "",
                                        textDirection: HiveHelper.getAppLanguage() == "ar"
                                            ? pw.TextDirection.rtl
                                            : pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                            pw.SizedBox(height: 4.h),
                            HiveHelper.getAppLanguage() == "ar"
                                ? pw.Row(
                                    children: [
                                      pw.Text(
                                          "إلي  ${DateFormat.yMMMd().format(DateTime.parse(HiveHelper.getUserData()?.updatedAt ?? ""))} ",
                                          textDirection: pw.TextDirection.rtl,
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                            font: ttf,
                                            fontSize: 18,
                                          )),
                                      pw.Text(
                                        "من   ${DateFormat.yMMMd().format(DateTime.parse(HiveHelper.getUserData()?.createdAt ?? ""))}  ",
                                        textDirection: pw.TextDirection.rtl,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        S.current.inPeriod,
                                        textDirection: pw.TextDirection.rtl,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : pw.Row(
                                    children: [
                                      pw.Text(
                                        S.current.inPeriod,
                                        textDirection: pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                      ),
                                      pw.SizedBox(width: 2.w),
                                      pw.Text(
                                        "from ${DateFormat.yMMMd().format(DateTime.parse(HiveHelper.getUserData()?.createdAt ?? ""))} ",
                                        textDirection: pw.TextDirection.ltr,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 18,
                                        ),
                                      ),
                                      pw.Text(
                                          "to ${DateFormat.yMMMd().format(DateTime.parse(HiveHelper.getUserData()?.updatedAt ?? ""))} ",
                                          textDirection: pw.TextDirection.ltr,
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                            font: ttf,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                            pw.SizedBox(height: 4.h),
                            pw.Text(
                              S.current.CompanyCertifiesCompetence,
                              textDirection:
                                  HiveHelper.getAppLanguage() == "ar" ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 10.h),
                            pw.Row(
                              children: [
                                pw.Text(
                                  S.current.companyStamp,
                                  textDirection:
                                      HiveHelper.getAppLanguage() == "ar" ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  S.current.SignatureCompetentDirector,
                                  textDirection:
                                      HiveHelper.getAppLanguage() == "ar" ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(font: ttf, fontSize: 16, fontWeight: pw.FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ); // Center
        }));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/ExperienceCertification.pdf");

    await file.writeAsBytes(await doc.save());
    // final path = (await getExternalStorageDirectory())?.path;
    OpenFilex.open(file.path);
  }
}