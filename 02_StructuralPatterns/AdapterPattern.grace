//How to apply the interface MediaPlayer ? Is that neccessary ? 
//he adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the "adaptee" 
//with a class that supports the interface required by the client.

//A media player which plays audio files. 
//The player is extended to be able to play video (avi) files. 


class MediaPlayer {
    method play () {}
}


class AviPlayer {
    method playAviFile (fileName) {
        print "Now we play Avi file {fileName}"
    }
}

class Player (_name) {
    inherit MediaPlayer
    var videoAdapter
    var name := _name

    method play (mediaType, fileName) is override {
        if (mediaType == "audio") then {
            //inbuilt support to play mp3 music files
            print "Now play audio file {fileName}"
        } elseif {mediaType == "avi"} then {
            //mediaAdapter is providing support to play other file formats
            videoAdapter :=  VideoAdapter(mediaType)
            videoAdapter.play(mediaType, fileName)
        } else {
            print ("Media {mediaType} is invalid. The Format is not supported")
        }
    }

    method asString {
        print (name)
    }
}

class VideoAdapter (audioType) {
    inherit MediaPlayer        
    var aviPlayer

    method play (mediaType, fileName) is override {        
        if (mediaType == "avi") then {
            aviPlayer := AviPlayer
            aviPlayer.playAviFile(fileName)
        } else {
            print "File undefined"
        }
    }
}

var player := Player ("Media Player")
player.play("audio", "My love.mp3")
player.play("avi", "Grace is cool.avi")
player.play("mov", "The Lord of Tthe Rings.mov")
player.play("mkw", "Harry Potter.mkw")
