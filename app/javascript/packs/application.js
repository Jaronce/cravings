import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { search } from "../components/search_on_index";
import { clickFootBar } from "../components/click_footbar";
import { readMore } from "../components/review_read_more";
import { initMapbox } from '../plugin/init_mapbox';

const navToggleBtn = document.querySelector("#navbar-toggle-btn");

navToggleBtn.addEventListener("click", () => {
  document.querySelector("#menu").classList.toggle("transform-none");
});

search();
readMore();
initMapbox();
clickFootBar();

