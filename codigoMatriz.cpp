#include <cstdint>
#include <math.h>

uint64_t transfer(double **matrix1, double **matrix2, double formula,
                  uint64_t R, uint64_t C, double point) {
  if (!matrix1 && !matrix2) {
    return 0;
  }
  uint64_t states = 0;
  bool limit = true;
  while (limit) {
    limit = false;
    for (uint64_t i = 1; i < R - 1; i++) {
      for (uint64_t j = 1; j < C - 1; j++) {
        matrix1[i][j] =
            matrix2[i][j] + formula * (matrix2[i - 1][j] + matrix2[i][j + 1] +
                                       matrix2[i + 1][j] + matrix2[i][j - 1] -
                                       4 * (matrix2[i][j]));
        if ((fabs(matrix1[i][j] - matrix2[i][j]) > point)) {
          limit = true;
        }
      }
    }
    for (uint64_t i = 0; i < R - 1; i++) {
      for (uint64_t j = 0; j < C - 1; j++) {
        matrix2[i][j] = matrix1[i][j];
      }
    }
    states++;
  }
  return states;
}