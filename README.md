# VF_detector

Current release: version 0.0.1

Last updated June 27, 2013

This program makes classification between ventricular fibrillation (and/or ventricular tachycardia) and non-ventricular fibrillation.
Two features called leakage and count2 were extracted from ECG waveform. A SVM classifier (LIBSVM 3.11, http://www.csie.ntu.edu.tw/~cjlin/libsvm/) was trained and tested to make classification on three annotated public domain ECG databases (the American Heart Association Database, the Creighton University Ventricular Tachyarrhythmia Database, and the MIT-BIH Malignant Ventricular Arrhythmia Database).

This program need the support of The WFDB Toolbox for MATLAB (http://physionet.org/physiotools/matlab/wfdb-app-matlab/) to read WFDB format data and the support of LIBSVM 3.11 (included, http://www.csie.ntu.edu.tw/~cjlin/libsvm/)

To run the program, call VF_Classification('recordname') in Matlab, e.g. VF_output = VF_Classification('cu01')

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

Please cite this publication when referencing this program:

Q Li, C Rajagopalan, GD Clifford, Ventricular fibrillation and tachycardia classification using a machine learning approach, IEEE Transactions on Biomedical Engineering, 61 (6), 1607-1613, 2014.
