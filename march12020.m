pkg -forge install netcdf
pkg load netcdf
test_netcdf()
#file = netcdf_getVar('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'data')
ncdisp('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4')
NO2 = ncread('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'ColumnAmountNO2TropCloudScreened');
dims = size(NO2)
imagesc(NO2)
contourf(NO2.data);
colormap(jet);
colorbar();
coor = NO2.bbox
NO2_lon(:,1)
NO2_lat(:,2)
dif_lat = NO2_lat(2)-NO2_lat(1)
dif_lon = NO2_lon(2)-NO2_lon(1)
preci_size = size(preci)
delta_lat = dif_lat/(preci_size(1)-1)
delta_lon = dif_lon/preci_size(2)-1
new_lat_vect = NO2_lat(1):delta_lat:NO2_lat(2);
new_lon_vect = NO2_lon(1):delta_lon:NO2_lon(2);
[lon,lat] = meshgrid(new_lon_vect,new_lat_vect);
contourf(lon,lat,preci);
colormap(jet);
colorbar();
