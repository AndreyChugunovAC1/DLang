module less_04_local_functions;

alias graph = int[][];

void dfs(graph g) {
  bool[] used = new bool[g.length];

  // local grabs context (here: bool[] used)
  void _dfs(int v) {
    used[v] = true;
    foreach (int u; g[v]) {
      if (!used[u]) {
        _dfs(u);
      }
    }
  }
  // calling recursive friend:
  _dfs(0);
}

void main(string[] args) {
  dfs([[0]]);
}