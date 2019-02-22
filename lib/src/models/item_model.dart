class ItemModel {
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _results = List<_Result>.from(parsedJson['results'].map((result) => _Result(result)).toList());
  }

  List<_Result> get results => _results;
}

class _Result {
  String _name;
  String _url;

  _Result(result) {
    _name = result["name"];
    _url = result["url"];
  }

  String get name => _name;
  String get url => _url;
}