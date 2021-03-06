import numpy as np
from netCDF4 import Dataset
import matplotlib.pyplot as plt
import cartopy.crs as ccrs

data = Dataset('OMI-Aura_L3-OMNO2d_2020m0301_v003-2020m0611t080447.he5.nc4', mode='r')

print(data)

lons = data.variables['lon'][:]
lats = data.variables['lat'][:]
NO2 = data.variables['ColumnAmountNO2TropCloudScreened'][:,:]

# Set the figure size, projection, and extent
fig = plt.figure(figsize=(8,4))
ax = plt.axes(projection=ccrs.Robinson())
ax.set_global()
ax.coastlines(resolution="110m",linewidth=1)
ax.gridlines(linestyle='--',color='black')

# Set contour levels, then draw the plot and a colorbar
clevs = np.arange(230,311,5)
plt.contourf(lons, lats, NO2, clevs, transform=ccrs.PlateCarree(),cmap=plt.cm.jet)
plt.title('NO2_concentrations, March 2020', size=14)
cb = plt.colorbar(ax=ax, orientation="vertical", pad=0.02, aspect=16, shrink=0.8)
cb.set_label('K',size=12,rotation=0,labelpad=15)
cb.ax.tick_params(labelsize=10)

fig.savefig('NO2_concentrations.png', format='png', dpi=360)

print(data.ncattrs)

print(data)

print(data.variables['ColumnAmountNO2TropCloudScreened'])