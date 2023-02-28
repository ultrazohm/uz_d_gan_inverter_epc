function[]=DPT_SpiceToMatLab(filename, search, startvalue, stopvalue)

struct=LTspice2Matlab(filename);

time_array = struct.time_vect;
datapoints = struct.variable_mat;
measurement_names = struct.variable_name_list;
measurement_names =  measurement_names';

Index_search = find(ismember(measurement_names, search));
%Index_VGate = find(ismember(measurement_names, 'V(vg)'));
%Index_IGate = find(ismember(measurement_names, "Ix(u1:GATEIN)"));
%Index_IDrain = find(ismember(measurement_names, 'Ix(u1:DRAININ)'));

startpoint_30u= find(time_array > startvalue,1);
endpoint_30u = find(time_array > stopvalue,1); 
time_array_30u = time_array(:, startpoint_30u:endpoint_30u);
time_array_30u = time_array_30u -startvalue;


datapoints_30u= datapoints(:,startpoint_30u:endpoint_30u);

datapoints_searched = datapoints_30u(Index_search, :);
pre=extractBetween(filename,"EPC2022_",".raw");
disp(pre);
txt1= append(search,pre);


time_array_30u=time_array_30u*10e8;
plot(time_array_30u, datapoints_searched,'DisplayName',txt1);
hold on;
grid on;
xlim([0 150])
xlabel('Laufzeit in $ns$','interpreter','latex');
ylabel('Spannung und Strom in $V/A$','interpreter','latex');
legend;
legend('Location','southeast');