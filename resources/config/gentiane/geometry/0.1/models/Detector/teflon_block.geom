# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the teflon block

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="teflon_block.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the teflon block

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the volume
shape_build_mode  : string = "factory"

#@description List of needed 3D shapes
shapes.names  : string[2] = "base" "hole"
shapes.shape_type.base : string = "geomtools::cylinder"
shapes.params.base.r : real as length = 16.0 mm
shapes.params.base.z : real as length = 27.0 mm
shapes.shape_type.hole : string = "geomtools::cylinder"
shapes.params.hole.r : real as length = 1.0 mm
shapes.params.hole.z : real as length = 10.0 mm

#@description Extrusion of the hole from the base
shape_type : string = "geomtools::subtraction_3d"
shape.first_shape.name		: string = "base"
shape.second_shape.name	: string = "hole"
shape.second_shape.placement : string = "0.0 0.0 13.5 (mm)"

#@description Stackable data for this specific shape
shape.enforce_stackable_data : boolean = true
shape.stackable.xmin : real as length = -16.0 mm
shape.stackable.xmax : real as length = +16.0 mm
shape.stackable.ymin : real as length = -16.0 mm
shape.stackable.ymax : real as length = +16.0 mm
shape.stackable.zmin : real as length = -13.5 mm
shape.stackable.zmax : real as length = +8.5 mm


############
# Material #
############

#@description The name of the material that fills the teflon block
material.ref : string = "teflon"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
