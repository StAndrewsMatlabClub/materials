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
    
    PsychPortAudio('Volume', expInfo.audioInfo.pahandle, 0.5); %the volume of the beep
    
    intervalBeep = MakeBeep(500, expInfo.audioInfo.beepLength, expInfo.audioInfo.samplingFreq);
    
    PsychPortAudio('FillBuffer', expInfo.audioInfo.pahandle, [intervalBeep; intervalBeep]);
    
    PsychPortAudio('Start', expInfo.audioInfo.pahandle, expInfo.audioInfo.nReps, expInfo.audioInfo.startCue);
    
    WaitSecs(expInfo.audioInfo.beepLength);
    
    PsychPortAudio('Stop', expInfo.audioInfo.pahandle);
    KbWait;
    
    
    
    ListenChar(0)
    
    sca;
catch ME
    
    ListenChar(0)
    sca
    rethrow(ME)
end
