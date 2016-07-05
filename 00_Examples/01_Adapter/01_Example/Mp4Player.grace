import "AdvancedMediaPlayer" as AdvancedMediaPlayerPackage
class Mp4Player {
    inherits AdvancedMediaPlayerPackage.AdvancedMediaPlayer
    method playVlc (fileName : String) is override{}
    method playMp4 (fileName : String) is override{
        print "Playing mp4 file {fileName}"
    }
}
