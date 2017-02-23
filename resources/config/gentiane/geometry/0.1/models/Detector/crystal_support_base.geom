# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the crystal support base

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="crystal_support_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the crystal support base

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the volume
shape_type  : string = "tube"

#@description The inner radius
inner_r     : real   = 10.0 mm

#@description The outer radius
outer_r     : real   = 29.0 mm

#@description The Z dimension
z           : real   = 14.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "teflon"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
