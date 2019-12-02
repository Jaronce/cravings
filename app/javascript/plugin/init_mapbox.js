import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0 });
  };

  let lat = 45.508888;
  let lng = -73.561668;

  navigator.geolocation.getCurrentPosition((location) => {
    lat = location.coords.latitude;
    lng = location.coords.longitude;
  })

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      interactive: false,
      center: [lng, lat]
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });
    fitMapToMarkers(map, markers);

      map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        showUserLocation: true,
        fitBoundsOptions: {
          maxZoom:14
        }
      }));
  }

  setTimeout(() => {
    document.querySelector(".mapboxgl-ctrl-icon.mapboxgl-ctrl-geolocate").click()

  }, 100)
};

export { initMapbox };
