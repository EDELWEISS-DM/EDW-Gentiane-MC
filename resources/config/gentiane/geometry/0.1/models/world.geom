# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the world (mother-of-all) volume

#@key_label  "name"
#@meta_label "type"

####################################################
[name="world" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the world logical volume

############
# Geometry #
############

### #@description The default length unit
### length_unit     : string = "mm"

#@description The name of the 3D shape of the world logical volume
shape_type  : string = "box"

#@description The world volume X dimension (box)
x         : real   = 1000.0 mm

#@description The world volume Y dimension (box)
y         : real   = 1000.0 mm

#@description The world volume Z dimension (box)
z         : real   = 1000.0 mm

############
# Material #
############

#@description The name of the material that fills the lab atmosphere
material.ref : string = "air"

###################
# Daughter volume #
###################

#@description The list of daughter volumes by labels
internal_item.labels : string[1] = "GentianeSetup"  

#@description The model of the daughter volume
internal_item.model.GentianeSetup         : string  = "gentiane_assembly.model"

#@description The placement of the daughter volume
internal_item.placement.GentianeSetup     : string  = "0 0 0 (cm)"

###########
# Mapping #
###########

#@description The mapping directive for the daughter volume
mapping.daughter_id.GentianeSetup    : string  = "[detector.gc:unit=0]"


##############
# Visibility #
##############

#@description The recommended color for the display of the world volume
visibility.color            : string  = "cyan"

#@description The visibility hidden flag for the display of the world volume
visibility.hidden           : boolean = 0

#@description The daughters' visibility hidden flag for the display
visibility.daughters.hidden : boolean = 0

