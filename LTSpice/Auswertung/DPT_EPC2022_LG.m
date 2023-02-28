clear
filenames = ["","","","","", ""];
filenames(1,1) = 'C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG0.1n.raw';
filenames(1,2) = "C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG0.25n.raw";
filenames(1,3) = "C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG0.5n.raw";
filenames(1,4) = "C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG1n.raw";
filenames(1,5) = "C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG2n.raw";
filenames(1,6) = "C:\Users\Simon Anzer\Desktop\Elsys\170922_anzersimon_schindlertobias_ganumrichter\LTSpice\DPT\EPC\Simulationen\60u\DPT_EPC2022_LG5n.raw";



length_filenames=size(filenames,2);


%Possible searchstrings: 
%   Gate-Voltage:   V(vg) 
%   Gate-Current:   Ix(u1:GATEIN)
%   Drain-Voltage:  V(vd)
%   Drain-Current:  Ix(u1:DRAININ)

searchstring = 'Ix(u1:DRAININ)';
startvalue= 2.995e-05;
stopvalue= 3.01e-05;
figure
subplot(2,2,1)
for i=1:length_filenames
    disp(filenames(1,i));
    %struct=LTspice2Matlab(filenames(1,i));
    DPT_SpiceToMatLab(filenames(1,i), "V(vg)", startvalue, stopvalue);
end

subplot(2,2,2)
for i=1:length_filenames
    disp(filenames(1,i));
    %struct=LTspice2Matlab(filenames(1,i));
    DPT_SpiceToMatLab(filenames(1,i), "V(vd)", startvalue, stopvalue);
end

subplot(2,2,3)
for i=1:length_filenames
    disp(filenames(1,i));
    %struct=LTspice2Matlab(filenames(1,i));
    DPT_SpiceToMatLab(filenames(1,i), "Ix(u1:GATEIN)", startvalue, stopvalue);
end

subplot(2,2,4)
for i=1:length_filenames
    disp(filenames(1,i));
    %struct=LTspice2Matlab(filenames(1,i));
    DPT_SpiceToMatLab(filenames(1,i), "Ix(u1:DRAININ)", startvalue, stopvalue);
end
hold off;
 extraaxisoptions = [...
'y tick label style={/pgf/number format/.cd,scaled y ticks = false,precision=2, use comma,' ...
,'set thousands separator={},fixed,/tikz/.cd}'...
,',x tick label style={/pgf/number format/.cd,sci,sci e,'...
'scaled x ticks = true,precision=10,set decimal separator={,},'...
,'fixed,/tikz/.cd}'...
,',ylabel style={yshift=-0.2cm,font=\small}'...
,',xlabel style={font=\small}'...
,',legend style={font=\small},'...
,',legend columns=1,',...
];

cleanfigure();
matlab2tikz('Test.tikz','showInfo', false,  ...
     'width', '0.85\textwidth', 'height', '\fheight', 'extraaxisoptions', extraaxisoptions);