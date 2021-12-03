//This solution was written by Sohom Sahaun.
//https://medium.com/@sahaun/gamemaker-studio-2-setting-up-layers-for-persistent-objects-24e9ddd6c410

targetName    = "Layer_One";
targetLayerID = layer_get_id(targetName);
targetDepth   = layer_get_depth(targetLayerID);



if (!layer_exists(targetLayerID)) {
    targetLayerID = layer_create(targetDepth, targetName);
}

layer = targetLayerID;