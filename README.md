# Matrix Multiplier on $GF(2^{8})$
> **System Semiconductor Design**

본 프로젝트는 **Galois Field $GF(2^{8})$**를 활용한 Matrix Multiplier를 설계하고 검증하는 것을 목표로 한다. 하드웨어 설계 전 알고리즘의 유효성을 검증하기 위해 Python을 활용하였으며, 최종적으로 Verilog를 통해 하드웨어 모듈을 구현하였다.

---

## 📌 Project Overview
이 하드웨어는 (1x4) 행렬과 (4x1) 행렬의 곱셈을 $GF(2^{8})$ 연산을 기반으로 수행한다.

* **입력**: 8-bit Multiplicand(A), 8-bit Multiplier(B), Reset, Clock
* **출력**: 8-bit Product
* **특징**: Carry-less Multiplication 및 Reducing Polynomial을 활용한 Modulo 연산

---

## 📖 Mathematical Theory

### 1. Galois Field $GF(2^{8})$ Arithmetic
* **Addition/Subtraction**: Bitwise XOR 연산을 통해 수행됩니다.
* **Multiplication**: Carry-less multiplication 방식을 사용하며, 차수를 낮추기 위해 Modulo 연산을 수행합니다.

### 2. Reducing Polynomial
연산 결과가 8-bit를 초과할 경우, 아래의 Reducing Polynomial을 사용하여 차수를 제한합니다:
$$X^{8} = X^{4} + X^{3} + X + 1$$
이는 2진수 `0001_1011` (16진수 `0x1B`)에 해당하며, 이를 XOR 연산하여 비트를 줄입니다.



---

## 💻 Implementation Details

### 1. Functional Verification (Python)
* Google Colab 환경에서 `gf8_mul` 및 `matrix_multiplier_gf8` 함수를 작성하였습니다.
* 하드웨어 설계 전 골든 데이터를 생성하여 Verilog 시뮬레이션 결과와 비교 검증하였습니다.

### 2. Hardware Design (Verilog)
* **`GF8_Multiplier`**: Carry-less multiplication 및 `0x1B` 기반의 overflow 처리를 담당하는 핵심 모듈입니다.
* **`Matrix_Multiplier_GF8`**: 입력을 4번에 나누어 받아 순차적으로 연산하고 최종 결과를 도출하는 Top-level 모듈입니다. 동기식 동작을 위해 Clock과 Active Low Reset 신호를 사용합니다.

---

## 📂 Directory Structure
* **`version1/`**: 행렬 곱셈기 핵심 로직 및 테스트벤치
    * `GF8_Multiplier.v`: 8비트 갈루아 필드 곱셈기
    * `Matrix_Multiplier_GF8.v`: 행렬 곱셈기 최상위 모듈
    * `tb_Matrix_Multiplier_GF8.v`: 검증용 테스트벤치
* **`version2/`**: Logic을 보다 단순히 한 모듈
    * `CarrylessMultiplier.v`
    * `GaloisMultiplier.v`

---

## 📊 Simulation Results
ModelSim을 사용하여 6가지 Golden Test Case 및 Reset 동작을 검증하였다.

* **Golden Case Verification**: 과제에서 주어진 데이터를 통해 `0x47`, `0x87` 등 정확한 결과 도출을 확인하였습니다.
* **Reset Verification**: Negative edge Reset 시 즉시 출력이 `0x00`으로 초기화되는 것을 확인하여 안정성을 검증하였습니다.
* **Accuracy**: 모든 테스트 케이스에서 Python 결과값과 Verilog 시뮬레이션 결과값이 100% 일치함을 확인하였습니다.
