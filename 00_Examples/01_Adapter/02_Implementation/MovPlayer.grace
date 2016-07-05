import "VideoMediaPlayer" as VideoMediaPlayerPackage
class MovPlayer {
    inherit VideoMediaPlayerPackage.VideoMediaPlayer
      alias playMov = play
    method play (fileName ) is override{
        playMov (fileName)
        print "Now we play mov file {fileName}"
    }
}
