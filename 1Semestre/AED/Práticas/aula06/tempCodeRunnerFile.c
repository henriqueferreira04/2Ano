size_t delannoyPD(size_t m, size_t n) {
  ncall++;
  size_t mem[1+m][1+n];
  
  for (size_t i = 0; i <= m; i++) {
    for (size_t j = 0; j <= n; j++) {
      if (i == 0 || j == 0) {
        mem[i][j] = 1;
      } else {
        //prsize_tf("(%d,%d)\n", i, j);  // debuging
        assert(mem[i-1][j] > 0);
        assert(mem[i-1][j-1] > 0);
        assert(mem[i][j-1] > 0);
        nadd += 2;
        mem[i][j] = mem[i-1][j] + mem[i-1][j-1] + mem[i][j-1];
      }
    }
  }
  return mem[m][n];
}