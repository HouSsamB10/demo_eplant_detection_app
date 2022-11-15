import 'package:e_plant1/controllers/auth_controller.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ColorConstants.dart';
import '../../auth/login.dart';
class UserTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
  
   AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 100.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        'Settings',
                        style: theme.textTheme.headline6,
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<AuthController>(
                      builder:(controller) =>   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                         
                            const SizedBox(height: 30),
                                          controller.userVendor != null ?  Container(
                                height: 200,
                                padding: EdgeInsets.all(16),
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(8),
                                //     color: Get.isDarkMode
                                //         ? ColorConstants.gray700
                                //         : Colors.grey.shade200),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Get.isDarkMode
                                          //     ? ColorConstants.gray500
                                          //     : Colors.grey.shade300,
                                              image: DecorationImage(image: NetworkImage( idoomadsl +controller.userVendor!.avatar_url.toString()), )
                                        
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(authController.userVendor!.firstname.toString(),
                                        style: theme.textTheme.subtitle1?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22,
                                            )),
                                  ],
                                ),
                              )  :      InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Get.isDarkMode
                                        ? ColorConstants.gray700
                                        : Colors.grey.shade200),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Get.isDarkMode
                                              ? ColorConstants.gray500
                                              : Colors.grey.shade300),
                                      child: Center(
                                        child: Icon(Icons.person,
                                            size: 32, color: Colors.grey.shade500),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text("Login / Register",
                                        style: theme.textTheme.subtitle1?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blue)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text("Settings",
                                style: theme.textTheme.headline6
                                    ?.copyWith(fontWeight: FontWeight.w400)),
                            const SizedBox(height: 16),
                            _buildListTile('Appearance', Icons.dark_mode, '',
                                Colors.purple, theme,
                                onTab: () {}),
                            const SizedBox(height: 8),
                            _buildListTile('Language', Icons.language, 'Ar',
                                Colors.orange, theme,
                                onTab: () {}),
                            const SizedBox(height: 8),
                            _buildListTile(
                                'Notifications',
                                Icons.notifications_outlined,
                                '',
                                Colors.blue,
                                theme,
                                onTab: () {}),
                            const SizedBox(height: 8),
                            _buildListTile(
                                'Help', Icons.help, '', Colors.green, theme,
                                onTab: () {}),
                            const SizedBox(height: 8),
                            _buildListTile('Logout', Icons.exit_to_app, '',
                                Colors.red, theme,
                                onTab: () {
                                  authController.logout();
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }

  Widget _buildListTile(
      String title, IconData icon, String trailing, Color color, theme,
      {onTab}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: Text(title, style: theme.textTheme.subtitle1),
        trailing: Container(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trailing,
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey.shade600)),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
        onTap: onTab);
  }

  _showAppearanceModal(ThemeData theme, String current) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(16),
      height: 320,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select a Theme",
            style: theme.textTheme.subtitle1,
          ),
          SizedBox(height: 32),
          ListTile(
            leading: Icon(
              Icons.brightness_5,
              color: Colors.blue,
            ),
            title: Text("Light", style: theme.textTheme.bodyText1),
            onTap: () {},
            trailing: Icon(
              Icons.check,
              color: current == 'light' ? Colors.blue : Colors.transparent,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: Text("Dark", style: theme.textTheme.bodyText1),
            onTap: () {},
            trailing: Icon(
              Icons.check,
              color: current == 'dark' ? Colors.orange : Colors.transparent,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(
              Icons.brightness_6,
              color: Colors.blueGrey,
            ),
            title: Text("System", style: theme.textTheme.bodyText1),
            onTap: () {},
            trailing: Icon(
              Icons.check,
              color: current == 'system' ? Colors.blueGrey : Colors.transparent,
            ),
          ),
        ],
      ),
    ));
  }
}
