
export const search = () => {
  const appId = document.querySelector("meta[name='algolia-app-id']").content;
  const searchApiKey = document.querySelector("meta[name='algolia-search-key']").content;
  const client = algoliasearch(appId, searchApiKey);

  const dishIndex = client.initIndex("Dish");
  const categoryIndex = client.initIndex("Category");

  const query = document.querySelector(".index_search");
  query.addEventListener("input", (event) => {
      cleanPage();
      if (query.value !== ""){
        findInCategory(categoryIndex, query, event);
        findInDish(dishIndex, query, event);
      }
  })
}

const findInDish = (dishIndex, query, event) => {
  dishIndex.search(query.value, { hitsPerPage: 100, page: 0 })
  .then((content) => {
    content.hits.forEach((hit) => {
      const card = document.querySelector(`#dish-${hit.objectID}`);
      card.style.display = "block";
    })
  })
}

const findInCategory = (categoryIndex, query, event) => {
  categoryIndex.search(query.value, { hitsPerPage: 100, page: 0 })
  .then((content) => {
    content.hits.forEach((hit) => {
      const card = document.querySelector(`#category-${hit.objectID}`);
      card.style.display = "block";
    })
  })
}

const cleanPage = () => {
  const cards = document.querySelectorAll(".card-trip-link");
  cards.forEach((card) => card.style.display = "none")
};








  // const query = document.querySelector("#index_search");
  // query.addEventListener("input", (event) => {
  //   dishIndex.search(query.value, { hitsPerPage: 100, page: 0 })
  //     .then((content) => {
  //       const hiddenCards = document.querySelectorAll(".card-trip-link");
  //       hiddenCards.forEach((card) => {
  //         card.style.display = "none";
  //       })

  //       content.hits.forEach((hit) => {
  //         const card = document.querySelector(`#dish-${hit.objectID}`);
  //         card.style.display = "block";
  //       })
  //     }).then(() => {
  //       categoryIndex.search(query.value, { hitsPerPage: 100, page: 0 })
  //         .then((content) => {
  //           content.hits.forEach((hit) => {
  //             const card = document.querySelector(`#category-${hit.objectID}`);
  //             card.style.display = "block";
  //           })
  //         });
  //     });
  //   })






// code






// export const userInputName = () => {
//   const textInput = document.getElementById("index_form");
//   textInput.addEventListener("keyup", (event) => {
//     const keyword = event.currentTarget.value;
//     cleanPage();
//     findStationName(keyword, true);
//   });
// };



// export const userInputEndStation = () => {
//   const textInput = document.getElementById("station_end_station");
//   textInput.addEventListener("keyup", (event) => {
//     const keyword = event.currentTarget.value;
//     cleanPage();
//     findStationName(keyword, false);
//   });
// };

// const cleanPage = () => {
//   const table = document.getElementById("results");
//   table.innerHTML = "";
// };

// const findStationName = (keyword, station) => {
//   event.preventDefault();
//   $.ajax({
//     url: 'https://transit.api.here.com/v3/stations/by_name.json',
//     type: 'GET',
//     dataType: 'jsonp',
//     jsonp: 'callbackFunc',
//     data: {
//       center: '45.5017,-73.5673',
//       name: keyword,
//       app_id: process.env.HERE_APP_ID,
//       app_code: process.env.HERE_APP_CODE,
//       max: '10',
//       method : 'fuzzy',
//       radius: '5000'
//     },
//     success: function (data) {
//       // console.log(data);
//       const stationArray = data.Res.Stations.Stn.map(e => e);
//       addLine(stationArray, station);
//     }
//   });
// };


// const addLine = (stationArray, station) => {
//   stationArray.forEach(function(ele){
//     const table = document.getElementById("results");
//     const code = `<div class="${station} card w-75"
//     >
//       <div class="card-body">
//         <h4 class="card-title">${ele.name}</h4>
//         <p class="card-title">Street name : ${ele.street}</p>
//         <p class="card-title">Street name : ${ele.id}</p>
//         <a href="#" data-station="${ele.name}" data-street="${ele.street}" data-start="${station}" class="btn btn-ghost select-station">Select</a>
//       </div>
//     </div>`;
//     table.insertAdjacentHTML("afterbegin", code);
//     userClickStation(ele);
//   });
// };


// const userClickStation = (ele) => {
//   const buttons = document.querySelectorAll(".select-station");
//   buttons.forEach((button) => {
//     button.addEventListener("click", (event) => {
//       //
//       const stationName = event.currentTarget.dataset.station;
//       const streetName = event.currentTarget.dataset.street;
//       const start = event.currentTarget.dataset.start;
//       if (start === 'true') {
//         const formStartstation = document.getElementById("station_start_station");
//         formStartstation.value = stationName;
//         cleanPage();
//       } else if (start === 'false') {
//         const formEndstation = document.getElementById("station_end_station");
//         formEndstation.value = stationName;
//         cleanPage();
//           // unless value is equal to start station
//       }
//     });
//   });
// };



// 1) If user Click the button
// 2) Send the object(id, name) to the User/Stations/create
// 3) Launch End point Action





