Development of a Calibration Procedure for the EyeLink 1000 Plus Eye Tracker*


1. Objective
The presentation focuses on developing an efficient calibration procedure for the EyeLink 1000 Plus eye tracker. The goal is to optimize the system's accuracy in mapping eye positions to gaze points on a display.


2. Background
History of Eye Tracking:
  - Eye tracking has evolved with video-based systems like the EyeLink 1000 Plus, utilizing the pupil and corneal reflection (CR) technique.
  Working Principle:
  - Relies on infrared light, high-speed video cameras, and image processing.
  - Key components include a dark-bright pupil imaging technique and corneal reflection for detecting eye movement.

3. Calibration Techniques
   Thresholds:
  - Pupil and CR thresholds are adjusted (0–255 grayscale values) to identify the pupil and CR accurately.
  Calibration Models:
  - Centroid tracking (calculates the pupil center based on area) and ellipse tracking (best-fit ellipse for more precise pupil center detection).
  Validation:
  - Ensures calibration accuracy by mapping gaze points using various grid patterns (e.g., 3×3, 5×5 grids).


4. Materials and Methods
Tools:
  - Phantom eyes with known diameters (3.5mm–9mm), Vernier calipers for size measurements, laser meters for distance calculations.
  Experiment Design:
  - Participants viewed targets on a screen under controlled lighting and fixed head positions.
  - Data were processed using MATLAB for threshold optimization, downsampling (4800Hz to 500Hz), and noise reduction.
  

5. Results
Experiment 1:
  - 22 participants analyzed with a fixed 7mm pupil diameter.
  - Observed a linear relationship between pupil area and arbitrary units, confirming consistent calibration.
  Experiment 2:
  - Varied pupil-CR thresholds and distances.
  - Validated linear regression for mapping pupil area to arbitrary units for phantom eyes.
  Key Findings:
  - Pupil thresholds significantly influenced calibration accuracy, while CR thresholds had a smaller impact.
  - Larger pupil sizes corresponded to higher arbitrary units, enabling reliable calibration using a linear equation.


6. Discussion
- The study established a reliable linear model for calibration.
- Variations in head movement and individual physiology were accounted for through regression models.
- Calibration precision is vital for collecting accurate experimental data.


7. Conclusion and Future Work
  Conclusion:
  - Linear regression effectively maps pupil size to gaze points, enhancing calibration reliability.
  Future Work:
  - Automating calibration to reduce human error.
  - Integrating the EyeLink system with advanced cognitive tools for further research.
