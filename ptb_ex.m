try
  expInfo=  openExperiment();
    
    
    rectSize = [0 0 100 100; ...
        150 150 175 175; ...
        200 200 700 700]';
    
    rectColor = [ 1 0 0;...
        0 1 1;...
        1 0 1;]';
    
    Screen('FrameRect',expInfo.curWindow,rectColor,rectSize)
    Screen('flip',expInfo.curWindow)
    
    key = 220;
    semiToneRatio = 2.^((0:12)/12);
    song = [0 3 5 0 3 6 5]+1;
    song2 = [0 3 5 0 3 6 5]+5+1;
    songDur = [2 2 2 2 2 1 2 ]/4;
    
    for iSong = 1:length(song),
    PsychPortAudio('Volume', expInfo.audioInfo.pahandle, 0.7); %the volume of the beep
    expInfo.audioInfo.beepLength = songDur(iSong);
    intervalBeep = MakeBeep(key*semiToneRatio(song(iSong)), expInfo.audioInfo.beepLength, expInfo.audioInfo.samplingFreq);     
    intervalBeep2 = MakeBeep(key*semiToneRatio(song2(iSong)), expInfo.audioInfo.beepLength, expInfo.audioInfo.samplingFreq);     
    intervalBeep = intervalBeep + intervalBeep2;
    PsychPortAudio('FillBuffer', expInfo.audioInfo.pahandle, [intervalBeep; intervalBeep]);
    PsychPortAudio('Start', expInfo.audioInfo.pahandle, expInfo.audioInfo.nReps, expInfo.audioInfo.startCue);    
    WaitSecs(expInfo.audioInfo.beepLength);    
    PsychPortAudio('Stop', expInfo.audioInfo.pahandle);
    end
    
    KbWait;
    
    
    
    ListenChar(0)
    
    sca;
catch ME
    
    ListenChar(0)
    sca
    rethrow(ME)
end
