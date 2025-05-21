#  2-Way Loudspeaker Project – Aalto University (ELEC-E5650)
# 21.05.2025 by Sara Ghorbani
#

This project presents the design, simulation, and analysis of a 2-way passive loudspeaker system using a woofer and tweeter, including a digitally implemented crossover filter and physical enclosure design. The work was completed as part of the Electroacoustics course at Aalto University.

---

## Project Components

1. Enclosure Design (VituixCAD)
- Woofer: Dayton Audio DS115-8
- Enclosure: Vented (bass reflex), 10-liter box
- Tuning frequency: ~43 Hz
- Ports: Rear-vented, twin-port design
- Simulated using VituixCAD Enclosure Tool
- Resulting SPL, impedance, and phase responses exported to filter design

2. Digital Crossover Filter (MATLAB)
- Crossover frequency: 3 kHz
- Implemented in two methods:
  - 2nd-order Butterworth IIR filters
  - Linear-phase FIR filters (100 taps)
- Separate filtering for woofer (low-pass) and tweeter (high-pass)
- Optional tweeter gain padding for level matching
- Includes code to visualize magnitude response (linear + log scale)
- Passive LCR equivalent circuit documented

3. Measurements & Evaluation
- Simulated SPL, directivity, group delay, and impedance using VituixCAD
- Digital crossover applied to real measurements and test signals at Aalto Acoustics lab
- Final system tested in anechoic conditions

---

 

