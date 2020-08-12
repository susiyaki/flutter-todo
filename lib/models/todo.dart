class Todo {
  final int id;
  final String title;
  final String description;
  final bool done;

  Todo({this.id, this.title, this.description, this.done});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      done: json['done'],
    );
  }
}
