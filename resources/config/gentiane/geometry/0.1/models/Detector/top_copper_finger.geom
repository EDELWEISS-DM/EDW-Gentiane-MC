# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the top copper finger

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="top_copper_finger.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the top copper finger volume
shape_type  : string = "cylinder"

#@description The top copper finger volume radius
r           : real   = 8.0 mm

#@description The top copper finger volume Z dimension
z           : real   = 42.5 mm

############
# Material #
############

#@description The name of the material that fills the top copper finger volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
