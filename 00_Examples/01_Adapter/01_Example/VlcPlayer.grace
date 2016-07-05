import "AdvancedMediaPlayer" as AdvancedMediaPlayerPackage
class VlcPlayer {
    inherits AdvancedMediaPlayerPackage.AdvancedMediaPlayer
    method playVlc (fileName : String) is override{
        print "Playing vlc file {fileName}"
    }
    method playMp4 (fileName : String) is override{}
}
