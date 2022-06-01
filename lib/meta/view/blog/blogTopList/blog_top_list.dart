import 'package:flutter/material.dart';
import 'package:why_not_143_team/core/services/resource/blog_service.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/model/blog_model.dart';
import 'package:why_not_143_team/meta/view/blog/blog_detail.dart';
import 'package:why_not_143_team/meta/view/blog/blogTopList/blog_top_list_item.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';

class BlogTopList extends StatefulWidget {
  const BlogTopList({Key? key}) : super(key: key);
  @override
  State<BlogTopList> createState() => _BlogTopListState();
}

class _BlogTopListState extends State<BlogTopList> {
  late Future<List<Blogs>> _blogList;
  @override
  void initState() {
    _blogList = BlogApi.getBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Blogs>>(
        future: _blogList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Blogs> _myList = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _myList.length,
              itemBuilder: (context, index) {
                var blog = _myList[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BlogDetailPage(blog: blog)));
                    },
                    child: BlogTopListItem(blogs: blog));
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(StringConstant.instance.errorMess),
            );
          } else {
            return const Center(
              child: CustomCircular(),
            );
          }
        });
  }
}
