# Head-Related-Intensity-Based-Transfer-Function

This project measures the intensity vectors in three Cartesian directions in the vicinity of KEMAR's outer ears. The intensity vectors are measured by MEMS microphone pairs designed by researchers at the Australian National University (ANU).

## Key Equipment

KEMAR - Type 45 BA from GRAS Sound & Vibration.

MEMS Microphone pair - Two ICS-43432 MEMS microphones spaced 1.5 cm apart. 

<img src="https://github.com/FJWang01/Head-Related-Intensity-Based-Transfer-Function/assets/123141141/0bedb1cb-8495-4c09-9b5a-8f4769235264" width="300">

Loudspeaker - Tannoy system 600 nearfield monitor. 

Single axis rotary table driven by a servo motor. 

## Measurement setup 

### KEMAR's body rotation angle

The intensity is measured at different body rotation angles. 

In the figure, the KEMAR is facing the loudspeaker and has 0 degrees body rotation angle. The body rotation angle is sampled in 10-degree interval and the rotation direction is shown by the red arrow. 

Note that the KEMAR head and the torso are always facing the same direction, i.e., there are no relative rotations between the head and the torso. 

<img src = "https://github.com/FJWang01/Head-Related-Intensity-Based-Transfer-Function/assets/123141141/fadd39e1-1503-4e25-b671-594796c9b15e" width = "500">

### Placement of MEMS microphone pairs

The figure shows the placement of the MEMS microphone pairs and the definitions of the three Cartesian directions for each ear.

Left ear - subfigures (a), (c) and (e).

Right ear - subfigures (b), (d) and (f). 

For both ears, x direction is pointing forward along the cheek, y direction is pointing up towards to roof, z direction is pointing horizontally out from the ear. 

![MEMS_mic_placements](https://github.com/FJWang01/Head-Related-Intensity-Based-Transfer-Function/assets/123141141/99369b70-00cb-4825-9935-6e691c883dae)

### Measurement environment
AASP Lab at the ANU. The loudspeaker in the red circle plays the sine sweep signal. The single axis rotaty table in the blue rectangle controls the body rotation angle of the KEMAR. 

<img src = "https://github.com/FJWang01/Head-Related-Intensity-Based-Transfer-Function/assets/123141141/7cebc3f7-46c0-4bcc-af12-4995c5536353" width = "500">

## Processing of measurement data
First, measure the impulse response between the loudspeaker and the pair of microphones. 

* Sampling frequency - 16 kHz. 

* Original impulse response length - 89999 samples.

* Truncated impulse response length - 256 samples (index 4300 to index 4555 of the original impulse response).

Next, transform the truncated impulse responses to the frequency domain to form the transfer functions. Average the transfer functions of five measurement runs. 

Then, calculate the active intensity vector by using the cross spectrum method. For instance, in x direction

<img src = "https://github.com/FJWang01/Head-Related-Intensity-Based-Transfer-Function/assets/123141141/a797122b-90ee-4941-8ff0-f946d2097193" width = "500">

## Using the dataset
### The averaged transfer functions
The averaged transfer functions between the loudspeaker and the pair of microphones are stored in

x_axis_TFs.mat

y_axis_TFs.mat

z_axis_TFs.mat

mic_1 is the MEMS microphone further away from the USB port. mic_2 is the MEMS microphone next to the USB port.

The averaged transfer functions are of dimension 1024-by-36. 1024 is the number of frequency bins corresponding to f_vec, 36 is the number of body rotation angles from 0 degrees to 350 degrees in 10-degree intervals. 

For instance, to obtain the left ear averaged transfer function at mic_1 in the x direction when the body rotation angle is 70 degrees, first load x_axis_TFs.mat; next, use
```
left_x_mic_1_ave_TF(:, 7) 
```
to extract the data.

### The truncated impulse responses
The truncated impulse responses are stored in

x_axis_truncated_IRs.mat

y_axis_truncated_IRs.mat

z_axis_truncated_IRs.mat

The truncated impulse responses are of dimension 256-by-5-by-36. 256 is the length of the truncated impulse response, 5 is the number of measurement runs, and 36 is the number of body rotation angles from 0 degrees to 350 degrees in 10-degree intervals. 

mic_1 is the MEMS microphone further away from the USB port. mic_2 is the MEMS microphone next to the USB port.

Due to the large size, raw impulse responses between the speakers and the microphone pairs can be requested by emailing the author at frank.wang324@gmail.com . 

### Visualise the intensity
Run cal_x_axis_intensity_cpsd.m to calculate the active intensity in the x direction. 

Run cal_y_axis_intensity_cpsd.m to calculate the active intensity in the y direction. 

Run cal_z_axis_intensity_cpsd.m to calculate the active intensity in the z direction. 

