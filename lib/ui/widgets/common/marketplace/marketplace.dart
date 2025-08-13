import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'marketplace_model.dart';

class Marketplace extends StackedView<MarketplaceModel> {
  const Marketplace({super.key});

  @override
  Widget builder(
    BuildContext context,
    MarketplaceModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiHelper.allmarket(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString() == '[]') {
              return Center(
                child: text_helper(data: "No Data"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return listdata(viewModel, context, snapshot, index);
                },
              );
            }
          } else if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else {
            return displaysimpleprogress(context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => viewModel.event({}, false),
      ),
    );
  }

  Widget listdata(MarketplaceModel viewModel, BuildContext context,
      AsyncSnapshot snapshot, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                spreadRadius: 1,
                blurRadius: 1,
                color: getColorWithOpacity(black, 0.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: snapshot.data[index]['img'],
            imageBuilder: (context, imageProvider) => Container(
              width: screenWidth(context),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => displaysimpleprogress(context),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
          verticalSpaceSmall,
          text_helper(
            data: snapshot.data[index]['title'],
            fontWeight: FontWeight.bold,
          ),
          text_helper(
            data: snapshot.data[index]['des'],
            textAlign: TextAlign.start,
          ),
          verticalSpaceMedium,
          FutureBuilder(
            future: ApiHelper.findone(snapshot.data[index]['uid']),
            builder: (BuildContext context, AsyncSnapshot snapshot2) {
              if (snapshot2.hasData) {
                if (snapshot2.data.toString() == '[]') {
                  return Center(
                    child: text_helper(data: "No Data"),
                  );
                } else {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: snapshot2.data['img'],
                          imageBuilder: (context, imageProvider) => Container(
                            width: screenWidthCustom(context, 0.13),
                            height: screenWidthCustom(context, 0.13),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              displaysimpleprogress(context),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text_helper(
                            data: snapshot2.data["name"],
                            size: fontSize10,
                            fontWeight: FontWeight.bold,
                          ),
                          text_helper(
                            data: snapshot2.data["number"],
                            size: fontSize10,
                          ),
                          text_helper(
                            data: snapshot2.data["email"],
                            size: fontSize10,
                          ),
                        ],
                      )
                    ],
                  );
                }
              } else if (snapshot2.hasError) {
                return const Icon(
                  Icons.error,
                );
              } else {
                return displaysimpleprogress(context);
              }
            },
          ),
          verticalSpaceMedium,
          viewModel.sharedpref.readString("email") !=
                  snapshot.data[index]['uid']
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    button_helper(
                        onpress: () async {
                          displayprogress(context);
                          await ApiHelper.deletemarket(
                              snapshot.data[index]['_id'], context);
                          hideprogress(context);
                          viewModel.notifyListeners();
                        },
                        child: text_helper(data: "Delete")),
                    button_helper(
                        onpress: () =>
                            viewModel.event(snapshot.data[index], true),
                        child: text_helper(data: "update")),
                  ],
                )
        ],
      ),
    );
  }

  @override
  MarketplaceModel viewModelBuilder(
    BuildContext context,
  ) =>
      MarketplaceModel();
}
