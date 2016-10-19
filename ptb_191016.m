%excercise

try

 %   PsychDebugWindowConfiguration(0,1)

    expInfo=  openExperiment();
    
    
    rectSize = [0 0 100 100; ...
        150 150 175 175; ...
        200 200 700 700]';
    
    rectColor = [ 1 0 0;...
        0 1 1;...
        1 0 1;]';
    ListenChar(0)
    
    DrawFormattedText(expInfo.curWindow, 'Excercise 1, press any key')
    Screen('flip',expInfo.curWindow)
    KbWait();
   
    flippedDir = false;
    for iFrame = 1:3*60,
        
        if ~flippedDir
            
            if rectSize(3,3) >= expInfo.screenRect(3)
                dx = -1;
                flippedDir = true;
            else
                dx = 1;
            end
        else
            if rectSize(1,1) <= expInfo.screenRect(1)
                dx = 1;
                flippedDir = false;
            else
                dx = -1;
            end
        end
        
        
        rectSize = rectSize+dx;
        Screen('FrameRect',expInfo.curWindow,rectColor,rectSize);
        Screen('flip',expInfo.curWindow);
    end
    
    DrawFormattedText(expInfo.curWindow, 'Excercise 2, press any key')
    Screen('flip',expInfo.curWindow)
    KbWait();
    
    rectSize = [0 0 100 100; ...
        150 150 175 175; ...
        200 200 700 700]';
    
    rotAngle = 0;
    % Make a backup copy of the current transformation matrix for later
    % use/restoration of default state:
    Screen('glPushMatrix', expInfo.curWindow);
    
    for iFrame = 1:3*60,
    
        Screen('glTranslate', expInfo.curWindow, expInfo.center(1),expInfo.center(2), 0);
        Screen('glRotate', expInfo.curWindow, -.5);
        Screen('glTranslate', expInfo.curWindow, -expInfo.center(1),-expInfo.center(2), 0);
        Screen('FrameRect',expInfo.curWindow,rectColor,rectSize);
       
        Screen('Flip',expInfo.curWindow);
    
    end
    
    Screen('glPopMatrix', expInfo.curWindow);
    
    
 
    
    DrawFormattedText(expInfo.curWindow, 'Excercise 4, press any key');
    Screen('flip',expInfo.curWindow);
    KbWait();
       
    
    sprites = imread('invaders.gif');
    
    sprite2 = sprites(1:100,146:146+140);

    sprite1 = sprites(1:100,1:141);
    
    sprite1 = double(1-sprite1); %Neads to be double otherwise treated as 0-255 range
    sprite2 = double(1-sprite2); 
    
    %cat(3,sprite1,sprite1)
    tex1 = Screen('MakeTexture', expInfo.curWindow,cat(3,sprite1,sprite1) );
    tex2 = Screen('MakeTexture', expInfo.curWindow, cat(3,sprite2,sprite2));
    
    
    destRec = [0 0 100 100];
    for iFrame = 1:3*60,
        
    
       %Screen('DrawTexture', windowPointer, texturePointer [,sourceRect] [,destinationRect] [,rotationAngle] [, filterMode] [, globalAlpha] [, modulateColor] [, textureShader] [, specialFlags] [, auxParameters]);
 
       if mod(iFrame,2)==0
           thisTex = tex1;
       else
           thisTex = tex2;
       end
       
       Screen('DrawTexture', expInfo.curWindow, thisTex, [], destRec);
       destRec([1 3]) = destRec([1 3])+20;
       Screen('Flip',expInfo.curWindow);
       WaitSecs(.1)
    end
    
    Screen('Close',tex1);
    Screen('Close',tex2);
 
 
    
    
    sca;
    
  
catch ME
    
   
    sca
    rethrow(ME)
end