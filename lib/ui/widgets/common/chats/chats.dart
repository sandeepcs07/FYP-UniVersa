import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/customwidget/button_helper.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/ui_helpers.dart';
import 'package:unievents/ui/widgets/common/makegroup/makegroup.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import 'chats_model.dart';

class Chats extends StackedView<ChatsModel> {
  const Chats({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChatsModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            text_helper(data: "All Groups"),
            verticalSpaceTiny,
            SizedBox(
              width: screenWidth(context),
              height: 150,
              child: FutureBuilder(
                future: ApiHelper.allgroup(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString() == '[]') {
                      return const Center(
                        child: Text("No Data"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => viewModel.chat(
                                snapshot.data[index]['_id'], context),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber[100],
                              ),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: snapshot.data[index]['img'],
                                    imageBuilder: (context, imageProvider) =>
                                        ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        width: screenWidthCustom(context, 0.15),
                                        height:
                                            screenWidthCustom(context, 0.15),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        displaysimpleprogress(context),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  text_helper(
                                    data: snapshot.data[index]['title']
                                        .toString(),
                                    size: fontSize14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            verticalSpaceTiny,
            text_helper(data: "All Chats"),
            verticalSpaceTiny,
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.allchatbydid(
                    viewModel.sharedpref.readString("email")),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString() == '[]') {
                      return const Center(
                        child: Text("No Data"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              if (snapshot.data[index]['status'] == "true") {
                                viewModel.move(snapshot.data[index]['_id'],
                                    snapshot.data[index]['did']);
                              } else {
                                show_snackbar(context, "Wait for approval");
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green[100],
                              ),
                              child: FutureBuilder(
                                future: ApiHelper.findone(
                                    snapshot.data[index]['uid']),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot2) {
                                  if (snapshot2.hasData) {
                                    return Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: snapshot2.data['img'],
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(
                                              width: screenWidthCustom(
                                                  context, 0.1),
                                              height: screenWidthCustom(
                                                  context, 0.1),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              displaysimpleprogress(context),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                          ),
                                        ),
                                        horizontalSpaceSmall,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            text_helper(
                                              data: snapshot2.data['name']
                                                  .toString(),
                                              size: fontSize14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            text_helper(
                                              data: snapshot.data[index]['date']
                                                  .toString()
                                                  .substring(0, 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else if (snapshot2.hasError) {
                                    return const Icon(
                                      Icons.error,
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showdialog(context, viewModel),
        child: const Icon(Iconsax.message),
      ),
    );
  }

  void showdialog(BuildContext context, ChatsModel viewModel) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpaceSmall,
                    text_helper(
                        data: "Chat Type",
                        size: fontSize24,
                        fontWeight: FontWeight.bold),
                    verticalSpaceSmall,
                    button_helper(
                        onpress: () => viewModel.user("Student"),
                        width: screenWidth(context),
                        child: text_helper(data: "Students")),
                    button_helper(
                        onpress: () => viewModel.user("Teacher"),
                        width: screenWidth(context),
                        child: text_helper(data: "Teachers")),
                    button_helper(
                        onpress: () {
                          Navigator.pop(context);
                          group(context, viewModel);
                        },
                        width: screenWidth(context),
                        child: text_helper(data: "Group")),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ));
  }

  void group(BuildContext context, ChatsModel viewModel) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
                child: const Makegroup(),
              ),
            ));
  }

  @override
  ChatsModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatsModel();
}
