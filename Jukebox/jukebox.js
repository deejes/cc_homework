

let song = prompt('write notes here');

let parseNote = function(inputNote){
  let outputObj = {}
  if (inputNote.indexOf("*") < 0){
    outputObj.pitch = inputNote
    outputObj.beats = 1
  }
  else {
    let randArray = inputNote.split("*")
    outputObj.pitch = randArray[0]
    outputObj.beats = randArray[1]
  }
return outputObj

}
// console.log(((parseNote("B4"))))

let parseSong = function(inputSong){
  return inputSong.split(' ').map((note) => {
    return parseNote(note);
  });

  // return(songArray);
}
// parseSong("D H*4 E A B*2")

let repeatRequest = function(){
  // console.log('test');

  song = prompt('write notes here');
  songs = parseSong(song);
  console.log(songs);
  playSong(songs, 250, repeatRequest);

}

let songs = parseSong(song);
console.log(songs);
playSong(songs, 250, repeatRequest);
