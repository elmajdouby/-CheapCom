
var schedule = require('node-schedule');

// var j = schedule.scheduleJob('2 * * * *', function(){ // every 2:00 clock.
//   updateAllScores();
// });


//schedule folder - updateScore file

// async function updateAllScores(){
//   var _idViewHashMap = await getAllBusiness_id_views();
//   _idViewHashMap.forEach(function(value,key){
//       updateScore(key, value);
//   })
// }



//return hashmap<businessMan_id, views>
function getAllBusiness_id_views() {
    return new Promise(function (resolve, reject) {
       resolve();
       reject();
    });
}


// async function updateScore(businessMan_id, views){
//      var AverageScore = await getAverageScore(businessMan_id);
//      var TotleLike = await getTotalLike(businessMan_id);
//      var TotleFav = await getTotalFav(businessMan_id);
//      var score = AverageScore+TotleLike+TotleFav+views;

// }

function getAverageScore(businessMan_id) {
    return new Promise(function (resolve, reject) {
       resolve();
       reject();
    });
}

function getTotalLike(businessMan_id) {
    return new Promise(function (resolve, reject) {
       resolve();
       reject();
    });
}

function getTotalFav(businessMan_id) {
    return new Promise(function (resolve, reject) {
       resolve();
       reject();
    });
}
