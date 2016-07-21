function []  = hangmanJustin()

chosenLetters = zeros(26,1); %boolean to track chosen letters. Using ASCII
chosenWord = '';
numberOfGuesses = 8;

getWord();

lettersToFind = unique(chosenWord);
lettersNeeded = length(lettersToFind); %Initialize number of letters to find
lettersToDisplay = zeros(length(chosenWord),1);

nGuesses = 0;
playGame = true;

while playGame
    
    displayGame();
    
    guessIsCorrect = getGuess();
    
    %Start again if the guess is not valid. 
    if isempty(guessIsCorrect);
        continue;
    end
    
    if guessIsCorrect
        updateLetters();       
    else
        nGuesses = nGuesses + 1;        
    end
    
    if nGuesses == numberOfGuesses;
        displayLosingScreen();
        playGame = false;
    end
    
    if lettersNeeded ==0;
        displayWinningScreen();
        playGame = false; 
    end
    
    
    
end





%This section contains "nested functions" these have access to variables
%within the scope of hangmanJustin()
    function getWord()
        chosenWord = inputdlg('Please choose a word for hangman');
        chosenWord = chosenWord{1};
        
        if all(isstrprop(chosenWord,'alpha'))
            return;
        else
            getWord();
        end
        
    end

    function guessIsCorrect = getGuess()
        
         guessedLetter = input('Guess a letter: ','s');
         guessedLetter = lower(guessedLetter);
         guessIsCorrect = [];
         
         if isempty(guessedLetter)
             disp('Please input a single english letter');
             return;
         end
         
         letterIdx = guessedLetter(1)- 96;
         
         if letterIdx > 26 || letterIdx <1
             disp('Please input a single english letter');
             return;
         end
         
         if chosenLetters(letterIdx)
             disp('Already Chose this letter try again');
             return;
         end
         
         idx = strfind(lettersToFind,guessedLetter);
         
         if isempty(idx)
             disp('Sorry you guessed wrong');
             chosenLetters(letterIdx) = true;
             guessIsCorrect = false;
         else
             disp('Correct')             
             chosenLetters(letterIdx) = true;
             lettersToFind = setdiff(lettersToFind,guessedLetter);            
             letterLocationInWord= strfind(chosenWord,guessedLetter);
             lettersToDisplay(letterLocationInWord) = true;
             lettersNeeded = sum(~lettersToDisplay);
             guessIsCorrect = true;
             
         end
         
         
    end

    function displayGame()
        
        hangmanToShowPlayer = 'hangman';
        hangmanToShowPlayer(nGuesses+1:end)='-';
        
        wordToShowPlayer = chosenWord;
        wordToShowPlayer(~lettersToDisplay) = '_';
            
        disp('%%%%%%%%%%%%%%%%');
        disp(['%%%  ' upper(hangmanToShowPlayer) '   %%%%%']);
        disp('%%%%%%%%%%%%%%%%');
        disp(wordToShowPlayer);
            
        
        
    end

    function checkInput()
    end

    function updateLetters()
    end

    function displayLosingScreen();
        disp('Very sad you die')
        
    end

    function displayWinningScreen()
        disp('HAHA You excaped the noose');
    end


end %end function = hangmanJustin()