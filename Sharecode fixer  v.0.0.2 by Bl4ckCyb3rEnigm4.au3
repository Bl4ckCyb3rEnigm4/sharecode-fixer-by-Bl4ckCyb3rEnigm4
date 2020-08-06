#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ICON.ico
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Sharecode fixer by Bl4ckCyb3rEnigm4
#AutoIt3Wrapper_Res_Description=Sharecode fixer by Bl4ckCyb3rEnigm4
#AutoIt3Wrapper_Res_Fileversion=0.0.2.0
#AutoIt3Wrapper_Res_ProductName=Sharecode fixer by Bl4ckCyb3rEnigm4
#AutoIt3Wrapper_Res_ProductVersion=0.0.2
#AutoIt3Wrapper_Res_LegalCopyright=Bl4ckCyb3rEnigm4
#AutoIt3Wrapper_Run_Au3Stripper=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
while True
	$Data=ClipGet()
	if (StringInStr($Data, "http")<>0 Or StringInStr($Data, " ")<>0) And StringInStr($Data, "/")<>0 And StringInStr($Data, @CRLF)<>0 Then
		$Array=StringSplit($Data, @CRLF)

		$i=1
		While True
			If UBound($Array)<=$i Then
				ExitLoop
			ElseIf StringStripWS($Array[$i], 8)=="" Then
				_ArrayDelete($Array, $i)
			Else
				$i+=1
			EndIf
		WEnd
		If StringInStr($Array[1], "http")<>0 Then
			$LINK=StringTrimLeft($Array[1], StringInStr($Array[1], "http")-1) &StringTrimLeft($Array[2], StringInStr($Array[2], "/")-1)
		Else
			$LINK="http://"&StringTrimLeft($Array[1], StringInStr($Array[1], " ")) &StringTrimLeft($Array[2], StringInStr($Array[2], "/")-1)
		EndIf
		ClipPut($LINK)
		TrayTip("Sharecode fixer by Bl4ckCyb3rEnigm4", "Sharecode fixed", 3, 1)
	EndIf
	Sleep(30)
WEnd