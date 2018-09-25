; Declarer ses variables convenablement
AutoItSetOption("MustDeclareVars", 1)
; Activation du mode evenementiel
Opt("GUIOnEventMode", 1)

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

; Number of the image
Dim $idImg = InputBox("Numero de l'image", "Entrez le numéro de l'image où vous en êtes: ")
Dim $boolContinue = False
Dim $count = 0

; GUI and label
Dim $GUI = GUICreate("Get KnowLedge", 400, 200, 1000, 300)
WinSetOnTop($GUI, "", 1)
Dim $onOffBut = GUICtrlCreateButton("GO", 50, 40, 300, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "EndProg")
GUICtrlSetOnEvent($onOffBut, "getParse")
GUISetState(@SW_SHOW)


; boucle infinie d'affichage du programme
while 1
	; Economie du CPU
	Sleep(5000)
WEnd

Func EndProg()
	Exit
EndFunc


Func getParse()
	while (True)
		getOne()
	WEnd
EndFunc

Func scrollDown()
	Dim $lim = 13

	$count += 1
	if (Mod($count, 15) == 0) Then
			$lim = 12
	EndIf

	For $i = 0 To $lim
		MouseWheel("down")
		sleep(500)
	Next
EndFunc

Func getOne()
	$idImg += 1

	MouseClick ("main", 2300, 400)
	scrollDown()

	sleep(1000)
	Send ( "!{PRINTSCREEN}")
	sleep(1000)
	MouseClick ("main", 500, 500)
	sleep(1000)
	Send ( "^v")
	sleep(1000)
	Send ( "^s")
	sleep(1000)
	ClipPut($idImg)
	sleep(1500)
	Send ( "^v")
	sleep(1000)
	send("{ENTER}")
	sleep(1000)
	Send ( "^n")

EndFunc



