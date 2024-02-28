import 'dart:io';

import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_color.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_fontstyle.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database.dart';
import '../yatogami_task/yatogami_taskdetail.dart';
import 'yatogami_addpersonal.dart';

class khuvucdangki extends StatefulWidget {
  const khuvucdangki({Key? key}) : super(key: key);

  @override
  State<khuvucdangki> createState() => _DailozPersonalState();
}

class _DailozPersonalState extends State<khuvucdangki> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  String khuvuc = '';

  bool isCaDangKy = false;

  List<Color> itemColors = [
    DailozColor.bggray,
    DailozColor.bggray,
    DailozColor.bggray,
  ];


  @override
  void initState() {
    super.initState();
    // Gọi hàm để lấy giá trị ban đầu của ca_dangkiadmin từ cơ sở dữ liệu
    _loadCaDangKiAdmin();
  }


  Future<void> _loadCaDangKiAdmin() async {
    String? caDangKiAdmin = await DatabaseHelper().getCalkhuvuc();
    if (caDangKiAdmin != null) {
      setState(() {
        khuvuc = caDangKiAdmin;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashColor: DailozColor.transparent,
            highlightColor: DailozColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height / 20,
              width: height / 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: DailozColor.white,
                boxShadow: const [
                  BoxShadow(color: DailozColor.textgray, blurRadius: 5)
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width / 56),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: DailozColor.black,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Khu vực".tr,
          style: hsSemiBold.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width / 1.35,
                    child: TextFormField(
                      cursorColor: DailozColor.black,
                      style: hsMedium.copyWith(fontSize: 16, color: DailozColor.textgray),
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm ca làm việc'.tr,
                        filled: true,
                        fillColor: DailozColor.bggray,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 22,
                          color: DailozColor.grey,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Container(
                            height: height / 96,
                            width: height / 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: DailozColor.textgray,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 12,
                              color: DailozColor.white,
                            ),
                          ),
                        ),
                        hintStyle: hsMedium.copyWith(fontSize: 16, color: DailozColor.textgray),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: DailozColor.transparent,
                    highlightColor: DailozColor.transparent,
                    onTap: () {
                      // filter();
                    },
                    child: Container(
                      height: height / 13,
                      width: height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: DailozColor.bggray,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(
                          DailozPngimage.filter,
                          height: height / 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 36,),
              ListView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String title = '';
                  String activity = '';
                  String colorLabel = '';
                  String neLabel = '';
                  String xanhsm = '';
                  if (index == 0) {
                    title = 'Hà Nội';
                    activity = 'Cập nhập 22-2-2024';
                    colorLabel = 'hanoi';
                    neLabel = 'hanoi';
                    xanhsm = 'hanoi';
                  } else if (index == 1) {
                    title = 'HCM,Đồng Nai,Bình Dương';
                    activity = 'Cập nhập 22-2-2024';
                    colorLabel = 'HCM';
                    neLabel = 'Đồng Nai,Bình Dương';
                    xanhsm = 'miennam';
                  } else if (index == 2) {
                    title = 'Đà Nẵng';
                    activity = 'Cập nhập 22-2-2024';
                    colorLabel = 'Đà Nẵng';
                    neLabel = 'Đà Nẵng';
                    xanhsm = 'danang';
                  }
                  // Kiểm tra xem title có trùng với ca_dangkiadmin không
                  if (xanhsm == khuvuc) {
                    title = '$title - Đã đăng ký';
                  }
                  return InkWell(
                    splashColor: DailozColor.transparent,
                    highlightColor: DailozColor.transparent,
                    onTap: () {
                      // Nếu đã đăng ký, hiển thị thông báo, ngược lại hiển thị hộp thoại xác nhận
                      if (xanhsm == khuvuc) {
                        _showAlreadyRegisteredDialog(context);
                      } else {
                        _showConfirmationDialog1(context, title);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: height / 46),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: itemColors[index % itemColors.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 66),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(title, style: hsMedium.copyWith(fontSize: 16, color: DailozColor.black)),
                                const Spacer(),
                                Image.asset(DailozPngimage.dot, height: height / 36),
                              ],
                            ),
                            SizedBox(height: height / 200),
                            Text(activity, style: hsRegular.copyWith(fontSize: 14, color: DailozColor.textgray)),
                            SizedBox(height: height / 66),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffECEAFF),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                    child: Text(colorLabel, style: hsMedium.copyWith(fontSize: 10, color: DailozColor.red)),
                                  ),
                                ),
                                SizedBox(width: width / 36),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffECEAFF),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                    child: Text(neLabel, style: hsMedium.copyWith(fontSize: 10, color: DailozColor.tim)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,
        onPressed: () {

        },
        child: const Icon(Icons.add, size: 22, color: DailozColor.white,),
      ),
    );
  }


  Future<void> _showAlreadyRegisteredDialog(BuildContext context) async {


    return await showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/56,vertical: height/96),
              child: Column(
                children: [
                  Text("Thông báo".tr,style: hsSemiBold.copyWith(fontSize: 22)),
                  SizedBox(height: height/56,),
                  Text("Bạn đã đăng ký Thành phố này rồi.".tr,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: hsRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/36,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: height/20,
                            width: width/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: DailozColor.appcolor)
                            ),
                            child: Center(child: Text("Xác nhận".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.appcolor),)),
                          ),
                        ),
                        SizedBox(width: width/36,),


                      ],
                    ),
                  ),
                  SizedBox(height: height/56,),
                ],
              ),
            )
          ],
        ),
        context: context);
  }







  Future<void> _showConfirmationDialog1(BuildContext context, String title) async {
    String caDangKi = getTitleAsCaDangKi(title);

    return await showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/56,vertical: height/96),
              child: Column(
                children: [
                  Text("Thay đổi Thành Phố".tr,style: hsSemiBold.copyWith(fontSize: 22)),
                  SizedBox(height: height/56,),
                  Text("bạn có chắc chắn muốn đổi khu vực không ?".tr,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: hsRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/36,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: height/20,
                            width: width/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: DailozColor.appcolor)
                            ),
                            child: Center(child: Text("Cancel".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.appcolor),)),
                          ),
                        ),
                        SizedBox(width: width/36,),
                        Container(
                          height: height / 20,
                          width: width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: DailozColor.appcolor,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              // Thực hiện cập nhật giá trị ca_dangkiadmin trong yatoadmin
                              _capnhapkhuvuc(caDangKi);

                              // Load lại dữ liệu và cập nhật giao diện
                              await _loadCaDangKiAdmin();

                              // Đóng dialog
                              Navigator.of(context).pop();

                            },
                            child: Center(
                              child: Text(
                                "Đồng ý".tr,
                                style: hsRegular.copyWith(fontSize: 14, color: DailozColor.white),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: height/56,),
                ],
              ),
            )
          ],
        ),
        context: context);
  }


















// Hàm cập nhật giá trị ca_dangkiadmin trong yatoadmin
  void _capnhapkhuvuc(String caDangKi) {
    DatabaseHelper().capnhapkhuvuc(caDangKi);
  }
// Hàm chuyển đổi title từ "Đại sứ 5 Giờ", "Đại sứ 8 Giờ", "Đại sứ 10 Giờ" sang "5h", "8h", "10h"
  String getTitleAsCaDangKi(String title) {
    if (title == 'Hà Nội') {
      return 'hanoi';
    } else if (title == 'HCM,Đồng Nai,Bình Dương') {
      return 'miennam';
    } else if (title == 'Đà Nẵng') {
      return 'danang';
    }
    return ''; // Nếu không trùng với bất kỳ điều kiện nào
  }
}
