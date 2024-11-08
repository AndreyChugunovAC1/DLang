module less_13_struct_attributes;

private: // entire file is private

void main() {
  // "public"    -- by default everywhere
  // "private"   -- for module. Everyone in module still have an access
  // "protected" -- for module, but inheritor have access
  // "package"   -- private, but modules in package have an access
  // (*) inside module everything is public
  //     it balances flexibility and safety ((C) DuckDuckGo AI Chat)

  struct Struct {
    // there are 2 styles of attributing:
    // java
    private int a;
    // c++
  private:
    int b;
  }

  Struct s;
  s.a = s.b = 10; // ok, we are inside the module
}
