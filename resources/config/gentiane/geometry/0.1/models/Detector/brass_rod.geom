# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the brass rod

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="brass_rod.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the brass rod

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the source volume
shape_type  : string = "cylinder"

#@description The source volume radius
r           : real   = 1.0 mm

#@description The source volume Z dimension
z           : real   = 72.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "brass"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "magenta"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
