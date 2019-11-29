import "bootstrap";
import { loadDynamicBannerText, initializeMainVideo } from '../components/banner';
initializeMainVideo();
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { search } from "../components/search_on_index";
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugin/init_mapbox';
search();
initMapbox();
loadDynamicBannerText();
