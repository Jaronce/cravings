import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugin/init_mapbox';

initMapbox();
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

