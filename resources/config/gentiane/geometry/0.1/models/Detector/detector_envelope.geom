# -*- mode: conf-unix; -*-
# List of multi-properties (datatools::multi_properties):

#@description The geometry model of the detector envelope

#@key_label  "name"
#@meta_label "type"

######################################################################
[name="detector_envelope.model" type="geomtools::simple_shaped_model"]

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
datafile          : string as path = "@edwgentiane:config/gentiane/geometry/0.1/models/Detector/detector_envelope.data"

#@description The rule to read the file that contains the coordinates of the polycone (z (implicit), ignore_rmin)
datafile.columns : string = "ignore_rmin"

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
internal_item.labels : string[4] = "DetectorBase" "DetectorInternals" "DetectorCover" "DetectorCoverTop" 
#internal_item.labels : string[3] = "DetectorBase" "DetectorCover" "DetectorInternals" 
#internal_item.labels : string[2] = "DetectorBase" "DetectorInternals" 


# The models of the daughter volumes

#@description The model associated to the DetectorBase daughter volume
internal_item.model.DetectorBase : string = "detector_alu_base.model"

#@description The model associated to the DetectorCover daughter volume
internal_item.model.DetectorCover : string = "external_cover.model"

#@description The model associated to the DetectorCoverTop daughter volume
internal_item.model.DetectorCoverTop : string = "external_top_cover.model"

#@description The model associated to the DetectorInternals daughter volume
internal_item.model.DetectorInternals : string = "internal_chamber.model"

# The placements of the daughter volumes (gravity mode)
internal_item.placement.DetectorBase.x : real as length = 0.0 mm
internal_item.placement.DetectorBase.y : real as length = 0.0 mm
internal_item.placement.DetectorBase.z.gap_mode : string = "min_to_min"
internal_item.placement.DetectorBase.z.gap_distance : real as length = 1.0 um

internal_item.placement.DetectorCover.x : real as length = 0.0 mm
internal_item.placement.DetectorCover.y : real as length = 0.0 mm
internal_item.placement.DetectorCover.z.gap_mode : string = "min_to_min"
internal_item.placement.DetectorCover.z.gap_distance : real as length = 63.001 mm

internal_item.placement.DetectorInternals.x : real as length = 0.0 mm
internal_item.placement.DetectorInternals.y : real as length = 0.0 mm
internal_item.placement.DetectorInternals.z.gap_mode : string = "min_to_min"
internal_item.placement.DetectorInternals.z.gap_distance : real as length = 63.001 mm

internal_item.placement.DetectorCoverTop.x : real as length = 0.0 mm
internal_item.placement.DetectorCoverTop.y : real as length = 0.0 mm
internal_item.placement.DetectorCoverTop.z.gap_mode : string = "min_to_min"
internal_item.placement.DetectorCoverTop.z.gap_distance : real as length = 260.001 mm

###########
# Mapping #
###########

#@description The mapping directive for the "DetectorBase" daughter volume
mapping.daughter_id.DetectorBase   : string  = "[detector_alu_base.gc]"

#@description The mapping directive for the "DetectorCover" daughter volume
mapping.daughter_id.DetectorCover   : string  = "[external_cover.gc]"

#@description The mapping directive for the "DetectorCoverTop" daughter volume
mapping.daughter_id.DetectorCoverTop   : string  = "[external_top_cover.gc]"

#@description The mapping directive for the "DetectorInternals" daughter volume
mapping.daughter_id.DetectorInternals   : string  = "[internal_chamber.gc]"


# #@description The mapping directive for the "BrassRod" daughter volume
# mapping.daughter_id.BrassRod   : string  = "[brass_rod.gc]"


# end
