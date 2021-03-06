# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the sample

#@key_label  "name"
#@meta_label "type"

# ###########################################################
# [name="sample.model" type="geomtools::simple_shaped_model"]

# #@config The list of properties to configure the source sample

# ############
# # Geometry #
# ############

# ### #@description The default length unit
# ### length_unit : string = "mm"

# #@description The name of the 3D shape of the source volume
# shape_type  : string = "cylinder"

# #@description The source volume radius
# r           : real   = 25.0 mm

# #@description The source volume Z dimension
# z           : real   = 5.0 mm

###########################################################
[name="sample.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample for run 1471 Gentiane

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the source volume
shape_type  : string = "box"

#@description The source volume X dimension 
x           : real as length   = 49.0 mm

#@description The source volume Y dimension 
y           : real as length   = 60.0 mm

#@description The source volume Z dimension
z           : real as length  = 0.5 mm


# ###########################################################
# [name="sample.model" type="geomtools::simple_shaped_model"]

# #@config The list of properties to configure the source sample for run 1472 Gentiane

# ############
# # Geometry #
# ############

# ### #@description The default length unit
# ### length_unit : string = "mm"

# #@description The name of the 3D shape of the source volume
# shape_type  : string = "box"

# #@description The source volume X dimension 
# x           : real as length   = 50.0 mm

# #@description The source volume Y dimension 
# y           : real as length   = 61.0 mm

# #@description The source volume Z dimension
# z           : real as length  = 1.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "sample_material"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
