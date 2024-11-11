import '../../../config.dart';

class IndexDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const IndexDrawer({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Visibility(
          visible: MediaQuery.of(context).size.width <= 992,
          child: ValueListenableBuilder<bool>(
              valueListenable: indexCtrl.isOpen,
              builder: (context, value, child) {
                return MouseRegion(
                  onHover: (val) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  onExit: (exit) {
                    indexCtrl.isHover = false;
                    indexCtrl.update();
                  },
                  onEnter: (enter) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  child: Drawer(
                      backgroundColor: appCtrl.appTheme.blackText,
                      elevation: 2,
                      child: ListView(children: [
                        const VSpace(Sizes.s40),
                        /*Image.asset(imageAssets.chatifyLogo1, height: Sizes.s40)*/
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(imageAssets.logo,
                                height: Sizes.s40, fit: BoxFit.fill),
                            const HSpace(Sizes.s10),
                            Image.asset(imageAssets.logo1,
                                height: Sizes.s40, fit: BoxFit.fill),
                          ],
                        ),
                        const VSpace(Sizes.s30),
                        Divider(
                            thickness: 2,
                            color: appCtrl.appTheme.textBoxColor,
                            indent: 12,
                            endIndent: 12),
                        const VSpace(Sizes.s20),
                        DrawerList(
                          value: value,
                          scaffoldKey: scaffoldKey,
                        )
                      ])),
                );
              }));
    });
  }
}
