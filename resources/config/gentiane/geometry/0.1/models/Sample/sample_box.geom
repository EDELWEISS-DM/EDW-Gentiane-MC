# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the sample box

#@key_label  "name"
#@meta_label "type"


#############################################################################
[name="sample_box_bottom.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample box bottom end

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the source volume
shape_type  : string = "cylinder"

#@description The source volume radius
r           : real   = 42.5 mm

#@description The source volume Z dimension
z           : real   = 2.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "plexiglass"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


##########################################################################
[name="sample_box_top.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample box bottom end

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the source volume
shape_type  : string = "cylinder"

#@description The source volume radius
r           : real   = 42.5 mm

#@description The source volume Z dimension
z           : real   = 1.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "plexiglass"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


###########################################################################
[name="sample_box_side.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample box bottom end

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape
shape_type  : string = "tube"

#@description The inner radius
inner_r     : real   = 39.5 mm

#@description The outer radius
outer_r     : real   = 42.5 mm

#@description The Z dimension
z           : real   = 15.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "plexiglass"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


############################################################################
[name="sample_box_inner.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the source sample box bottom end

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the source volume
shape_type  : string = "cylinder"

#@description The source volume radius
r           : real   = 39.5 mm

#@description The source volume Z dimension
z           : real   = 15.0 mm

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "air"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

###################
# Daughter volume #
###################

#@description The list of daughter physical volumes
internal_item.labels : string[1] = "Sample"

#@description The logical volume/model associated to the physical volume
internal_item.model.Sample : string = "sample.model"

#@description The position of the physical volume with respect to the mother volume
internal_item.placement.Sample : string = "0.0 0.0 -5.0 (mm)"

###########
# Mapping #
###########

# Convention #0 == unique sample item 
mapping.daughter_id.Sample : string  = "[sample.gc:item=0]"


################################################################
[name="sample_box.model" type="geomtools::stacked_model"]

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
stacked.model_0 : string = "sample_box_bottom.model"

#@description The name of the geometry model at stacking slot 1
stacked.model_1 : string = "sample_box_side.model"

#@description The stacked contact point of volume at slot 1
stacked.limit_max_1 : real as length = -7.5 mm

#@description The name of the geometry model at stacking slot 2
stacked.model_2 : string = "sample_box_inner.model"

#@description The name of the geometry model at stacking slot 3
stacked.model_3 : string = "sample_box_top.model"

#@description The name of the volume at stacking slot 0
stacked.label_0 : string = "BottomEnd"

#@description The name of the volume at stacking slot 1
stacked.label_1 : string = "Side"

#@description The name of the volume at stacking slot 1
stacked.label_2 : string = "InnerVolume"

#@description The name of the volume at stacking slot 3
stacked.label_3 : string = "TopEnd"

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
