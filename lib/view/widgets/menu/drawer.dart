import 'package:e_plant1/controllers/auth_controller.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:e_plant1/view/widgets/menu/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Drawer1 extends StatelessWidget {

 

 AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/image_31.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 40),
              Row(
                children: [
                  Container(width: 10),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer()
                ],
              ),
              Container(height: 30),
              // Container(
              //    width: 70,
              //       height: 70,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(50)),
              //   ),
              //   child: Image.asset('assets/images/houssam.jpg',
              //       width: 70,
              //       height: 70,
              //       fit: BoxFit.cover,
              //       ),
              // ),
          CircleAvatar(
  radius: 56,
  backgroundColor: Colors.green
,
  child: 
    Padding(
      padding: const EdgeInsets.all(8), // Border radius
      child: ClipOval(child: authController.userVendor == null ?  Image.network('https://cdn0.iconfinder.com/data/icons/banking-and-finance-86/100/employee__user__avatar__man__male-1024.png') :  Image.network(idoomadsl + authController.userVendor!.avatar_url.toString()) ),
    ),
  ),
              Container(height: 5),
              GetBuilder<AuthController>(

                builder:(controller) => controller.userVendor == null ?  Text('name',
                    style: MyText.headline(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))  : Text(controller.userVendor!.firstname.toString() ,
                    style: MyText.headline(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              Container(height: 40),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                leading: Icon(Icons.home_filled, size: 20, color: Colors.white),
                minLeadingWidth: 0,
                title: Text("HOME",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  // onDrawerItemClicked("PLANTS");
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                leading: Icon(Icons.spa, size: 20, color: Colors.white),
                minLeadingWidth: 0,
                title: Text("CART",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  //  onDrawerItemClicked("PRODUCT");
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                leading:
                    Icon(Icons.local_florist, size: 20, color: Colors.white),
                minLeadingWidth: 0,
                title: Text("SEARCH",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  // onDrawerItemClicked("FLOWERS");
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                leading: Icon(Icons.settings, size: 20, color: Colors.white),
                minLeadingWidth: 0,
                title: Text("SETTINGS",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  //  onDrawerItemClicked("PROCESS");
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                leading: Icon(Icons.add_business_sharp, size: 20, color: Colors.white),
                minLeadingWidth: 0,
                title: Text("ABOUT",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  //  onDrawerItemClicked("PROCESS");
                },
              ),
              Spacer(),
              Container(
                  height: 0.5,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20)),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                title: Text("LOGOUT",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                trailing:
                    Icon(Icons.chevron_right, size: 20, color: Colors.white),
                onTap: () {
                  //  onDrawerItemClicked("EXPLORE");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
