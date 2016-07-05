import "MediaAdapter" as MediaAdapterPackage
import "MediaPlayer" as MediaPlayerPackage
class AudioPlayer {
    inherits MediaPlayerPackage.MediaPlayer
    var mediaAdapter
    method play (audioType: String, fileName:String) is override {
        //inbuilt support to play mp3 music files
        if (audioType == "mp3") then {
            print "Playing mp3 file {fileName}"
        }
        //mediaAdapter is providing support to play other file formats
        elseif ((audioType == "vlc") || (audioType=="mp4")) then {
            mediaAdapter :=  MediaAdapterPackage.MediaAdapter(audioType)
            mediaAdapter.play(audioType, fileName)
        }
        else {
            print ("Invalid media {audioType}. Format not supported");
        }
    }

}
