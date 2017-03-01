# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the crystal internal chamber

#@key_label  "name"
#@meta_label "type"

###########################################################
[name="internal_chamber.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the internal chamber sample

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the internal chamber volume
shape_type  : string = "cylinder"

#@description The internal chamber volume radius
r           : real   = 42.999 mm

#@description The internal chambervolume Z dimension
z           : real   = 196.999 mm

############
# Material #
############

#@description The name of the material that fills the internal chamber volume
material.ref : string = "vacuum"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "yellow"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

####################
# Daughter volumes #
####################

#@description The list of daughter volumes by label
internal_item.labels : string[1] = "InternalDetectorStack"

#@description The model of the daughter volume
internal_item.model.InternalDetectorStack : string = "internal_crystal_stack.model"

#@description The placement of the daughter volume (gravity mode donc z gap = 0)
internal_item.placement.InternalDetectorStack.x : real as length = 0.0 mm
internal_item.placement.InternalDetectorStack.y : real as length = 0.0 mm
internal_item.placement.InternalDetectorStack.z.gap_mode : string = "min_to_min" 
internal_item.placement.InternalDetectorStack.z.gap_distance :real as length = 0.0 mm

###########
# Mapping #
###########

#@description The mapping directive for the "InternalDetectorStack" daughter volume
mapping.daughter_id.InternalDetectorStack   : string  = "[internal_crystal_stack.gc]"


# end 