import "VideoMediaPlayer" as VideoMediaPlayerPackage
class AviPlayer {
    inherit VideoMediaPlayerPackage.VideoMediaPlayer
      alias playAvi = play 
    method play (fileName) is override{
        playAvi (fileName)
        print "Now we play Avi file {fileName}"
    }
}
