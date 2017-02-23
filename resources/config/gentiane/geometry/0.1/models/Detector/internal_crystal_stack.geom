# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The stacking model of the internal crystal assembly

#@key_label  "name"
#@meta_label "type"


#####################################################################
[name="internal_crystal_stack.model" type="geomtools::stacked_model"]

############
# Geometry #
############

#@description The shape of the mother envelope
envelope_shape : string = "cylinder"

# #@description The default length unit
# length_unit : string = "mm"

#@description The stacking axis
stacked.axis    : string = "z"

#@description The number of stacked volumes
stacked.number_of_items : integer = 7

#@description The name of the geometry model at stacking slot 0
stacked.model_0 : string = "top_copper_finger.model"

#@description The name of the geometry model at stacking slot 1
stacked.model_1 : string = "crystal_support_base.model"

#@description The name of the geometry model at stacking slot 2
stacked.model_2 : string = "crystal_support.model"

#@description The name of the geometry model at stacking slot 3
stacked.model_3 : string = "teflon_block.model"

#@description The name of the geometry model at stacking slot 4
stacked.model_4 : string = "brass_rod.model"

#@description The name of the geometry model at stacking slot 5
stacked.model_5 : string = "germanium_crystal.model"

#@description The name of the geometry model at stacking slot 6
stacked.model_6 : string = "contact_plate.model"

#@description The stacked contact point of volume at slot 0
stacked.limit_max_0 : real as length = -21.25 mm

#@description The stacked contact point of volume at slot 1
stacked.limit_max_1 : real as length = -7.0 mm

#@description The stacked contact point of volume at slot 2
stacked.limit_max_2 : real as length = -5.0 mm

#@description The stacked contact point of volume at slot 3
stacked.limit_max_3 : real as length = 10.5 mm

#@description The stacked contact point of volume at slot 5
stacked.limit_max_5 : real as length = -26.5 mm

#@description The name of the volume at stacking slot 0
stacked.label_0 : string = "ColdFinger"

#@description The name of the volume at stacking slot 1
stacked.label_1 : string = "SupportBase"

#@description The name of the volume at stacking slot 2
stacked.label_2 : string = "Support"

#@description The name of the volume at stacking slot 3
stacked.label_3 : string = "TeflonBlock"

#@description The name of the volume at stacking slot 4
stacked.label_4 : string = "BrassRod"

#@description The name of the volume at stacking slot 5
stacked.label_5 : string = "Crystal"

#@description The name of the volume at stacking slot 6
stacked.label_6 : string = "LeadContactPlate"

############
# Material #
############

#@description The name of the material that fills the box
material.ref    : string = "vacuum"

##############
# Visibility #
##############

#@description The recommended color for the display of the mother volume
visibility.color  : string  = "grey"

###########
# Mapping #
###########

#@description The mapping directive for the "Crystal" daughter volume
mapping.daughter_id.Crystal   : string  = "[hpge_crystal.gc]"

#@description The mapping directive for the "BrassRod" daughter volume
mapping.daughter_id.BrassRod   : string  = "[brass_rod.gc]"
