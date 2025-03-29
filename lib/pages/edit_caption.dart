import 'package:flutter/material.dart';
import 'package:insta_post/commons/common_button.dart';
import 'package:insta_post/commons/common_text.dart';
import 'package:insta_post/constants/colors.dart';
import 'package:insta_post/constants/text_styles.dart';
import 'package:insta_post/model/post.dart';

class EditCaption extends StatelessWidget {
  String data;
  int index;
  EditCaption({required this.data, required this.index, super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = data;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CommonText(
          data: "Edit Caption",
          style: styleGothicGreyLight,
          fontSize: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonButton(
              onPressed: () {
                posts[index] =
                    Post(title: posts[index].title, caption: controller.text);
                Navigator.pop(context);
              },
              text: "Save",
              fontSize: 14,
              verticalPadding: 5,
              backgroundColor: green,
              borderRadius: 500,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: controller,
          maxLines: 10,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
