
filepath='Home/git/universitet/eksperimental/avbildning/Lab-Avbildning/Lab-Avbildning/';

[filename,filepath,FilterIndex] = uigetfile([filepath,'*.png']);
%filename='eksptest30007.png';

%image analysis
[m,v]=image_noise_analysis(filepath,filename)