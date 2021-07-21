% Åpne videofil og vis tidssteg for tidssteg
vr = VideoReader('analyser_Isopor_kule8.mov')
currAxes = axes;
currAxes.XLim=[0 1];
i = 0;
while hasFrame(vr)
    i=i+1;
    vidFrame = readFrame(vr);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    fprintf('%d\n',i)
    pause;
end