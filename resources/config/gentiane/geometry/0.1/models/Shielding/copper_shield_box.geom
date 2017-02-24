# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the bottom copper shield block

#@key_label  "name"
#@meta_label "type"


#############################################################################
[name="bt_copper_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the bottom or top copper shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the bottom or top copper shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 450.0 mm

#@description The source volume Y dimension
y           : real   = 450.0 mm

#@description The source volume Z dimension
z           : real   = 25.0 mm

############
# Material #
############

#@description The name of the material that fills the bottom or top copper shield volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="lr_copper_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the left or right copper shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the  left or right copper shield  volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 450.0 mm

#@description The source volume Y dimension
y           : real   = 25.0 mm

#@description The source volume Z dimension
z           : real   = 400.0 mm

############
# Material #
############

#@description The name of the material that fills the left or right copper shield volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="fb_copper_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the front or back copper shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the front or back copper shield  volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   =  25.0 mm

#@description The source volume Y dimension
y           : real   = 400.0 mm

#@description The source volume Z dimension
z           : real   = 400.0 mm

############
# Material #
############

#@description The name of the material that fills the front or back copper shield volume
material.ref : string = "copper"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "red"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


#############################################################################
[name="copper_shield_box.model" type="geomtools::surrounded_boxed_model"]

#@config The list of properties to configure the bloc internal lead shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

 surrounded.model        : string = "bloc_internal_lead_shield.model"
 surrounded.label        : string = "Core"

 surrounded.front_model  : string = "fb_copper_shield.model"
 surrounded.front_label  : string = "Front"

 surrounded.back_model   : string = "fb_copper_shield.model"
 surrounded.back_label   : string = "Back"

 surrounded.left_model   : string = "lr_copper_shield.model"
 surrounded.left_label   : string = "Left"

 surrounded.right_model  : string = "lr_copper_shield.model"
 surrounded.right_label  : string = "Right"

 surrounded.bottom_model : string = "bt_copper_shield.model"
 surrounded.bottom_label : string = "Bottom"

 surrounded.top_model    : string = "bt_copper_shield.model"
 surrounded.top_label    : string = "Top"

 surrounded.centered_x   : boolean = false
 surrounded.centered_y   : boolean = false
 surrounded.centered_z   : boolean = false

###########
# Mapping #
###########

# Convention #0 == X-
mapping.daughter_id.Back   : string  = "[ext_copper_shield.gc:wall=0]"

# Convention #1 == X+
mapping.daughter_id.Front  : string  = "[ext_copper_shield.gc:wall=1]"

# Convention #2 == Y-
mapping.daughter_id.Left   : string  = "[ext_copper_shield.gc:wall=2]"

# Convention #3 == Y+
mapping.daughter_id.Right  : string  = "[ext_copper_shield.gc:wall=3]"

# Convention #4 == Z-
mapping.daughter_id.Bottom : string  = "[ext_copper_shield.gc:wall=4]"

# Convention #5 == Z+
mapping.daughter_id.Top    : string  = "[ext_copper_shield.gc:wall=5]"


############
# Material #
############

#@description The name of the material that fills the core lead shield volume
material.ref : string = "air"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "grey"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0
