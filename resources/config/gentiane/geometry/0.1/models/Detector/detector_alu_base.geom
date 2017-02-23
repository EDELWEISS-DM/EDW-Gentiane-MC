# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

############################################################
#@description The geometry model of the bottom copper finger

#@key_label  "name"
#@meta_label "type"

#########################################################################
[name="bottom_copper_finger.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the bottom copper finger

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the bottom copper finger volume
shape_type  : string = "cylinder"

#@description The top copper finger volume radius
r           : real   = 8.0 mm

#@description The top copper finger volume Z dimension
z           : real   = 32.5 mm

############
# Material #
############

#@description The name of the material that fills the bottom copper finger volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#########################################################################
[name="horizontal_copper_finger.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the bottom copper finger

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the bottom copper finger volume
shape_type  : string = "cylinder"

#@description The top copper finger volume radius
r           : real   = 8.0 mm

#@description The top copper finger volume Z dimension
z           : real   = 40.0 mm

############
# Material #
############

#@description The name of the material that fills the bottom copper finger volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#########################################################################
[name="bottom_detector_alu_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the detector aluminium base bottom volume

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the detector aluminium base bottom volume
shape_type  : string = "cylinder"

#@description The base of the detector aluminium base bottom radius
r           : real   = 52.0 mm

#@description The base of the detector aluminium base bottom Z dimension
z           : real   = 1.0 mm

############
# Material #
############

#@description The name of the material that fills the detector aluminium base bottom volume
material.ref : string = "aluminium"


##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#########################################################################
# The geometry model of the detector aluminium base side 
[name="side_detector_alu_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the detector aluminium base side volume

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the detector aluminium base side volume
shape_type  : string = "tube"

#@description The inner radius
inner_r     : real   = 50.0 mm

#@description The outer radius
outer_r     : real   = 52.0 mm

#@description The Z dimension
z           : real   = 61.0 mm



############
# Material #
############

#@description The name of the material that fills the detector aluminium base side volume
material.ref : string = "aluminium"


##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

######################################################################
#@description The geometry model of the detector aluminium base side 

#########################################################################
[name="top_detector_alu_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the detector aluminium base top volume

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the detector aluminium base top volume
shape_type  : string = "tube"

#@description The inner radius
inner_r     : real   = 8.0 mm

#@description The outer radius
outer_r     : real   = 52.0 mm

#@description The Z dimension
z           : real   = 1.0 mm



############
# Material #
############

#@description The name of the material that fills the detector aluminium base top volume
material.ref : string = "aluminium"


##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
#@description The stacking model of the detector aluminium base unit assembly

#####################################################################
[name="detector_alu_base.model" type="geomtools::stacked_model"]

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
stacked.number_of_items : integer = 4

#@description The name of the geometry model at stacking slot 0
stacked.model_0 : string = "bottom_detector_alu_base.model"

#@description The name of the geometry model at stacking slot 1
stacked.model_1 : string = "side_detector_alu_base.model"

#@description The name of the geometry model at stacking slot 2
stacked.model_2 : string =  "top_detector_alu_base.model"

#@description The name of the geometry model at stacking slot 3
stacked.model_3 : string = "bottom_copper_finger.model"

# #@description The stacked contact point of volume at slot 0
# stacked.limit_max_0 : real as length = -0.5 mm

# #@description The stacked contact point of volume at slot 1
# stacked.limit_max_1 : real as length = 31.0 mm

#@description The stacked contact point of volume at slot 2
stacked.limit_max_2 : real as length = -32.0 mm

# #@description The stacked contact point of volume at slot 3
# stacked.limit_max_3 : real as length = 0.0 mm	

#@description The name of the volume at stacking slot 0
stacked.label_0 : string = "BottomAluSupportBase"

#@description The name of the volume at stacking slot 1
stacked.label_1 : string = "SideAluSupportBase"

#@description The name of the volume at stacking slot 2
stacked.label_2 : string = "TopAluSupportBase"

#@description The name of the volume at stacking slot 3
stacked.label_3 : string = "BottomColdFinger"

###################
# Daughter volume #
###################

#@description The list of daughter physical volumes
internal_item.labels : string[1] = "HorizontalColdFinger"

#@description The logical volume/model associated to the physical volume
internal_item.model.HorizontalColdFinger : string = "horizontal_copper_finger.model"

#@description The position of the physical volume with respect to the mother volume
#rotation angle wrt the y axis 
#si rotation arbitraire use Euler angles zyz and write "@ phi theta psi=delta (angle unit)"
internal_item.placement.HorizontalColdFinger : string = "-28.0 0.0 +7.0 (mm) / y 90 (degree)"


############
# Material #
############

#@description The name of the material that fills the aluminium base
material.ref    : string = "vacuum"

##############
# Visibility #
##############

#@description The recommended color for the display of the mother volume
visibility.color  : string  = "grey"

###########
# Mapping #
###########

# #@description The mapping directive for the "Crystal" daughter volume
# mapping.daughter_id.Crystal   : string  = "[hpge_crystal.gc]"

# #@description The mapping directive for the "BrassRod" daughter volume
# mapping.daughter_id.BrassRod   : string  = "[brass_rod.gc]"

