pkg -forge install netcdf
pkg load netcdf
test_netcdf()
#file = netcdf_getVar('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'data')
ncdisp('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4')
NO2 = ncread('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'ColumnAmountNO2TropCloudScreened');
dims = size(NO2)
imagesc(NO2)
pcolor(NO2)
dataNO2 = ncread(filename,'integrated_N2O');
% they seem to have made the missing data value a really big value
minval = min(dataCO(:));
dataNO2(dataNO2 == max(dataNO2(:))) = -300;
maxval = max(dataNO2(:));
fprintf(1,'minval = %f\n',minval);
fprintf(1,'maxval = %f\n',maxval);
minval = 2e-4;
maxval = 67e-4;
m = 63/(maxval-minval);
b = -m*minval;
scaleddataN02 = uint8(m*dataCO+b);
scaleddataNO2(dataNO2<0) = nan; % missing data
colorvals = colormap(jet);
lat = ncread(filename,'lat');
lon = ncread(filename,'lon');
[ny,nx] = size(dataNO2);
figure()
hold on
for i = 1:64
    idx = find(scaleddataNO2 == i);
    plot(lon(idx),lat(idx),'s', 'markerfacecolor',colorvals(i,:),'markeredgecolor','none');
end
xlim([-180 180])
ylim([-90 90]);
axis equal
axis tight
set(gca,'ytick',[-90 -60 -30 0 30 60 90]);
set(gca,'xtick',[-180 -150 -120 -90 -60 -30 0 30 60 90 120 150 180]);
grid on
box on
title('Integrated NO2 10^{-4} kg/m^2');
colormap(jet)
hb = colorbar;
hb.Ticks = [0 0.2 0.4 0.6 0.8 1];
vals = linspace(2,67,6);
for j = 1:length(vals)
hb.TickLabels{j} = num2str(vals(j));
end




