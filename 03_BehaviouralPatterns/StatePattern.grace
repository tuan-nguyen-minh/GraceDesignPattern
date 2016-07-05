//The state pattern is used to alter the behaviour of an object as its internal state changes. 
//The pattern allows the class for an object to apparently change at run-time.

//see the diagramm at desktop

//I am not sure whether to keep RadioPlayerState. In Java or C# RadioPlayerState is require to delclare the variable. Grace requires no type

class RadioPlayer (stateOfPlayer) {
    var currentState is readable, writable := stateOfPlayer

    method pressPlayButton {
        currentState.pressPlayButton(self)
    }
 
    method pressAudioSourceButton {
        currentState.pressAudioSourceButton(self)
    }
    method asString {
        print "{currentState}"
    }
}

class RadioPlayerState {
    method pressPlayButton(player) {}
    method pressAudioSourceButton(player) {}
}

class StandbyState  {
    inherit RadioPlayerState
    print "In Standby State"
 
    method pressPlayButton (player) is override {
        print "Play Button pressed. No Action"
        //print "{player}"
    }
 
    method pressAudioSourceButton (player) is override {
        print "Audio Soure Button pressed"
        //print "{player}"
        player.currentState := MusicPlayingState
    }
}

class MusicPlayingState  {
    inherit RadioPlayerState
    print "In Music Playing State"
 
    method pressPlayButton (player) is override {
        print "Play Button pressed. Pause the Music"
        //print "{player}"
        player.currentState := MusicPausedState
    }
 
    method pressAudioSourceButton (player) is override {
        print "Audio Soure Button pressed"
        //print "{player}"
        player.currentState := RadioState
    }
}

class MusicPausedState  {
    inherit RadioPlayerState
    print "In Music paused State"
 
    method pressPlayButton (player) is override {
        print "Play Button pressed. Play the Music"
        player.currentState := MusicPlayingState
    }
 
    method pressAudioSourceButton (player) is override {
        print "Audio Soure Button pressed"
        player.currentState := RadioState
    }
}

class RadioState  {
    inherit RadioPlayerState
    print "In Radio State"
 
    method pressPlayButton (player) is override {
        print "Play Button pressed. Change the Radio Chanel"
        player.currentState := MusicPausedState
    }
 
    method pressAudioSourceButton (player) is override {
        print "Audio Soure Button pressed. Back to Standby"
        player.currentState := StandbyState
    }
}

var standbyState := StandbyState
var player := RadioPlayer(standbyState)
player.pressPlayButton
player.pressAudioSourceButton
player.pressPlayButton
player.pressPlayButton
player.pressAudioSourceButton
player.pressAudioSourceButton