import "VideoAdapter" as VideoAdapterPackage
import "MediaPlayer" as MediaPlayerPackage
class Player {
    inherit MediaPlayerPackage.MediaPlayer
      alias playMedia = play
    var videoAdapter
    method play (mediaType, fileName) is override {
        playMedia
        //inbuilt support to play mp3 music files
        if (mediaType == "audio") then {
            print "Now play audio file {fileName}"
        } elseif ((mediaType == "avi") || (mediaType == "mov")) then {
            //mediaAdapter is providing support to play other file formats
            videoAdapter :=  VideoAdapterPackage.VideoAdapter(mediaType)
            videoAdapter.play(mediaType, fileName)
        } else {
            print ("Media {mediaType} is invalid. The Format is not supported")
        }
    }

}
