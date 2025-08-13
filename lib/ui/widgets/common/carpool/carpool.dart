import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/customwidget/text_view_helper.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import 'carpool_model.dart';

class Carpool extends StackedView<CarpoolModel> {
  const Carpool({super.key});

  @override
  Widget builder(
    BuildContext context,
    CarpoolModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          text_view_helper(
              hint: 'Search by to, from or date…',
              prefix: const Icon(Icons.search),
              onchange: (value) {
                viewModel.notifyListeners();
              },
              controller: viewModel.search),
          Expanded(
            child: FutureBuilder(
              future: ApiHelper.allcarpool(),
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
                        if (viewModel.search.text.isEmpty) {
                          return listData(viewModel, context, snapshot, index);
                        } else {
                          if (snapshot.data[index]['to'].toLowerCase().contains(
                                  viewModel.search.text.toLowerCase()) ||
                              snapshot.data[index]['form']
                                  .toLowerCase()
                                  .contains(
                                      viewModel.search.text.toLowerCase()) ||
                              snapshot.data[index]['date']
                                  .toLowerCase()
                                  .contains(
                                      viewModel.search.text.toLowerCase())) {
                            return listData(
                                viewModel, context, snapshot, index);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
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
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => viewModel.event({}, false),
      ),
    );
  }

  Widget listData(CarpoolModel viewModel, BuildContext context,
      AsyncSnapshot snapshot, int index) {
    final data = snapshot.data[index];
    return InkWell(
      onTap: () {
        if (snapshot.data[index]["uid"] !=
            viewModel.sharedpref.readString("email")) {
          viewModel.chat(snapshot.data[index]["uid"], context);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: To → From
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${data["to"]} → ${data["form"]}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    data["date"],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Tags: Seats & Charges
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text('${data["seats"]} seats'),
                    avatar: const Icon(Icons.event_seat, size: 18),
                    backgroundColor: Colors.blue.shade50,
                  ),
                  Chip(
                    label: Text('\$${data["charges"]}'),
                    avatar: const Icon(Icons.attach_money, size: 18),
                    backgroundColor: Colors.green.shade50,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Location',
                    icon:
                    const Icon(Icons.edit_location, color: Colors.blueAccent),
                    onPressed: () => viewModel.sendLocation(),
                  ),
                  snapshot.data[index]["uid"] ==
                      viewModel.sharedpref.readString("email")
                      ? ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Update',
                        icon:
                        const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () => viewModel.event(data, true),
                      ),
                      IconButton(
                        tooltip: 'Delete',
                        icon:
                        const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () =>
                            viewModel.deleteCarpool(data["_id"], context),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CarpoolModel viewModelBuilder(
    BuildContext context,
  ) =>
      CarpoolModel();
}
