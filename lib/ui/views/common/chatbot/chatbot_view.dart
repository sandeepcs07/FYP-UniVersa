import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/customwidget/text_view_helper.dart';

import 'chatbot_viewmodel.dart';

class ChatbotView extends StackedView<ChatbotViewModel> {
  ChatbotView({Key? key}) : super(key: key);

  List<String> q = ["Hy", "How are you?"];
  List<String> a = ["Hi, how can i help you", "I am fine"];
  List<String> r = [];

  @override
  Widget builder(
    BuildContext context,
    ChatbotViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: text_helper(data: "Chat Bot", fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
            child: Column(
          children: [
            text_helper(data: 'Chat is not saved'),
            Expanded(
                child: ListView.builder(
              itemCount: r.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: text_helper(
                    data: r[index],
                    color: black,
                    textAlign: TextAlign.start,
                  ),
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: text_view_helper(
                          hint: "Enter Message", controller: viewModel.t)),
                  InkWell(
                    onTap: () {
                      String rr = "";
                      for (int i = 0; i < q.length; i++) {
                        if (viewModel.t.text
                            .toLowerCase()
                            .contains(q[i].toLowerCase())) {
                          rr = a[i];
                          break;
                        } else {
                          rr = "I don't understand";
                        }
                      }
                      r.add(rr);
                      viewModel.t.clear();
                      viewModel.notifyListeners();
                    },
                    child: const CircleAvatar(child: Icon(Icons.send)),
                  )
                ],
              ),
            )
          ],
        )));
  }

  @override
  ChatbotViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatbotViewModel();
}
