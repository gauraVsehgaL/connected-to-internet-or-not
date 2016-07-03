Dim host
host = "www.google.com"
keepOnPinging host 'call function
Sub keepOnPinging(host) 'function definition
   Dim output,shell,command,result,sound 'variable declaration
   set shell = CreateObject("wscript.shell") 'create object to run shell command
   set sound = CreateObject("WMPlayer.OCX") 'create object of player
   command = "ping " & host 'create the command to be run & is concatenation operator 
   do while(True)
     result=shell.run(command,0,True) 'run the command
     if result = 0 Then 'if ping returns true
      sound.URL = "C:\pagwalamunda.mp3"
      sound.controls.play
      While sound.playState <> 1 'play sound until sound ends
        Wscript.Sleep 100
      Wend 'end while
      sound.close
      exit do 'exit loop
      Wscript.Echo "Online"
     End if
     Wscript.Sleep 2000 'wait these many miliseconds until next ping 
   loop
End Sub 'end function definition