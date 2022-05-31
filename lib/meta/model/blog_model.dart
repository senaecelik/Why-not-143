class Blog {
  List<Blogs>? blogs;

  Blog({this.blogs});

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blogs != null) {
      data['blogs'] = blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blogs {
  String? blogTitle;
  String? blogAuthor;
  String? blog;
  String? editor;
  String? createdTime;
  String? photo;

  Blogs(
      {this.blogTitle,
      this.blogAuthor,
      this.blog,
      this.editor,
      this.createdTime,
      this.photo});

  Blogs.fromJson(Map<String, dynamic> json) {
    blogTitle = json['blogTitle'];
    blogAuthor = json['blogAuthor'];
    blog = json['blog'];
    editor = json['editor'];
    createdTime = json['createdTime'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blogTitle'] = blogTitle;
    data['blogAuthor'] = blogAuthor;
    data['blog'] = blog;
    data['editor'] = editor;
    data['createdTime'] = createdTime;
    data['photo'] = photo;
    return data;
  }
}