import "MediaPlayer" as MediaPlayerPackage
import "VlcPlayer" as VlcPlayerPackage
import "Mp4Player" as Mp4PlayerPackage
class MediaAdapter (audioType : String) {
    inherits MediaPlayerPackage.MediaPlayer
    var advancedPlayer
    if (audioType == "vlc") then {
        advancedPlayer := VlcPlayerPackage.VlcPlayer
    }

    elseif (audioType == "mp4") then {
        advancedPlayer := Mp4PlayerPackage.Mp4Player
    }
    else {
        print "file undefined"
    }

    method play (audioTypePlay:String, fileName:String) is override{
        if(audioTypePlay == "vlc") then {
            advancedPlayer.playVlc(fileName);
        }
        elseif(audioTypePlay == "mp4") then{
            advancedPlayer.playMp4(fileName);
        }
        else {
            print "file undefined"
        }
    }
}
