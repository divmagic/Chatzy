import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../config.dart';

class AllTextBoxDesktop extends StatelessWidget {
  const AllTextBoxDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(builder: (settingCtrl) {
      return SizedBox(
        child: Column(
          children: [
            SmoothContainer(
              width: MediaQuery.of(context).size.width,
              //margin: const EdgeInsets.symmetric(horizontal: Insets.i20),
              padding: const EdgeInsets.symmetric(vertical: Insets.i15,horizontal: Insets.i20),
              color: appCtrl.appTheme.primary.withOpacity(.08),
              smoothness: 1,
              borderRadius: BorderRadius.circular(6),
              child: Row(
                children: [
                  Icon(Icons.circle,color: appCtrl.appTheme.primary,size: Sizes.s10,),
                  const HSpace(Sizes.s15),
                  Text(
                    fonts.credential.tr,
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: appCtrl.appTheme.primary),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DesktopTextFieldCommon(
                          validator: (number) =>
                              Validation().statusValidation(number),
                          title: fonts.rateApp,
                          controller: settingCtrl.txtRateApp),
                      const VSpace(Sizes.s30),
                      DesktopTextFieldCommon(
                          validator: (number) =>
                              Validation().statusValidation(number),
                          title: fonts.rateAppIos,
                          controller: settingCtrl.txtRateAppIos),
                      const VSpace(Sizes.s30),

                      DesktopTextFieldCommon(
                          validator: (number) =>
                              Validation().statusValidation(number),
                          title: fonts.gifApi,
                          controller: settingCtrl.txtGif),
                      const VSpace(Sizes.s30),
                    ],
                  ).marginOnly(top: Insets.i15),
                ),
                const HSpace(Sizes.s30),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DesktopTextFieldCommon(
                              validator: (number) =>
                                  Validation().broadCastValidation(number),
                              title: fonts.approvalMessage,
                              controller: settingCtrl.approvalMessage),
                          const VSpace(Sizes.s30),
                          DesktopTextFieldCommon(
                              validator: (number) =>
                                  Validation().broadCastValidation(number),
                              title: fonts.maintenanceMessage,
                              controller: settingCtrl.maintenanceMessage),
                          const VSpace(Sizes.s30),

                          DesktopTextFieldCommon(
                              validator: (number) =>
                                  Validation().statusValidation(number),
                              title: fonts.firebaseServerToken,
                              controller: settingCtrl.txtFirebaseToken),
                          const VSpace(Sizes.s30),
                        ]).marginOnly(top: Insets.i15)),
              ],
            ),
          ],
        ).paddingAll(Insets.i30),
      ).boxExtension().marginOnly(top: Insets.i15);
    });
  }
}
