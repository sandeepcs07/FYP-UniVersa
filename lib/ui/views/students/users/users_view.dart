import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/ui_helpers.dart';

import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  UsersView({Key? key, required this.cat}) : super(key: key);
  String cat = "";

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: white),
          title: text_helper(
            data: "Users",
            color: white,
            fontWeight: FontWeight.bold,
            size: fontSize20,
          ),
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: ApiHelper.allusers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.toString() == '[]') {
                return const SizedBox.shrink();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data[index]['cat'] == cat) {
                      if (snapshot.data[index]['email'] !=
                          viewModel.sharedpref.readString("email")) {
                        return listdata(context, snapshot, index, viewModel);
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
              }
            } else if (snapshot.hasError) {
              return const Icon(
                Icons.error,
              );
            } else {
              return displaysimpleprogress(context);
            }
          },
        )));
  }

  Widget listdata(BuildContext context, AsyncSnapshot snapshot, int index,
      UsersViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.chat(snapshot.data[index]['email'],
          snapshot.data[index]['cat'] != "Teacher" ? "false" : "true", context),
      child: Container(
        width: screenWidth(context),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: getColorWithOpacity(Theme.of(context).primaryColor, 0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: snapshot.data[index]['img'],
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: screenWidthCustom(context, 0.1),
                  height: screenWidthCustom(context, 0.1),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => displaysimpleprogress(context),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
            ),
            horizontalSpaceMedium,
            text_helper(
              data: snapshot.data[index]['name'],
              fontWeight: FontWeight.bold,
              size: fontSize22,
            ),
            text_helper(
              data: snapshot.data[index]['email'],
            ),
            text_helper(
              data: snapshot.data[index]['cat'],
            ),
          ],
        ),
      ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersViewModel();
}
