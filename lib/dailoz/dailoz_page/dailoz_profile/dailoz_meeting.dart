import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import '../../dailoz_gloabelclass/dailoz_color.dart';
import '../../dailoz_gloabelclass/dailoz_fontstyle.dart';
import '../../dulieu.dart';
import '../dailoz_home/dailoz_home.dart';

class DailozMeeting extends StatefulWidget {
  const DailozMeeting({Key? key}) : super(key: key);

  @override
  State<DailozMeeting> createState() => _DailozMeetingState();
}

class _DailozMeetingState extends State<DailozMeeting> {
  String yatogamiPath = '/storage/emulated/0/yatogami';
  List<String> backups = []; // Danh sách lưu trữ các dữ liệu đã sao lưu

  @override
  void initState() {
    super.initState();
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String backupFileName = '$yatogamiPath/$currentDate.db';
    backups.add(backupFileName); // Thêm tên tệp sao lưu vào danh sách
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height / 20,
              width: height / 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 5),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: const Text(
          "Meeting",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              // Widget tìm kiếm và nút lọc
              // ListView hiển thị các backup đã sao lưu
              ListView.builder(
                itemCount: backups.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String backupFile = backups[index];
                  return InkWell(
                    onTap: () {
                      // Xử lý khi người dùng nhấn vào một dữ liệu đã sao lưu
                      // Ví dụ: Hiển thị thông báo cho người dùng
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Thông báo"),
                            content: Text("Bạn đã chọn sao lưu: $backupFile"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Đóng"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // Xác nhận xóa và gọi hàm xóa backup
                                  await deleteBackup(backupFile);
                                  Navigator.pop(context); // Đóng AlertDialog sau khi xóa
                                },
                                child: Text("Xóa"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: height/46),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: DailozColor.bggreen
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Backup $index", style: hsMedium.copyWith(fontSize: 16, color: DailozColor.black)),
                            SizedBox(height: height/200,),
                            Text(backupFile, style: hsRegular.copyWith(fontSize: 14, color: DailozColor.textgray)),
                            SizedBox(height: height/66,),
                            ElevatedButton(
                              onPressed: () async {
                                // Kiểm tra xem tệp sao lưu có tồn tại và có dữ liệu không
                                bool backupExists = await doesBackupFileExist(backupFile);
                                if (backupExists) {
                                  // Khôi phục dữ liệu từ tệp sao lưu
                                  Database db = await dbHelper.database;
                                  if (await Permission.manageExternalStorage.request().isGranted) {
                                    await dbHelper.restoreFromBackup(backupFile, db);
                                    // Hiển thị thông báo hoặc cập nhật giao diện khi khôi phục thành công
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Thông báo"),
                                          content: Text("Dữ liệu đã được khôi phục từ: $backupFile"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Đóng"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // Xử lý khi quyền truy cập bị từ chối
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Thông báo"),
                                          content: Text("Ứng dụng cần quyền truy cập để khôi phục dữ liệu."),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Đóng"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  // Xử lý khi không có dữ liệu để khôi phục
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Thông báo"),
                                        content: Text("Không có dữ liệu để khôi phục."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Đóng"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text("Khôi phục"),
                            ),


                          ],
                        ),
                      ),
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          Database db = await dbHelper.database;
          await requestPermission();
        },
        child: const Icon(Icons.add, size: 22, color: Colors.white),
      ),
    );
  }

  Future<void> requestPermission() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      Database db = await dbHelper.database;
      await dbHelper.backupYatosmData(db);
    }
  }

  Future<bool> doesBackupFileExist(String filePath) async {
    File backupFile = File(filePath);
    return await backupFile.exists() && await backupFile.length() > 0;
  }

  // Hàm để cập nhật danh sách backup sau khi xóa file
  Future<void> updateBackupList() async {
    List<String> existingBackups = List.from(backups); // Tạo một bản sao của danh sách backup hiện tại
    backups.clear(); // Xóa tất cả các backup hiện có
    for (String backupFile in existingBackups) {
      bool exists = await doesBackupFileExist(backupFile);
      if (exists) {
        backups.add(backupFile); // Thêm lại các backup còn tồn tại
      }
    }
    setState(() {}); // Cập nhật giao diện
  }

  // Hàm xóa backup
  Future<void> deleteBackup(String filePath) async {




    if (await Permission.manageExternalStorage.request().isGranted) {
      File backupFile = File(filePath);
      await backupFile.delete(); // Xóa file backup
      await updateBackupList(); // Cập nhật danh sách backup sau khi xóa
    }






  }
}
