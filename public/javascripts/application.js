// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var map, drawControls, geojson, lastFeature, wfs, vectors, featureid;
var fs_path = '';

function init(){
    map = new OpenLayers.Map('map', {maxResolution: 360/512,  controls: []});
    var wms = new OpenLayers.Layer.WMS( "OpenLayers WMS", 
    "http://labs.metacarta.com/wms-c/Basic.py", {'layers':'basic'}); 
    var wms2 = new OpenLayers.Layer.WMS( "OpenLayers WMS", 
    "http://labs.metacarta.com/wms-c/Basic.py", {'layers':'satellite'}); 

    vectors = new OpenLayers.Layer.Vector("Vector Layer", {displayInLayerSwitcher: false});

    map.addLayers([wms, wms2, vectors]);
    map.addControl(new OpenLayers.Control.Navigation());
    map.addControl(new OpenLayers.Control.PanZoomBar());
    map.addControl(new OpenLayers.Control.MousePosition());
    map.addControl(new OpenLayers.Control.Permalink());
    map.addControl(new OpenLayers.Control.LayerSwitcher());

    geojson = new OpenLayers.Format.GeoJSON();

    map.zoomToMaxExtent();
    vectors.onFeatureInsert = function(feature) {
        lastFeature = feature;
        updateFeature();
        var json = geojson.write(feature.layer.features);
        json = json.replace(/,/g, ', ');
        // document.getElementById('info').innerHTML = json;
    }
    featureid = 1;

    // edit
    if(<%= params[:action] =~ /edit|new/ ? "true" : "false" %>) { 
        map.addControl(new OpenLayers.Control.EditingToolbar(vectors)); 				
    } else {
        loadMap();
    }

}

function updateFeature() {
    if (!lastFeature) { 
        alert("Sorry, no feature to modify.");
        return;
    }
    if ($("place_name").value) {
        lastFeature.attributes['name'] = $("place_name").value;
        featureid++;
    }
    var json = geojson.write(lastFeature.layer.features);
    json = json.replace(/,/g, ', ');
    // debug 
    // document.getElementById('info').innerHTML = json;
}    
function success() { 
    $('info').innerHTML = "Features uploaded to server."; 
    vectors.destroyFeatures();
}        
function upload() {
    url = "/places.json";

    var json = geojson.write(vectors.features);
    new OpenLayers.Ajax.Request(url, 
        {   method: 'post', 
        postBody: json,
        requestHeaders: ['Accept', 'application/json', 'Content-Type', 'application/json'],
        onSuccess: success,
        onFailure: function(xhr) {
            $('info').innerHTML = "Failed upload (status code "+xhr.status+"). Check your URL."
        }
    }
);
}
OpenLayers.Tile.WFS.prototype.loadFeaturesForRegion = function(success, failure) { OpenLayers.loadURL(this.url+"&random="+Math.random(), null, this, success); }
OpenLayers.Feature.Vector.style['default'].strokeWidth=3;
