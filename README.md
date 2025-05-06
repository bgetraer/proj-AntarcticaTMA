# proj-AntarcticaTMA
*This repository represents an ongoing project and is under development.*

This repository contains code and data for the analysis of Antarctic single frame trimetrogon aerial (TMA) photographs. 

Aerial photographs acquired before the mid-1970's are the only direct pre-satellite record of Antarctic coastline geometries and surface features which exist. These were used in reconaissance sketch maps and topographic maps by USGS cartographers starting in the early 1960's, and digitized in the 2000's. However, the bulk of this digital record has not been processed further. 

The aim of this project is to georeference, correct, and integrate data from the pre-satellite aerial survey missions over the Antarctic coastline, including the creation of digital image mosaics and digital elevation models. The results of this project will transform the accesiblity and utility of these data, effectively extending the observational record of critical regions of change by almost a decade.

Initial focus for this project is the Amundsen Sea Embayment, and flight lines which covered the ice shelf and lower ice stream of Pine Island Glacier in the mid 1960's. 

## Description of data 
From the [USGS Earth Resources Observation and Science Center](https://www.usgs.gov/centers/eros/science/usgs-eros-archive-aerial-photography-antarctic-single-frame-records):
> TMA photography is a system of cameras positioned to take vertical, left oblique, and right oblique images simultaneously for use in topographic mapping. The TMA images are taken along a single flight line with the oblique cameras pointed at a depression angle of 30°. Each of the three cameras has an angular field of view of 60°, which provides a 180° horizon to horizon coverage when the images are placed side-by-side. Not all flights were equipped with oblique cameras, and equipment malfunctions limited the availability of complete sets of photography.

The **Antarctic TMA** data are historical trimetrogon aerial photographs taken between 1946-2000. TMA photographs were taken as part of a series of U.S. based expeditions to Antarctica:
- Operation Highjump (U.S. Navy, 1946-1947)
- Operation Windmill (U.S. Navy, 1947-1948)
- Operation Deep Freeze I-IV (U.S. Navy, 1955–1959)
- Operation Deep Freeze 1960-present (U.S. Navy, 1960–present)

Photographs acquired before the mid-1970's are the only pre-satellite record of Antarctic coastline geometries and surface features which exist. These data were used in the creation of USGS sketch maps and topographic reconnaisance maps of the Antarctic coastline from the early 1960's onwards. The film photographs were scanned to digitial images by the USGS in June 2009, and transferred to the National Archive and Records Administration (NARA) for permanent storage. The digitial image files were transferred to the Polar Geospatial Center (PGC), an NSF research center at the University of Minnesota, which hosts the data and makes them publicly accessible.

# Data sources
1) DOI for all Antarctic Single Frame Records and USGS documentation: https://doi.org/10.5066/F7MW2FDP
2) PGC repository of scanned photograph data and meta-data: https://data.pgc.umn.edu/aerial/usgs/tma/
3) USGS flight line maps: https://libraryguides.usgs.gov/antarcticresearch/aerialphotos

# Other Antarctic single frame records
Beyond the TMA records, additional operations in Antarctica produced photographic data of interest to pre-sattelite mapping.
- Byrd's first expedition (private, 1928–1930)
- Byrd's second expedition (private, 1934)
- United States Antarctic Service Expedition (U.S. Navy, 1939–1941)
- Ronne Antarctic Research Expedition (private, 1947–1948)

These data are outside of the scope of this research project, and I have struggled to locate sources, persistent links, or documentation for them. Single frame photography from the year 1940, consistent with the United States Antarctic Service Expedition, are available on USGS Earth Explorer.

## Acknowledgments
The structure of this repository was adapted from [Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org).

## Process
- download flightline attributes into data/processed as a csv file
