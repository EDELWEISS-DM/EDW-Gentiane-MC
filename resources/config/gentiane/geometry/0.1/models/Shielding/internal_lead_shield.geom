# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the internal lead shield block

#@key_label  "name"
#@meta_label "type"


#############################################################################
[name="bottom_internal_lead_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the bottom internal lead shield

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the bottom internal lead shield volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 400.0 mm

#@description The source volume Y dimension
y           : real   = 400.0 mm

#@description The source volume Z dimension
z           : real   = 50.0 mm

############
# Material #
############

#@description The name of the material that fills the bottom internal lead shield volume
material.ref : string = "roman_lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "magenta"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="lr_internal_lead_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the left or right internal lead shield 

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the  left or right internal lead  volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 400.0 mm

#@description The source volume Y dimension
y           : real   = 100.0 mm

#@description The source volume Z dimension
z           : real   = 350.0 mm

############
# Material #
############

#@description The name of the material that fills the left or right internal lead volume
material.ref : string = "roman_lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "magenta"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="fb_internal_lead_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the front or back internal lead shield 

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the front or back internal lead shield  volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 100.0 mm

#@description The source volume Y dimension
y           : real   = 200.0 mm

#@description The source volume Z dimension
z           : real   = 350.0 mm

############
# Material #
############

#@description The name of the material that fills the front or back copper shield volume
material.ref : string = "roman_lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "magenta"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

#############################################################################
[name="core_internal_detector_room.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the detector room inside the shielding

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the volume
shape_type  : string = "polycone"

#@description The polycone build mode
build_mode  : string = "datafile"

#@description The file that contains the coordinates of the polycone
datafile          : string as path = "@edwgentiane:config/gentiane/geometry/0.1/models/Detector/core_internal_detector_room.data"

#@description The rule to read the file that contains the coordinates of the polycone (z (implicit), rmin, rmax)
datafile.columns : string = "rmin_rmax"

############
# Material #
############

#@description The name of the material that fills the source volume
material.ref : string = "air"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "cyan"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0


####################
# Daughter volumes #
####################

#@description The list of daughter volumes by label
internal_item.labels : string[4] = "DetectorBase" "DetectorCover" "DetectorInternals" "SampleBox"

#@description The model of the daughter volumes
internal_item.model.DetectorBase : string = "detector_alu_base.model"
internal_item.model.DetectorCover : string = "external_cover.model"
internal_item.model.DetectorInternals : string = "internal_chamber.model"
internal_item.model.SampleBox : string = "sample_box.model"

#@description The placement of the daughter volumes (gravity mode donc z gap = 0)
internal_item.placement.DetectorBase.x : real as length = 0.0 mm
internal_item.placement.DetectorBase.y : real as length = 0.0 mm
internal_item.placement.DetectorBase.z.gap_mode : string = "min_to_min" 
internal_item.placement.DetectorBase.z.gap_distance :real as length = 0.0 mm
internal_item.placement.DetectorCover.x : real as length = 0.0 mm
internal_item.placement.DetectorCover.y : real as length = 0.0 mm
internal_item.placement.DetectorCover.z.gap_mode : string = "min_to_min" 
internal_item.placement.DetectorCover.z.gap_distance :real as length = 63.0 mm
internal_item.placement.DetectorInternals.x : real as length = 0.0 mm
internal_item.placement.DetectorInternals.y : real as length = 0.0 mm
internal_item.placement.DetectorInternals.z.gap_mode : string = "min_to_min" 
internal_item.placement.DetectorInternals.z.gap_distance :real as length = 63.0 mm
internal_item.placement.SampleBox.x : real as length = 0.0 mm
internal_item.placement.SampleBox.y : real as length = 0.0 mm
internal_item.placement.SampleBox.z.gap_mode : string = "min_to_min" 
internal_item.placement.SampleBox.z.gap_distance :real as length = 260.75 mm



#############################################################################
[name="core_internal_lead_shield.model" type="geomtools::simple_shaped_model"]

#@config The list of properties to configure the core internal lead shield 

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

#@description The name of the 3D shape of the core internal lead shield  volume
shape_type  : string = "box"

#@description The source volume X dimension
x           : real   = 200.0 mm

#@description The source volume Y dimension
y           : real   = 200.0 mm

#@description The source volume Z dimension
z           : real   = 350.0 mm

############
# Material #
############

#@description The name of the material that fills the core lead shield volume
material.ref : string = "roman_lead"

##############
# Visibility #
##############

#@description The recommended color for the display of the dummy volume
visibility.color  : string  = "magenta"

#@description The visibility hidden flag for the display of the dummy volume
visibility.hidden : boolean = 0

####################
# Daughter volumes #
####################

#@description The list of daughter volumes by label
internal_item.labels : string[1] = "DetectorRoom"

#@description The model of the daughter volume
internal_item.model.DetectorRoom : string = "core_internal_detector_room.model"

#@description The placement of the daughter volume (gravity mode donc z gap = 0)
internal_item.placement.DetectorRoom.x : real as length = 0.0 mm
internal_item.placement.DetectorRoom.y : real as length = 0.0 mm
internal_item.placement.DetectorRoom.z.gap_mode : string = "min_to_min" 
internal_item.placement.DetectorRoom.z.gap_distance :real as length = 0.0 mm


#############################################################################
[name="bloc_internal_lead_shield.model" type="geomtools::surrounded_boxed_model"]

#@config The list of properties to configure the bloc internal lead shield 

############
# Geometry #
############

### #@description The default length unit
### length_unit : string = "mm"

 surrounded.model      : string = "core_internal_lead_shield.model"      
 surrounded.label        : string = "Core"  
                 
 surrounded.front_model      : string = "fb_internal_lead_shield.model"      
 surrounded.front_label        : string = "Front"  
                 
 surrounded.back_model      : string = "fb_internal_lead_shield.model"      
 surrounded.back_label        : string = "Back"   
                
 surrounded.left_model        : string = "lr_internal_lead_shield.model" 
 surrounded.left_label          : string = "Left"        
       
 surrounded.right_model     : string = "lr_internal_lead_shield.model"
 surrounded.right_label       : string = "Right"   
                          
 surrounded.bottom_model : string = "bottom_internal_lead_shield.model"      
 surrounded.bottom_label   : string = "Bottom"
                   
 surrounded.centered_x   : boolean = true    
 surrounded.centered_y   : boolean = true                        
 surrounded.centered_z   : boolean = false                        

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

