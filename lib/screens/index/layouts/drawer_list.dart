import 'dart:developer';
import '../../../config.dart';
import 'package:universal_html/html.dart' as html;

class DrawerList extends StatelessWidget {
  final bool? value;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const DrawerList({Key? key, this.value,this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Column(children: [
        ...appArray.drawerList.asMap().entries.map((e) {
          return MouseRegion(
              onHover: (val) {
                indexCtrl.isHover = true;
                indexCtrl.isSelectedHover = e.key;
                indexCtrl.update();
              },
              onExit: (exit) {
                indexCtrl.isHover = false;
                indexCtrl.update();
                log("val : ${indexCtrl.isHover}");
              },
              child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.isDesktop(context) && value == false
                                  ? 0
                                  : Insets.i15,
                          vertical: Insets.i8),
                      width: double.infinity,
                      child: Responsive.isDesktop(context) && value == false
                          ? SvgPicture.asset(indexCtrl
                          .selectedIndex ==
                          e.key
                          ? e.value["icon1"]!
                          : indexCtrl.isHover &&
                          indexCtrl
                              .isSelectedHover ==
                              e.key
                          ? e.value["icon1"]!
                          : e.value["icon"]!,height: Sizes.s18)
                          : Row(children: [
                              SvgPicture.asset(indexCtrl
                                  .selectedIndex ==
                                  e.key
                                  ? e.value["icon1"]!
                                  : indexCtrl.isHover &&
                                  indexCtrl
                                      .isSelectedHover ==
                                      e.key
                                  ? e.value["icon1"]!
                                  : e.value["icon"]!,height: Sizes.s18),
                              const HSpace(Sizes.s20),
                              Responsive.isDesktop(context) && value == false
                                  ? Container()
                                  : Expanded(
                                      child: Text(
                                          e.value["title"] != null
                                              ? e.value["title"].toString().tr
                                              : "",
                                          style:TextStyle(
                                            color: indexCtrl
                                                .selectedIndex ==
                                                e.key
                                                ? appCtrl.appTheme.white
                                                : indexCtrl.isHover &&
                                                indexCtrl
                                                    .isSelectedHover ==
                                                    e.key
                                                ? appCtrl.appTheme.white
                                                : appCtrl
                                                .appTheme.drawerTextColor,
                                            fontSize: 14,
                                            fontWeight: indexCtrl
                                                .selectedIndex ==
                                                e.key
                                                ? FontWeight.w800
                                                : indexCtrl.isHover &&
                                                indexCtrl
                                                    .isSelectedHover ==
                                                    e.key
                                                ? FontWeight.w800
                                                :
                                                FontWeight.w500
                                          )),
                                    )
                            ]))
                  .inkWell(onTap: () {
                    log("MOBILE");
                    if(Responsive.isMobile(context)){
                      scaffoldKey!.currentState!.closeDrawer();
                    }
                    if (e.value["title"] == "dashboard") {
                      indexCtrl.selectedIndex = 0;
                      final dash = Get.isRegistered<DashboardController>() ? Get.find<DashboardController>():Get.put(DashboardController());
                      dash.listenToChatsRealTime();
dash.update();
                    } else if (e.value["title"] == "usageControl") {
                      indexCtrl.selectedIndex = 1;
                    } else if (e.value["title"] == "appSetting") {
                      indexCtrl.selectedIndex = 2;
                    } else if (e.value["title"] == "sponsor") {
                      indexCtrl.selectedIndex = 3;
                    } else if (e.value["title"] == "wallpaper") {
                      indexCtrl.selectedIndex = 4;
                    } else if (e.value["title"] == "report") {
                      indexCtrl.selectedIndex = 5;
                    }  else if (e.value["title"] == "language") {
                      indexCtrl.selectedIndex = 6;
                    } else if (e.value["title"] == "logout") {
                      FirebaseAuth.instance.signOut();
                      indexCtrl.selectedIndex = 0;
                      html.window.localStorage[session.isLogin] = "false";
                      appCtrl.isLogged = false;
                      appCtrl.storage.remove("isSignIn");
                      appCtrl.storage.remove(session.isDarkMode);
                      appCtrl.storage.remove(session.languageCode);
                      appCtrl.isTheme = false;
                      appCtrl.languageVal = "en";
                      log("index: ${indexCtrl.selectedIndex}");
                      Get.offAll(() => LoginScreen());
                    }
                    indexCtrl.pageName = e.value["title"].toString();
                    indexCtrl.update();
                  })
                  .decorated(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.r6)),
                      color: indexCtrl.selectedIndex == e.key
                              ? appCtrl.appTheme.primary
                              : indexCtrl.isHover &&
                                      indexCtrl.isSelectedHover == e.key
                                  ? appCtrl.appTheme.primary
                                  : appCtrl.appTheme.blackText)
                  .paddingSymmetric(
                      horizontal: Insets.i15, vertical: Insets.i8));
        }).toList()
      ]);
    });
  }
}
