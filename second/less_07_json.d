module less_07_json;

import std.stdio;
import std.json;
import std.conv;
import std.algorithm;

void main(string[] args) {
  // parse a file or string of json into a usable structure
  string s = `{ "language": "D", "rating": 3.5, "code": "42", "list": [1 ,   2] }`;

  JSONValue j = parseJSON(s);

  // It is possible to change data:
  j["list"].array ~= JSONValue(3);

  // j and j["language"] return JSONValue,
  // j["language"].str returns a string
  writeln(j["language"].str);     // "D"
  writeln(j["rating"].floating);  // 3.5
  writeln(j["list"].array);       // [1, 2]

  writeln(j.type);         // object
  writeln(j["list"].type); // array

  // reading from file feature:
  //    string s = to!string(f.byLine.joiner("\n"));
}
