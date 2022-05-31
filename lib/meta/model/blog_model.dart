class Blog {
  List<Blogs>? blogs;

  Blog({this.blogs});

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blogs {
  String? blogTitle;
  String? shortTitle;
  String? blogAuthor;
  String? blog;
  String? source;
  String? createdTime;
  String? photo;

  Blogs(
      {this.blogTitle,
      this.shortTitle,
      this.blogAuthor,
      this.blog,
      this.source,
      this.createdTime,
      this.photo});

  Blogs.fromJson(Map<String, dynamic> json) {
    blogTitle = json['blogTitle'];
    shortTitle = json['shortTitle'];
    blogAuthor = json['blogAuthor'];
    blog = json['blog'];
    source = json['source'];
    createdTime = json['createdTime'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blogTitle'] = this.blogTitle;
    data['shortTitle'] = this.shortTitle;
    data['blogAuthor'] = this.blogAuthor;
    data['blog'] = this.blog;
    data['source'] = this.source;
    data['createdTime'] = this.createdTime;
    data['photo'] = this.photo;
    return data;
  }
}
