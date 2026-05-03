# Sistema ROM-RAM con FSM en VHDL

**Universidad del Cauca 
**Autor:** Andrés Luna (AndresL2525)  
**Fecha:** Mayo 2026

---

## 📌 Descripción

Este proyecto implementa en VHDL un sistema digital que integra una **memoria ROM** (con datos predefinidos), una **memoria RAM** (lectura/escritura) y una **máquina de estados finitos (FSM)** que automatiza el proceso de copiar el contenido de la ROM hacia la RAM y luego mostrar cada dato en dos displays de 7 segmentos (nibble alto y bajo).

El diseño es completamente modular: incluye un paquete de tipos, componentes independientes y un testbench avanzado con aserciones automáticas. La FSM maneja explícitamente la latencia de las memorias síncronas mediante estados de espera, garantizando la correcta temporización.

---

## ✅ Cumplimiento del enunciado

| Requisito | Cómo se cumple en este proyecto |
|-----------|----------------------------------|
| **Diseñar e implementar en VHDL un sistema digital** | Todo el código está escrito en VHDL, sintetizable y simulado. |
| **Integre una memoria ROM con datos predefinidos** | `rom.vhd` contiene una constante `ROM_DATA` con 16 bytes predefinidos (ejemplo: 0xAA, 0xBB,...). |
| **Integre una memoria RAM con capacidad de lectura y escritura** | `ram.vhd` implementa una RAM síncrona de 16x8 con señales `we` (escritura) y `re` (lectura). |
| **Controladas por una lógica secuencial** | `memory_controller.vhd` implementa una **máquina de estados finitos (FSM) de 9 estados** tipo Moore. |
| **Permitir leer datos desde la ROM** | La FSM activa `rom_re` y espera la latencia para capturar `rom_data`. |
| **Almacenarlos en la RAM** | La FSM activa `ram_we` y escribe `rom_data_reg` en la misma dirección. |
| **Posteriormente recuperarlos para su visualización** | La FSM lee la RAM (`ram_re`), espera su latencia y envía el dato a `display_data`. |
| **Diseño modular** | Cada módulo está en un archivo independiente: `rom.vhd`, `ram.vhd`, `memory_controller.vhd`, `freq_divider.vhd`, `seg7_decoder.vhd`, `memory_system_top.vhd`. |
| **Incluir al menos un paquete** | `mem_pkg.vhd` define `DATA_WIDTH`, `ADDR_WIDTH`, `MEM_DEPTH` y los tipos `data_word`, `addr_word`. |
| **Incluir los componentes de memoria** | `rom.vhd` y `ram.vhd` son componentes de memoria separados y reutilizables. |
| **Testbench que valide su funcionamiento bajo diferentes condiciones** | `tb_memory_system.vhd` incluye pruebas de: reset inicial, copia ROM→RAM, verificación real del display, persistencia tras reset, múltiples resets consecutivos, con aserciones automáticas. |

---

## 🧠 Características

- Memoria ROM de 16x8 bits con datos iniciales fijos.
- Memoria RAM de 16x8 bits, inicializada en cero.
- Controlador FSM de 9 estados (Moore) que gestiona la secuencia:
  1. Leer dirección actual desde ROM.
  2. Esperar latencia de ROM (2 ciclos).
  3. Escribir el dato en la misma dirección de RAM.
  4. Leer el dato desde RAM.
  5. Esperar latencia de RAM (2 ciclos).
  6. Mostrar el dato en displays 7 segmentos.
  7. Pasar a la siguiente dirección (0..15) y repetir.
- Decodificador de 7 segmentos (activo bajo) para visualización de dos dígitos hexadecimales.
- Divisor de frecuencia (50 MHz → ~1 Hz) para visualización en FPGA.
- Testbench con pruebas de:
  - Copia automática ROM → RAM.
  - Verificación del dato real mostrado (patrón 7 segmentos).
  - Persistencia de datos tras reset (la RAM no se borra).
  - Múltiples resets consecutivos (robustez de la FSM).

---

## 📂 Estructura del repositorio
VHDLPrubea/
├── README.md
├── .gitignore
├── dec_7seg.vhd # Decodificador de 7 segmentos
├── divisor_frecuencia.vhd # Divisor de 50 MHz a 1 Hz
├── mem_pkg.vhd # Paquete con constantes y tipos
├── memory_controller.vhd # FSM principal
├── memory_system_top.vhd # Módulo top
├── ram_sincrona.vhd # RAM síncrona de 16x8
├── rom_sync.vhd # ROM síncrona de 16x8
└── tb_memory_system.vhd # Testbench avanzado
