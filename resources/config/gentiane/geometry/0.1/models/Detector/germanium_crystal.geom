# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the germanium crystal

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="germanium_crystal.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the germanium crystal

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the volume
shape_build_mode  : string = "factory"

#@description List of needed 3D shapes
shapes.names  : string[2] = "ge_base" "ge_hole"
shapes.shape_type.ge_base : string = "geomtools::cylinder"
shapes.params.ge_base.r : real as length = 33.0 mm
shapes.params.ge_base.z : real as length = 64.0 mm
shapes.shape_type.ge_hole : string = "geomtools::cylinder"
shapes.params.ge_hole.r : real as length = 5.0 mm
shapes.params.ge_hole.z : real as length = 64.0 mm

#@description Extrusion of the hole from the base
shape_type : string = "geomtools::subtraction_3d"
shape.first_shape.name		: string = "ge_base"
shape.second_shape.name	: string = "ge_hole"
shape.second_shape.placement : string = "0.0 0.0 -16.0 (mm)"

#@description Stackable data for this specific shape
shape.enforce_stackable_data : boolean = true
shape.stackable.xmin : real as length = -33.0 mm
shape.stackable.xmax : real as length = +33.0 mm
shape.stackable.ymin : real as length = -33.0 mm
shape.stackable.ymax : real as length = +33.0 mm
shape.stackable.zmin : real as length = +16.0 mm
shape.stackable.zmax : real as length = +32.0 mm


############
# Material #
############

#@description The name of the material that fills the crystal
material.ref : string = "germanium"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
