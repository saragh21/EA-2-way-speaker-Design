#  2-Way Loudspeaker Project – Aalto University (ELEC-E5650)
21.05.2025 by Sara Ghorbani
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

2. Simulation Crossover Filter (VituixCad): We designed a **2nd-order Butterworth crossover** (12 dB/octave slope) using textbook formulas for passive filters. These components were implemented in VituixCAD and simulated using the measured/simulated responses of the woofer and tweeter.
 
Target Parameters:
- Crossover frequency: **fc = 3000 Hz**
- Woofer impedance: **R1 = 8 Ω**
- Tweeter impedance: **R2 = 4 Ω**

### Formulas for Butterworth 2nd-Order Crossover:

#### Woofer (Low-Pass Section)
- Series **inductor**:
  \[
  L = \frac{0.3183 \cdot R}{2 \pi f_c}
  \]
- Shunt **capacitor**:
  \[
  C = \frac{0.2251}{2 \pi f_c \cdot R}
  \]
 
#### Tweeter (High-Pass Section)
- Series **capacitor**:
  \[
  C = \frac{0.2251}{2 \pi f_c \cdot R}
  \]
- Shunt **inductor**:
  \[
- \( L = \frac{0.3183 \cdot 8}{2\pi \cdot 3000} \approx 0.135\,\text{mH} \)

### Calculated Component Values:

| Section   | Component | Value       | Notes              |
|-----------|-----------|-------------|--------------------|
| Woofer LP | L         | 0.135 mH    | Series inductor    |
| Woofer LP | C         | 1.5 µF      | Shunt capacitor    |
| Tweeter HP| C         | 3.0 µF      | Series capacitor   |
| Tweeter HP| L         | 0.068 mH    | Shunt inductor     |


These values were entered into the crossover schematic in VituixCAD and tested with the simulated box response of each driver.



3. Digital Crossover Filter (MATLAB)
- Crossover frequency: 3 kHz
- Implemented in two methods:
  - 2nd-order Butterworth IIR filters
  - Linear-phase FIR filters (100 taps)
- Separate filtering for woofer (low-pass) and tweeter (high-pass)
- Optional tweeter gain padding for level matching
- Includes code to visualize magnitude response (linear + log scale)
- Passive LCR equivalent circuit documented
   
4. Measurements & Evaluation
- Simulated SPL, directivity, group delay, and impedance using VituixCAD
- Digital crossover applied to real measurements and test signals at Aalto Acoustics lab
- Final system tested in anechoic conditions

---

 

