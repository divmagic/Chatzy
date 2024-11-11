import 'package:chatzy_admin/models/usage_control_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../config.dart';

class UsageControlDesktop extends StatelessWidget {
  final UsageControlModel? usageControlModel;

  const UsageControlDesktop({Key? key, this.usageControlModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (usageCtrl) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmoothContainer(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: Insets.i20),
              padding: const EdgeInsets.symmetric(
                  vertical: Insets.i15, horizontal: Insets.i20),
              color: appCtrl.appTheme.primary.withOpacity(.08),
              smoothness: 1,
              borderRadius: BorderRadius.circular(6),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: appCtrl.appTheme.primary,
                    size: Sizes.s10,
                  ),
                  const HSpace(Sizes.s15),
                  Text(
                    fonts.usageOption.tr,
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: appCtrl.appTheme.primary),
                  ),
                ],
              ),
            ),
            const VSpace(Sizes.s20),
            IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.allowCreatingBroadcast,
                              value: usageControlModel!.allowCreatingBroadcast,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "allowCreatingBroadcast", val)),
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.allowCreatingGroup,
                              value: usageControlModel!.allowCreatingGroup,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "allowCreatingGroup", val)),
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.allowCreatingStatus,
                              value: usageControlModel!.allowCreatingStatus,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "allowCreatingStatus", val)),
                        ]),
                  ),
                 Image.asset(imageAssets.line,height: Sizes.s140,fit: BoxFit.fill,)
                      .paddingSymmetric(horizontal: Insets.i30),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.callsAllowed,
                              value: usageControlModel!.callsAllowed,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "callsAllowed", val)),
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.existenceUser,
                              value: usageControlModel!.existenceUsers,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "existenceUsers", val)),
                          DesktopSwitchCommon(
                              isDivider: true,
                              title: fonts.mediaSendAllowed,
                              value: usageControlModel!.mediaSendAllowed,
                              onChanged: (val) => usageCtrl.onChangeSwitcher(
                                  "mediaSendAllowed", val)),
                        ]),
                  ),
                      Image.asset(imageAssets.line,height: Sizes.s140,fit: BoxFit.fill,)
                          .paddingSymmetric(horizontal: Insets.i30),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesktopSwitchCommon(
                            isDivider: true,
                            title: fonts.showLogoutButton,
                            value: usageControlModel!.showLogoutButton,
                            onChanged: (val) => usageCtrl.onChangeSwitcher(
                                "showLogoutButton", val)),
                        DesktopSwitchCommon(
                            isDivider: true,
                            title: fonts.textMessageAllowed,
                            value: usageControlModel!.textMessageAllowed,
                            onChanged: (val) => usageCtrl.onChangeSwitcher(
                                "textMessageAllowed", val)),
                        DesktopSwitchCommon(
                            isDivider: true,
                            title: fonts.allowUserSignup,
                            value: usageControlModel!.allowUserSignup,
                            onChanged: (val) => usageCtrl.onChangeSwitcher(
                                "allowUserSignup", val)),
                      ],
                    ),
                  )
                ]).marginSymmetric(horizontal: Insets.i20))
          ]).marginOnly(top: Insets.i15);
    });
  }
}
