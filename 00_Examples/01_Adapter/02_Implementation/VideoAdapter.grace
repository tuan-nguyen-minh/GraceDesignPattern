import "MediaPlayer" as MediaPlayerPackage
import "MovPlayer" as MovPlayerPackage
import "AviPlayer" as AviPlayerPackage
class VideoAdapter (audioType) {
    inherit MediaPlayerPackage.MediaPlayer
    var advancedPlayer
    if (audioType == "mov") then {
        advancedPlayer := MovPlayerPackage.MovPlayer
    } elseif (audioType == "avi") then {
        advancedPlayer := AviPlayerPackage.AviPlayer
    } else {
        print "file undefined"
    }

    method play (mediaTypePlay, fileName) is override{
        if (mediaTypePlay == "mov") then {
            advancedPlayer.play(fileName);
        } elseif (mediaTypePlay == "avi") then{
            advancedPlayer.play(fileName);
        } else {
            print "file undefined"
        }
    }
}
