pkg -forge install netcdf
pkg load netcdf
test_netcdf()
#file = netcdf_getVar('OMI-Aura_L3-OMNO2d_2020m0302_v003-2020m0611t081013.he5.nc4', 'data')
ncdisp('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4')
NO2 = ncread('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'ColumnAmountNO2TropCloudScreened');
dims = size(NO2)
imagesc(NO2)