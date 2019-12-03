import "bootstrap";
import "../components/sparkle.js"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { search } from "../components/search_on_index";
import { readMore } from "../components/review_read_more";
import { initMapbox } from '../plugin/init_mapbox';
import { clickBugerButton } from "../components/click_footbar";



search();
readMore();
clickBugerButton();
initMapbox();

