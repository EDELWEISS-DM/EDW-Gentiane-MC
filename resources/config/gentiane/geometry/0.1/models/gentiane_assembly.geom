# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the external lead shields

#@key_label  "name"
#@meta_label "type"


#############################################################################
[name="bottom_lead_shield_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the external lead bottom shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the external lead bottom shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 550.0 mm

#@description The source volume Y dimension
y           : real   = 550.0 mm

#@description The source volume Z dimension
z           : real   = 150.0 mm

############
# Material #
############

#@description The name of the material that fills the external lead bottom shield volume
material.ref : string = "lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#############################################################################
[name="top_lead_shield_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the external lead top shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the external lead top shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 550.0 mm

#@description The source volume Y dimension
y           : real   = 550.0 mm

#@description The source volume Z dimension
z           : real   = 100.0 mm

############
# Material #
############

#@description The name of the material that fills the external lead top shield volume
material.ref : string = "lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="outer_lead_lr_shield_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the external lead left-right side shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the external lead left-right side shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 450.0 mm

#@description The source volume Y dimension
y           : real   = 50.0 mm

#@description The source volume Z dimension
z           : real   = 450.0 mm

############
# Material #
############

#@description The name of the material that fills the external lead left-right side shield volume
material.ref : string = "lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#############################################################################
[name="outer_lead_fb_shield_base.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the external lead front-back side shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the external lead front-back side shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 50.0 mm

#@description The source volume Y dimension
y           : real   = 550.0 mm

#@description The source volume Z dimension
z           : real   = 450.0 mm

############
# Material #
############

#@description The name of the material that fills the external lead front-back side shield volume
material.ref : string = "lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "green"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="top_copper_plate_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the top copper plate shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the top copper plate shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 750.0 mm

#@description The source volume Y dimension
y           : real   = 750.0 mm

#@description The source volume Z dimension
z           : real   = 10.0 mm

############
# Material #
############

#@description The name of the material that fills the top copper plate shield volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


###################################################################
[name="core_shield.model" type="geomtools::surrounded_boxed_model"]

#@config The list of properties to configure the core shield including shields with copper and internal lead and detection unit

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

 surrounded.model        : string = "copper_shield_box.model"
 surrounded.label        : string = "Core"

 surrounded.front_model  : string = "outer_lead_fb_shield_base.model"
 surrounded.front_label  : string = "Front"

 surrounded.back_model   : string = "outer_lead_fb_shield_base.model"
 surrounded.back_label   : string = "Back"

 surrounded.left_model   : string = "outer_lead_lr_shield_base.model"
 surrounded.left_label   : string = "Left"

 surrounded.right_model  : string = "outer_lead_lr_shield_base.model"
 surrounded.right_label  : string = "Right"


 surrounded.centered_x   : boolean = false
 surrounded.centered_y   : boolean = false
 surrounded.centered_z   : boolean = false

###########
# Mapping #
###########

# Convention #0 == X-
mapping.daughter_id.Back  : string  = "[ext_lead_shield.gc:wall=0]"

# Convention #1 == X+
mapping.daughter_id.Front : string  = "[ext_lead_shield.gc:wall=1]"

# Convention #2 == Y-
mapping.daughter_id.Left  : string  = "[ext_lead_shield.gc:wall=2]"

# Convention #3 == Y+
mapping.daughter_id.Right : string  = "[ext_lead_shield.gc:wall=3]"


############
# Material #
############

#@description The name of the material that fills the core lead shield volume
material.ref : string = "air"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "yellow"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


##################################################################
#@description The stacking model of the gentiane detector assembly

################################################################
[name="gentiane_assembly.model" type="geomtools::stacked_model"]

############
# Geometry #
############

# #@description The default length unit
# length_unit : string = "mm"

#@description The stacking axis
stacked.axis    : string = "z"

#@description The number of stacked volumes
stacked.number_of_items : integer = 4

#@description The name of the geometry model at stacking slot 0
stacked.model_0 : string = "bottom_lead_shield_base.model"

#@description The name of the geometry model at stacking slot 1
stacked.model_1 : string = "core_shield.model"

#@description The name of the geometry model at stacking slot 2
stacked.model_2 : string = "top_copper_plate_shield.model"

#@description The name of the geometry model at stacking slot 3
stacked.model_3 : string = "top_lead_shield_base.model"

#@description The name of the volume at stacking slot 0
stacked.label_0 : string = "BottomLeadShield"

#@description The name of the volume at stacking slot 1
stacked.label_1 : string = "CoreShield"

#@description The name of the volume at stacking slot 2
stacked.label_2 : string = "TopCopperPlateShield"

#@description The name of the volume at stacking slot 3
stacked.label_3 : string = "TopLeadShield"


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

# Convention #0 == unique plate
mapping.daughter_id.TopCopperPlateShield : string  = "[ext_copper_plate.gc:plate=0]"

# Convention #4 == bottom Z
mapping.daughter_id.BottomLeadShield     : string  = "[ext_lead_shield.gc:wall=4]"

# Convention #5 == top Z
mapping.daughter_id.TopLeadShield        : string  = "[ext_lead_shield.gc:wall=5]"


# end