# VF_detector

This program makes classification between ventricular fibrillation (and/or ventricular tachycardia) and non-ventricular fibrillation.
Two features called leakage and count2 were extracted from ECG waveform. A LibSVM was trained to make classification on three annotated public domain ECG databases (the American Heart Association Database, the Creighton University Ventricular Tachyarrhythmia Database, and the MIT-BIH Malignant Ventricular Arrhythmia Database).

To run the program, call VF_Classification('recordname') in Matlab.

Please cite this publication when referencing this program:

Q Li, C Rajagopalan, GD Clifford, Ventricular fibrillation and tachycardia classification using a machine learning approach, IEEE Transactions on Biomedical Engineering, 61 (6), 1607-1613, 2014.
