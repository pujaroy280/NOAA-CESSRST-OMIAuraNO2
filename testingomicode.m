pkg -forge install netcdf
pkg load netcdf
test_netcdf()
#file = netcdf_getVar('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'data')
ncdisp('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4')
NO2 = ncread('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', 'ColumnAmountNO2TropCloudScreened');
dims = size(NO2)
def var_data_extract(filename, var_name, lat_ind, long_ind):
    ds = nc.Dataset(filename)
    lat = ds.variables['lat'][lat_ind]
    long = ds.variables['lon'][long_ind]
    value = ds.variables[var_name][lat_ind][long_ind]  # lat, then long
    units = ds.variables[var_name].units
    print(f'Latitude: {lat}, Longitude: {long}   {var_name}: {value} {units}')
    return value
imgs = []
file = open(r'C:\Users\prati\OneDrive\Desktop\subset_OMNO2d_003_20210721_061013', 'r')
lines = file.readlines()
dirlen = len('https://acdisc.gesdisc.eosdis.nasa.gov/opendap/HDF-EOS5/Aura_OMI_Level3/OMNO2d.003/2020/')
filelen = len('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4')
for line in lines:
    file = fr'C:\Users\prati\OneDrive\Desktop\2020_year\{line[dirlen:(dirlen + filelen)]}'
    print(file)
    data, NO2 = var_data_extract(file, 'ColumnAmountNO2TropCloudScreened', 0, 0)
    imgs.append(data)
_, axs = plt.subplots(6, 6, figsize=(12, 6))
axs = axs.flatten()
for img, ax in zip(imgs, axs):
    ax.imshow(img)
plt.show()