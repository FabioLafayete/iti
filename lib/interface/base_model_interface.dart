abstract class BaseModelInterface {
  BaseModelInterface();

  BaseModelInterface fromJson(Map<String, dynamic> json);

  BaseModelInterface fromJsonArray(List<dynamic> list);

  Map<String, dynamic> toJson();
}
