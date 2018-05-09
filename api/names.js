// Demo of imperative - non functional

function mostFrequentNames(names) {
    var splittedNames = [];
    var mergedNames = [];
    var uniqueWords = [];
    var count= [];

    for (var i = 0, len = names.length; i < len; i++) {
      lowercaseName = names[i].toLowerCase();
      splittedNames.push(splitNames(lowercaseName));
    }
    mergedNames = [].concat.apply([], splittedNames);


    var iWordsCount = mergedNames.length;
    var counts = {};
    for (var i=0; i<iWordsCount; i++) {
      var sWord = mergedNames[i];
      counts[sWord] = counts[sWord] || 0;
      counts[sWord]++;
    }

    var arr = [];
    for (sWord in counts) {
      arr.push({
        text: sWord,
        frequency: counts[sWord]
      });
    }

    var sorted = arr.sort(function(a,b){
      return (a.frequency > b.frequency) ? -1 : ((a.frequency < b.frequency) ? 1 : 0);

    });
    var formattedArray = new Array();
    for (var i = 0; i < sorted.length; i++) {
      formattedArray.push(sorted[i].text + " (" + sorted[i].frequency + ")");

    }

    return formattedArray;
  }


function splitNames(name) {
  var splitNameSpaces = name.split(" ");
  var merged = [].concat.apply([], splitNameSpaces);
  return arrayUnique(merged);
}

function arrayUnique(array) {
    var a = array.concat();
    for(var i=0; i<a.length; ++i) {
        for(var j=i+1; j<a.length; ++j) {
            if(a[i] === a[j])
                a.splice(j--, 1);
        }
    }
    return a;
}



  module.exports = mostFrequentNames;