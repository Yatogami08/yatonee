import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';
import '../../dulieu.dart';
import '../dailoz_home/dailoz_home.dart';
import '../dailoz_task/dailoz_addtask.dart';
import 'chitietlichsu.dart';
import 'lichsuitem.dart';


class DailozTask extends StatefulWidget {
  const DailozTask({Key? key}) : super(key: key);

  @override
  State<DailozTask> createState() => _DailozTaskState();
}

class _DailozTaskState extends State<DailozTask> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int isselected = 0;
  final themedata = Get.put(DailozThemecontroler());





  @override
  void initState() {
    super.initState();
    _initData();

  }

  void _sortDataByDate() {
    lichSuItems.sort((a, b) => b.ngay.compareTo(a.ngay));
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

  @override
  Widget build(BuildContext context) {






    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   Text("Lịch sử thêm gần đây".tr,style: hsSemiBold.copyWith(fontSize: 24,color: DailozColor.yatogamineee),),
      ),








      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [















              ListView.builder(
                itemCount: lichSuItems.length, // Hiển thị tối đa 4 dữ liệu gần đây nhất
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // Lấy dữ liệu từ cơ sở dữ liệu (sử dụng FutureBuilder)
                  return FutureBuilder<Map<String, dynamic>>(
                    future: DatabaseHelper().getRecentData(index),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data = snapshot.data!;
                          String date = data['ngay'] ?? '';

                          if (date.isNotEmpty) {
                            return InkWell(
                              splashColor: DailozColor.transparent,
                              highlightColor: DailozColor.transparent,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return chitietlichsu(
                                    item: lichSuItems[index],
                                    initDataCallback: _initData,
                                  );
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: height / 46),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: DailozColor.bggray,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 66,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${lichSuItems[index].thu} ${lichSuItems[index].ngay}',
                                            style: hsMedium.copyWith(
                                              fontSize: 16,
                                              color: DailozColor.black,
                                            ),
                                          ),
                                          const Spacer(),
                                          Image.asset(DailozPngimage.dot, height: height / 36),
                                        ],
                                      ),
                                      SizedBox(height: height / 200),
                                      Text(
                                        "Hoạt động : ${lichSuItems[index].thoigianHd}",
                                        style: hsRegular.copyWith(
                                          fontSize: 14,
                                          color: DailozColor.textgray,
                                        ),
                                      ),
                                      SizedBox(height: height / 66),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width / 36,
                                                vertical: height / 120,
                                              ),
                                              child: Text(
                                                "Đại Sứ ${lichSuItems[index].caDangKi}",
                                                style: hsMedium.copyWith(
                                                  fontSize: 10,
                                                  color: DailozColor.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: width / 36),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width / 36,
                                                vertical: height / 120,
                                              ),
                                              child: Text(
                                                "Vượt chuyến ${lichSuItems[index].vuotChuyen}đ",
                                                style: hsMedium.copyWith(
                                                  fontSize: 10,
                                                  color: DailozColor.tim,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: width / 36),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width / 36,
                                                vertical: height / 120,
                                              ),
                                              child: Text(
                                                "${lichSuItems[index].tongDiem.toString()} điểm",
                                                style: hsMedium.copyWith(
                                                  fontSize: 10,
                                                  color: DailozColor.xanh,
                                                ),
                                              ),
                                            ),
                                          ),


                                          SizedBox(width: width / 36),

                                          if (lichSuItems[index].isNewest)

                                            Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: width / 36),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: DailozColor.yatogamineee,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: width / 36,
                                                      vertical: height / 120,
                                                    ),
                                                    child: Text(
                                                      "Mới thêm gần đây",
                                                      style: hsMedium.copyWith(
                                                        fontSize: 10,
                                                        color: DailozColor.tim,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(); // Trả về một Container rỗng nếu không có dữ liệu
                          }
                        } else {
                          return Container(); // Trả về một Container rỗng nếu không có dữ liệu
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  );
                },
              )


















            ],
          ),
        ),
      ),
    );
  }
}