# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the internal cover

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="external_cover.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the external cover of the detection unit (internal chamber and detector aluminium base)

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the volume
shape_type  : string = "polycone"

#@description The polycone build mode
build_mode  : string = "datafile"

#@description The file that contains the coordinates of the polycone
datafile          : string as path = "@edwgentiane:config/gentiane/geometry/0.1/models/Detector/external_cover_polycone.data"

#@description The rule to read the file that contains the coordinates of the polycone (z (implicit), rmin, rmax)
datafile.columns : string = "rmin_rmax"

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "aluminium"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "orange"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
