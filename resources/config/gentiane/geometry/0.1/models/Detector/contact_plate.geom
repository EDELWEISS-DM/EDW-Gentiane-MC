# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the lead contact plate

#@key_label  "name"
#@meta_label "type"

###########################################################################
[name="contact_plate.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the lead contact plate

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape
shape_type  : string = "tube"

#@description The inner radius
inner_r     : real   = 33.2 mm

#@description The outer radius
outer_r     : real   = 33.7 mm

#@description The Z dimension
z           : real   = 33.0 mm

#@description The start phi angle 
start_phi           : real as angle   = 0.0 degree

#@description The delta phi angle 
delta_phi           : real as angle   = 105.0 degree

############
# Material #
############

#@description The name of the material that fills the lead contact plate volume
material.ref : string = "lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0



