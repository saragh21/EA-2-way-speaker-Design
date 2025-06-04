#  2-Way Loudspeaker Project – Aalto University (ELEC-E5650)
21.05.2025   
#

Sara Ghorbani: This project presents the design, simulation, and analysis of a 2-way passive loudspeaker system using a woofer and tweeter, including a digitally implemented crossover filter and physical enclosure design. The work was completed as part of the Electroacoustics course at Aalto University.

---

## Project Components

1. Enclosure Design (VituixCAD)
- Woofer: Dayton Audio DS115-8
- Enclosure: Vented (bass reflex), 10-liter box
- Tuning frequency: ~43 Hz
- Ports: Rear-vented, twin-port design
- Simulated using VituixCAD Enclosure Tool
- Resulting SPL, impedance, and phase responses exported to filter design

 
## Simulation of Passive Crossover Filters (VituixCAD)

We evaluated **three** different 2-way passive crossover topologies in VituixCAD, using our measured/simulated woofer and tweeter responses.  All assume:

- **Crossover frequency:** fc = 3000 Hz  
- **Woofer impedance:** R₁ = 8 Ω  
- **Tweeter impedance:** R₂ = 4 Ω  



### 1) Third-Order Butterworth / Butterworth (18 dB/oct)

- **Woofer:** 3rd-order low-pass Butterworth  
  
- **Tweeter:** 3rd-order high-pass Butterworth  
 
  
### 2) Linkwitz–Riley Mix: LR2 (Woofer) + LR4 (Tweeter)

- **Woofer:** 2nd-order Linkwitz–Riley low-pass (12 dB/oct)  
  – cascade of two 1st-order Butterworths at fc  
- **Tweeter:** 4th-order Linkwitz–Riley high-pass (24 dB/oct)  
  – cascade of two 2nd-order Butterworths at fc  

Linkwitz–Riley filters sum **in-phase** at fc, yielding a perfectly flat total amplitude and much better phase alignment than two Butterworths of the same order.



### 3) Mixed LR + Shelf Boost (Better Bass)

- **Tweeter:** 4th-order LR high-pass (24 dB/oct)  
- **Woofer:** 2nd-order LR low-pass (12 dB/oct) **+** 2nd-order low-shelf (+6 dB @ 100 Hz)  

The extra **shelf** stage compensates for baffle/box roll-off, extending and flattening the bass without altering the mid-range crossover.


Each topology was built in VituixCAD by dragging in capacitors, inductors and—where needed—a shelving-network (series/parallel RLC).  We then compared:

1. **SPL & summed response**  
2. **Phase / group-delay**  
3. **Directivity & CTA-2034 curves**  
4. **Impedance loading**

the filter components are calculated online by : https://goodcalculators.com/crossover-calculator/


3. Digital Crossover Filter (MATLAB)
- Crossover frequency: 3 kHz
- Three topologies coded:

3rd-order Butterworth (18 dB/oct)

Linkwitz–Riley mix (LR4 tweeter + LR2 woofer)

Mixed LR + 2nd-order low-shelf boost on woofer

- Separate filtering for woofer (low-pass) and tweeter (high-pass)

- Includes code to visualize magnitude response (log scale)

- Passive LCR equivalent circuit documented

- Final filters:
- Woofer:
  - 1x highpass shelving filter gain -22, 1 slope 1kHz fc
  - 1x lowpass 2nd order butterworth, 1,7 kHz fc
- Tweeter:
  - 1x highpass 1st order butterworth, 2 kHz fc 

**Gain**
digitally the gains for the woofer and tweeter were, 0.4 and 0.13 respectively. 
So the tweeter was attenuated by 20*log_10(0.13/0.4) = -9.7 dB
Which corresponds to L-pad circuit for a driver with impedance of 4 ohm with resistor of 2.69 ohm in series and 1.95 ohm in parallel


4. Measurements & Evaluation
- Simulated SPL, directivity, group delay, and impedance using VituixCAD
- Digital crossover applied to real measurements and test signals at Aalto Acoustics lab
- Final system tested in anechoic conditions


 

