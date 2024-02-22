import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:dailoz/dailoz/dailoz_page/dailoz_task/chitietlichsu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dulieu.dart';
import '../dailoz_task/dailoz_taskdetail.dart';
import '../dailoz_task/lichsuitem.dart';
import '../dailoz_task/themdulieu.dart';
import 'dailoz_mytask.dart';

class Dailozhome extends StatefulWidget {
  const Dailozhome({Key? key}) : super(key: key);

  @override
  State<Dailozhome> createState() => _DailozhomeState();
}
String convertHourFormat(String input) {
  try {
    int hour = int.parse(input.split('h')[0]);
    return '$hour Giờ';
  } catch (e) {
    return input; // Trả về nguyên gốc nếu không thể chuyển đổi
  }
}

void _sortDataByDate() {
  lichSuItems.sort((a, b) => b.ngay.compareTo(a.ngay));
}


List<LichSuItem> lichSuItems = [];
final DatabaseHelper dbHelper = DatabaseHelper();

class _DailozhomeState extends State<Dailozhome> {

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    await dbHelper.initDatabase();
    List<Map<String, dynamic>> lichSuData = await dbHelper.getAllLichSu();
    setState(() {
      lichSuItems.clear();
      _sortDataByDate();

      int newestItemId = lichSuData.isNotEmpty
          ? lichSuData.reduce((a, b) => a['id'] > b['id'] ? a : b)['id']
          : 0;

      for (var i = 0; i < lichSuData.length; i++) {
        lichSuItems.add(LichSuItem(
          id: lichSuData[i]['id'],
          thu: lichSuData[i]['thu'],
          ngay: lichSuData[i]['ngay'],
          cdSang: lichSuData[i]['cd_sang'],
          cdToi: lichSuData[i]['cd_toi'],
          donThuong: lichSuData[i]['don_thuong'],
          tongChuyen: lichSuData[i]['tong_chuyen'],
          tongDiem: lichSuData[i]['tong_diem'],
          doanhThuNgay: lichSuData[i]['doanh_thungay'],
          vuotChuyen: lichSuData[i]['vuot_chuyen'],
          dbThuNhap: lichSuData[i]['db_thunhap'],
          diemTuan: lichSuData[i]['diem_tuan'],
          duGio: lichSuData[i]['du_gio'],
          caDangKi: lichSuData[i]['ca_dangki'],
          gioThemDuLieu: lichSuData[i]['gio_themdulieu'],
          thoigianHd: lichSuData[i]['thoigian_hd'],
          solansacPin: lichSuData[i]['solansac_pin'],
          thoigianSac: lichSuData[i]['thoigian_sac'],
          tilenhanchuyen: lichSuData[i]['tilenhanchuyen'],
          tilehuychuyen: lichSuData[i]['tilehuychuyen'],
          tilehoanthanhchuyen: lichSuData[i]['tilehoanthanhchuyen'],
          yatagami7: lichSuData[i]['yatagami7'],
          yatagami8: lichSuData[i]['yatagami8'],
          yatagami9: lichSuData[i]['yatagami9'],
          yatagami10: lichSuData[i]['yatagami10'],
          yatagami11: lichSuData[i]['yatagami11'],
          yatagami12: lichSuData[i]['yatagami12'],
          yatagami13: lichSuData[i]['yatagami13'],
          yatagami14: lichSuData[i]['yatagami14'],
          yatagami15: lichSuData[i]['yatagami15'],
          yatagami16: lichSuData[i]['yatagami16'],
          isNewest: lichSuData[i]['id'] == newestItemId,
        ));
      }
    });
  }



  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/96,),
              Row(
                children: [



                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Xin Chào, Yatogami Tenka".tr, style: hsSemiBold.copyWith(fontSize: 26)),



                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Bạn đã đăng kí đại sứ : $formattedHour",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),


                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Nhiệm vụ Tuần : coming soon",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),


                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Nhiệm vụ ngày : coming soon",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),


                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "App dev by (0397770219 Zalo) - phiên bản hỗ trợ HCM",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),



                    ],
                  ),



                  const Spacer(),
                  Container(
                    width: height/16,
                    height: height/16,
                    decoration:  BoxDecoration(
                      color: DailozColor.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(color: DailozColor.textgray,blurRadius: 5)
                        ]
                    ),
                    child: Image.asset(DailozPngimage.avtar,height: height/36,),
                  )
                ],
              ),



              SizedBox(height: height/36,),
              Text("My_Task".tr,style: hsSemiBold.copyWith(fontSize: 24),),
              SizedBox(height: height/36,),


              //11212
              Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DailozMyTask("Completed")),
                          );
                        },
                        child: Container(
                          height: height / 5.5,
                          width: width / 2.2,
                          decoration: BoxDecoration(
                            color: DailozColor.lightblue,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(DailozPngimage.iMac, height: height / 10, fit: BoxFit.fitHeight),
                                    Spacer(),
                                    Icon(Icons.arrow_forward, color: DailozColor.black, size: 22),
                                  ],
                                ),

                                Text(
                                  "test".tr,
                                  style: hsMedium.copyWith(fontSize: 16, color: DailozColor.black),
                                ),
                                SizedBox(height: height / 120),
                                Text(
                                  "86" + "lan_them".tr,
                                  style: hsRegular.copyWith(fontSize: 14, color: DailozColor.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),





                      SizedBox(height: height/56,),
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DailozMyTask("Canceled");
                          },));
                        },
                        child: Container(
                          height: height/6,
                          width: width/2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.lightred,
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(DailozPngimage.closeSquare,height: height/21,fit: BoxFit.fitHeight,),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward,color: DailozColor.white,size: 22,)
                                  ],
                                ),
                                SizedBox(height: height/66,),
                                Text("Canceled".tr,style: hsMedium.copyWith(fontSize: 16,color: DailozColor.white),),
                                SizedBox(height: height/120,),
                                Text("15"+"lan_them".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.white),),

                              ],
                            ),
                          ) ,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DailozMyTask("Pending");
                          },));
                        },
                        child: Container(
                          height: height/6,
                          width: width/2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.purple,
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(DailozPngimage.timeSquare,height: height/21,fit: BoxFit.fitHeight,),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward,color: DailozColor.white,size: 22,)
                                  ],
                                ),
                                SizedBox(height: height/66,),
                                Text("Pending".tr,style: hsMedium.copyWith(fontSize: 16,color: DailozColor.white),),
                                SizedBox(height: height/120,),
                                Text("15"+"lan_them".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.white),),

                              ],
                            ),
                          ) ,
                        ),
                      ),
                      SizedBox(height: height/56,),
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DailozMyTask("OnGoing");
                          },));
                        },
                        child: Container(
                          height: height/4.5,
                          width: width/2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.lightgreen,
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(DailozPngimage.iMac,height: height/10,fit: BoxFit.fitHeight,),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward,color: DailozColor.black,size: 22,)
                                  ],
                                ),
                                SizedBox(height: height/66,),
                                Text("On_Going".tr,style: hsMedium.copyWith(fontSize: 16,color: DailozColor.black),),
                                SizedBox(height: height/120,),
                                Text("67"+"lan_them".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.black),),

                              ],
                            ),
                          ) ,
                        ),
                      ),

                    ],
                  )
                ],
              ),
              SizedBox(height: height/26,),
          ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return themdulieu(
              initDataCallback: _initData,
            );

          },));
        },
        child: const Icon(Icons.add,size: 22,color: DailozColor.white,),
      ),
    );
  }
}
