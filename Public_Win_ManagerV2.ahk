#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ;A window's title can contain WinTitle anywhere inside it to be a match
SetTitleMatchMode, Fast     ;Fast is default
DetectHiddenWindows, off     ;off is default 

; Récupérer les infos sur les moniteurs 1 et 2
; Créer les point A B C et D sur les moniteurs
; Calculer les DemiLongeur et DemiHauteur
; Déterminer la position de la fenêtre active :
; - Vérifier si la fenêtre est sur le moniteur 1
; - Vérifier que le coin en haut à gauche appartient à une des 4 zones
; En fonction de la position de la fenêtre et de la toucche utilisée, modifier sa position

startInit(ByRef nbmoniteur, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left, ByRef A1x, ByRef A1y, ByRef B1x, ByRef B1y, ByRef C1x, ByRef C1y, ByRef D1x, ByRef D1y, ByRef A2x, ByRef A2y, ByRef B2x, ByRef B2y, ByRef C2x, ByRef C2y, ByRef D2x, ByRef D2y){
		MsgBox INIT
		InfoFenetre(nbmoniteur, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		ObtenirCoordonnees(nbmoniteur, A1x, A1y, B1x, B1y, C1x, C1y, D1x, D1y, A2x, A2y, B2x, B2y, C2x, C2y, D2x, D2y, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		
		DemiLongeur1 := distance(MonWA1Right, MonWA1Left)
		DemiLongeur1 /= 2
		DemiHauteur1 := distance(MonWA1Top, MonWA1Bottom)
		DemiHauteur1 /= 2

		if (nbmoniteur == 2){
			DemiLongeur2 := distance(MonWA2Right, MonWA2Left)
			DemiLongeur2 /= 2
			DemiHauteur2 := distance(MonWA2Top, MonWA2Bottom)
			DemiHauteur2 /= 2
		}
		;MsgBox %nbmoniteur% %DemiLongeur2% | %DemiHauteur2%
		
}

InfoFenetre(ByRef nbmoniteur, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left){

		SysGet, nbmoniteur, 80
		SysGet, MonWA1, MonitorWorkArea, 1
		
		
		if (nbmoniteur == 2){
			SysGet, MonWA2, MonitorWorkArea, 2
			;WinSet, Region, 2-2 W1919 H27 R30-30,ahk_class Shell_SecondaryTrayWnd
		}
		
		
		;;--- Pour changer la forme de la barre des taches ---
		;WinSet, Region, 960-1 W950 H33 R12-12, ahk_class Shell_TrayWnd
		
}

InfoFenetre(nbmoniteur, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
ObtenirCoordonnees(nbmoniteur, A1x, A1y, B1x, B1y, C1x, C1y, D1x, D1y, A2x, A2y, B2x, B2y, C2x, C2y, D2x, D2y, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)

DemiLongeur1 := distance(MonWA1Right, MonWA1Left)
DemiLongeur1 /= 2
DemiHauteur1 := distance(MonWA1Top, MonWA1Bottom)
DemiHauteur1 /= 2

if (nbmoniteur == 2){
	
	DemiLongeur2 := distance(MonWA2Right, MonWA2Left)
	DemiLongeur2 /= 2
	DemiHauteur2 := distance(MonWA2Top, MonWA2Bottom)
	DemiHauteur2 /= 2
}


;-----------------------------
;-----------------------------
^!r::startInit( nbmoniteur,  MonWA1Top,  MonWA2Top,  MonWA1Right,  MonWA2Right,  MonWA1Bottom,  MonWA2Bottom,  MonWA1Left,  MonWA2Left,  A1x,  A1y,  B1x,  B1y,  C1x,  C1y,  D1x,  D1y,  A2x,  A2y,  B2x,  B2y,  C2x,  C2y,  D2x,  D2y)
!Left::DeplaceGauche( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y)
!Right::DeplaceDroite( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y, nbmoniteur)
!Up::DeplaceHaut( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y,  A2x, A2y)
!Down::DeplaceBas( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y, nbmoniteur)
!^::WinSet, AlwaysOnTop, -1,A
!m::WinSet, Style, -0xC00000,A
!p::WinSet, Style, +0xC00000,A
!PgUp::ChangeMoniteur(DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y, nbmoniteur)
!PgDn::ChangeMoniteur(DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y, nbmoniteur)
^!Enter::RunPowerShell(DemiHauteur1,DemiLongeur1)
^!b::Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
!e::RunExplorer()
^!t::WinSet, Transparent, 240, A
^!y::WinSet, Transparent, 150, A
^!o::WinSet, Transparent, OFF, A
;-----------------------------
;-----------------------------


XcoordonneePoints(IdMoniteur, Point, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left){
	Switch Point
	{
		case "A":
			Switch IdMoniteur
			{
				case "2":
					x := MonWA2Left
					return x
				default:
					x := MonWA1Left
					return x
			}
		case "B":
			Switch IdMoniteur
			{
				case "2":
					x := MonWA2Right
					return x
				default:
					x := MonWA1Right
					return x
			}
		case "C":
			Switch IdMoniteur
			{
				case "2":
					x := MonWA2Right
					return x
				default:
					x := MonWA1Right
					return x
			}
		default:
			Switch IdMoniteur
			{
				case "2":
					x := MonWA2Left
					return x
				default:
					x := MonWA1Left
					return x
			}
	}
	
}

YcoordonneePoints(IdMoniteur, Point, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left){
	Switch Point
	{
		case "A":
			Switch IdMoniteur
			{
				case "2":
					y := MonWA2Top
					return y
				default:
					y := MonWA1Top
					return y
			}
		case "B":
			Switch IdMoniteur
			{
				case "2":
					y := MonWA2Top
					return y
				default:
					y := MonWA1Top
					return y
			}
		case "C":
			Switch IdMoniteur
			{
				case "2":
					y := MonWA2Bottom
					return y
				default:
					y := MonWA1Bottom
					return y
			}
		default:
			Switch IdMoniteur
			{
				case "2":
					y := MonWA2Bottom
					return y
				default:
					y := MonWA1Bottom
					return y
			}
	}
}

ObtenirCoordonnees(ByRef nbmoniteur, ByRef A1x, ByRef A1y, ByRef B1x, ByRef B1y, ByRef C1x, ByRef C1y, ByRef D1x, ByRef D1y, ByRef A2x, ByRef A2y, ByRef B2x, ByRef B2y, ByRef C2x, ByRef C2y, ByRef D2x, ByRef D2y, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left){

	A1x := XcoordonneePoints("1", "A", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	A1y := YcoordonneePoints("1", "A", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	B1x := XcoordonneePoints("1", "B", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	B1y := YcoordonneePoints("1", "B", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	C1x := XcoordonneePoints("1", "C", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	C1y := YcoordonneePoints("1", "C", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	D1x := XcoordonneePoints("1", "D", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	D1y := YcoordonneePoints("1", "D", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	
	if(nbmoniteur>1){
		A2x := XcoordonneePoints("2", "A", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		A2y := YcoordonneePoints("2", "A", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		B2x := XcoordonneePoints("2", "B", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		B2y := YcoordonneePoints("2", "B", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		C2x := XcoordonneePoints("2", "C", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		C2y := YcoordonneePoints("2", "C", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		D2x := XcoordonneePoints("2", "D", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
		D2y := YcoordonneePoints("2", "D", MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
	}
}



;
;	A-------------------B
;	|		    		|
;	|		    		|
;	|		    		|
;	|		    		|
;	|		    		|
;	D-------------------C
;

aireRectangle(PointAx, PointAy, PointBx, PointDy){
	Longeur := distance(PointAx,PointBx)
	Hauteur := distance(PointAy,PointDy)
	AireRect := Hauteur * Longeur
	return %AireRect%
}

distance(Point1, Point2){
	L := Point1 - Point2
	L := Abs(L)
	return %L%
}

AireTriangle(PointAx, PointAy, PointBx, PointBy, PointCx, PointCy){
	AireT := (PointBx-PointAx)*(PointCy-PointAy)-(PointCx-PointAx)*(PointBy-PointAy)
	AireT := Abs(AireT)
	AireT /= 2
	return %AireT%
}

OuEstLaFenetre(Fx, Fy, PointAx, PointAy, PointBx, PointDy, AireMoniteur){
	offsetx := 0
	offsety := 0
	AireT1 := AireTriangle(PointAx, PointAy, Fx + offsetx, Fy + offsety, PointBx, PointAy) ; AFB
	AireT2 := AireTriangle(PointBx, PointAy, Fx + offsetx, Fy + offsety, PointBx, PointDy) ; BFC
	AireT3 := AireTriangle(PointBx, PointDy, Fx + offsetx, Fy + offsety, PointAx, PointDy) ; CFD
	AireT4 := AireTriangle(PointAx, PointDy, Fx + offsetx, Fy + offsety, PointAx, PointAy) ; DFA
	
	SumAireT := AireT1 + AireT2 + AireT3 + AireT4
	
	;MsgBox %AireMoniteur% %SumAireT% | A1 = %AireT1% A2 = %AireT2% A3 = %AireT3% A4 = %AireT4%
	
	Vrai := 0
	if(SumAireT == AireMoniteur){
		Vrai := 1
	}
	return %Vrai%
}



;-----------------------------
;-----------------------------

GetSurMoniteur1(Fx, Fy, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y){
	aireMoniteur1 := aireRectangle(A1x,A1y,B1x,D1y)
	surMoniteur1 := OuEstLaFenetre(Fx, Fy, A1x, A1y, B1x, D1y, aireMoniteur1)
	return %surMoniteur1%
}

GetSurG1(Fx, Fy, ByRef DemiLongeur1, ByRef A1x, ByRef A1y, ByRef D1y){
	aireMoniteurG1 := aireRectangle(A1x,A1y, A1x + DemiLongeur1, D1y)
	surMoniteurG1 := OuEstLaFenetre(Fx+1, Fy+1 , A1x, A1y, A1x + DemiLongeur1, D1y, aireMoniteurG1)
	return %surMoniteurG1%
}

GetSurH1(Fx, Fy, Byref DemiHauteur1, ByRef A1x, ByRef A1y, ByRef B1x){
	aireMoniteurH1 := aireRectangle(A1x,A1y, B1x, A1y + DemiHauteur1)
	surMoniteurH1 := OuEstLaFenetre(Fx, Fy + 1, A1x, A1y, B1x, A1y + DemiHauteur1, aireMoniteurH1)
	return %surMoniteurH1%
}

GetSurG2(Fx, Fy, ByRef DemiHauteur2, ByRef DemiLongeur2, ByRef A1x, ByRef A2x, ByRef A1y, ByRef A2y){
	aireMoniteurG2 := aireRectangle(0, 0, DemiLongeur2, DemiHauteur2 * 2)
	;surMoniteurG2 := OuEstLaFenetre(Fx - 449 + 1, Fy + 1280 + 0, 0,0, DemiLongeur2, DemiHauteur2 * 2, aireMoniteurG2) ; /!\ offsetx
	surMoniteurG2 := OuEstLaFenetre(Fx-A2x+1, Fy-A2y+1 , 0, 0, DemiLongeur2, DemiHauteur2 * 2, aireMoniteurG2)
	return %surMoniteurG2%
}

GetSurH2(Fx, Fy, ByRef DemiHauteur2, ByRef DemiLongeur2, ByRef A1x, ByRef A2x, ByRef A1y, ByRef A2y){
	aireMoniteurH2 := aireRectangle(0,0, DemiLongeur2 * 2, DemiHauteur2)
	;surMoniteurH2 := OuEstLaFenetre(Fx - 449 + 1, Fy + 1280 + 0, 0,0, DemiLongeur2 * 2, DemiHauteur2, aireMoniteurH2) ; /!\ offsetx
	surMoniteurH2 := OuEstLaFenetre(Fx-A2x+1, Fy-A2y+1 , 0, 0, DemiLongeur2 * 2, DemiHauteur2, aireMoniteurH2)
	return %surMoniteurH2%
}

DeplaceGauche(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, Byref A2y){
	
	WinGetPos,Fx,Fy,Fl,Fh,A

	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	;MsgBox %surMoniteurG1% %surMoniteurH1% %surMoniteurG2% %surMoniteurH2% | %Fx% %Fy% | %A1x% %A2x%
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurG2
			{
				case 0 :
					Fx := A2x
					Fl := DemiLongeur2
				default :
					if(Fx == (A2x) and Fl != (DemiLongeur2 * 2)){
						Fl := (DemiLongeur2) * 2
					}
					else{
						Fx := A2x
						Fl := DemiLongeur2
					}
			}
		default :
			Switch surMoniteurG1
			{
				case 0 :
					Fx := A1x
					Fl := DemiLongeur1
				default :
					if(Fx == (A1x) and Fl != (DemiLongeur1) * 2){
						Fl := (DemiLongeur1) * 2
					}
					else{
						Fx := A1x
						Fl := DemiLongeur1
					}
			}
			
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	WinSet, Redraw,,A
}

DeplaceDroite(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x,  ByRef A2y, ByRef nbmoniteur){

	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx + 1, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	;MsgBox %surMoniteurG1% %surMoniteurH1% %surMoniteurG2% %surMoniteurH2% | %Fx% %Fy% | %A1x% %A2x%
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurG2
			{
				case 0 :
					if(Fx == A2x + DemiLongeur2){
						Fx := A1x
						Fy := A1y
						Fl := DemiLongeur1 * 2
						Fh := DemiHauteur1 * 2
					}
					else{
						Fx := A2x + DemiLongeur2
						Fl := DemiLongeur2
					}
				default :
					Fx := A2x + DemiLongeur2
					Fl := DemiLongeur2
			}
		default :
			Switch surMoniteurG1
			{
				case 0 :
					if(Fx == (A1x + DemiLongeur1) and (nbmoniteur > 1)){
						Fx := A2x
						Fy := A2y
						Fl := DemiLongeur2 * 2
						Fh := DemiHauteur2 * 2
					}
					else{
						Fx := A1x + DemiLongeur1
						Fl := DemiLongeur1
					}
				default :
					Fx := A1x + DemiLongeur1
					Fl := DemiLongeur1
					if (Fy < A1y){
						Fy := A1y
						Fh := DemiHauteur1 * 2
					}
			}
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	WinSet, Redraw,,A
}

DeplaceHaut(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y){

	WinGetPos,Fx,Fy,Fl,Fh,A

	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	;MsgBox %surMoniteurG1% %surMoniteurH1% %surMoniteurG2% %surMoniteurH2% | %Fx% %Fy% | %A1x% %A2x%
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurH2
			{
				case 0 :
					Fy := A2y + 1
				default :
					Fy := A2y + 1
					Fx := A2x
					Fl := (DemiLongeur2) *2
					Fh := (DemiHauteur2 *2) - 1
			}
		default :
			Switch surMoniteurH1
			{
				case 0 :
					Fy := A1y
				default :
					Fy := A1y + 1
					Fx := A1x
					Fl := (DemiLongeur1) *2
					Fh := (DemiHauteur1 *2) - 1
					

			}
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	WinSet, Redraw,,A
}

DeplaceBas(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y, ByRef nbmoniteur){

	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	;MsgBox %surMoniteurG1% %surMoniteurH1% %surMoniteur2% %surMoniteurH2% | %Fx% %Fy% | %A1x% %A2x% | %surMoniteur1%
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurH2
			{
				case 0 :
					if(Fy == A2y + DemiHauteur2){
						Fy := A1y + 1
						Fx := A1x
						Fl := (DemiLongeur1) *2
						Fh := (DemiHauteur1 *2) - 1
						
					}else{
						Fy := A2y + DemiHauteur2
						Fh := DemiHauteur2
					}
				default :
					Fy := A2y + DemiHauteur2
					Fh := DemiHauteur2
			}
			
		default :
			Switch surMoniteurH1
			{
				case 0 :
					if(Fy == A1y + DemiHauteur1 and nbmoniteur > 1){
						Fy := A2y + 1
						Fx := A2x
						Fl := (DemiLongeur2) *2
						Fh := (DemiHauteur2 *2) - 1
					}else{
						Fy := A1y + DemiHauteur1
						Fh := DemiHauteur1
					}
				default :
					Fy := A1y + DemiHauteur1
					Fh := DemiHauteur1
			}
	}
	
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	WinSet, Redraw,,A
}

ChangeMoniteur(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y, ByRef nbmoniteur){
		
	if(nbmoniteur > 1){
	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	Switch surMoniteur1
	{
		case 0 :
			Fy := A1y
			Fx := A1x + 1
			Fl := (DemiLongeur1 - 1) *2
			Fh := DemiHauteur1 *2
		default :
			Fy := A2y
			Fx := A2x
			Fl := DemiLongeur2 *2
			Fh := DemiHauteur2 *2
	}
	
	}
	else{
		Fy := A1y
		Fx := A1x + 1
		Fl := (DemiLongeur1 - 1) *2
		Fh := DemiHauteur1 *2
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	WinSet, Redraw,,A
}

RunPowerShell(Byref DemiHauteur1,Byref DemiLongeur1){
	Run "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
	WinWait, ahk_exe powershell.exe 
	WinActivate,ahk_exe powershell.exe
	WinSet, Style, -0xCF0000,ahk_exe powershell.exe
}

RunExplorer(){
	Run "C:\Windows\explorer.exe"
	WinWait, ahk_class CabinetWClass
	WinActivate,ahk_class CabinetWClass
	WinSet, Transparent, 240, ahk_class CabinetWClass
	WinSet, Redraw,,A
}

;; Vérifier l'éxistance du fichier pour sauvegarder les lignes de commandes
;file := FileOpen("res_path.txt", "r")
;if !IsObject(file)
;{
;	MsgBox Création de res_path.txt
;	file := FileOpen("res_path.txt", "w")
;	return
;}
;file.Close()
;
;!^1::Enregistrer_pos("loc1.txt")
;!^2::Enregistrer_pos("loc2.txt")
;^1::Placer_les_win("loc1.txt")
;^2::Placer_les_win("loc2.txt")
;
;Enregistrer_pos(config){
;	; Ajouter la position des fenêtres de toutes les app dans ce fichier avec un raccourci option append
;	WinGet, l_process, List
;	
;	file := FileOpen(config, "w") ; Nouveau fichier config
;	sep := "|"
;	newline := "`r`n"
;	
;	Loop %l_process%
;	{
;		
;	    process := l_process%A_Index%  ; A_Index is a built-in variable.
;		WinGetTitle, title, ahk_id %process%
;		Winget, ID, PID ,ahk_id %process%; Will get the PID of the active window 
;		
;		if StrLen(title) > 0 and title <> "Program Manager"
;		{
;			WinGetPos,Fx,Fy,Fl,Fh,%title% ; Récupérer la position de la fenêtre
;			Run PowerShell.exe wmic process %ID% get CommandLine > "%A_WorkingDir%\res_path.txt" ,,Hide ; Récupérer la Commandline de la fenêtre
;			sleep 500
;			FileReadLine, line3, %A_WorkingDir%\res_path.txt, 3
;			FileReadLine, line4, %A_WorkingDir%\res_path.txt, 4
;			Cmd_line       :=  line3 . line4
;			
;			Run PowerShell.exe wmic process %ID% get Description > "%A_WorkingDir%\res_path.txt",,Hide
;			;Run PowerShell.exe wmic process %ID% get ExecutablePath > "%A_WorkingDir%\res_path.txt"
;			sleep 500
;			FileReadLine, line3, %A_WorkingDir%\res_path.txt, 3
;			FileReadLine, line4, %A_WorkingDir%\res_path.txt, 4
;			executablePath       :=  line3 . line4
;						
;			;MsgBox Ligne de commande : %Cmd_line% `r`n Titre : %title%
;			
;			line := title sep Fx sep Fy sep Fl sep Fh sep Cmd_line sep executablePath newline
;			file.Write(line)
;		}
;		
;	}
;	file.Close()
;	MsgBox Nouvelle config
;}
;
;Placer_les_win(config){
;	; Vérifier l'éxistance de la config
;	file := FileOpen(config, "r")
;	if !IsObject(file)
;	{
;		MsgBox Création de loc.txt
;		file := FileOpen(config, "w")
;		return
;	}
;	file.Close()
;	
;	; Lire le fichier config pour ouvrir toutes les app et placer les fenêtres du fichier config
;	Loop
;	{
;		FileReadLine, line, %config%, %A_Index%
;		if ErrorLevel
;			break
;			
;		l_info := StrSplit(line, "|")
;
;		if not WinExist(l_info[1])
;		{
;			try {
;				cmd_l := % l_info[7]
;				Run PowerShell.exe start %cmd_l%,,Hide
;				WinWait, % l_info[1],,3
;				;MsgBox 1 %cmd_l%
;
;			} catch e {				
;				;try {
;					cmd_l := % l_info[7]
;					Run %ComSpec% /c start %cmd_l%,,Hide
;					WinWait,% l_info[1],,3
;					;MsgBox 2 %cmd_l%
;				;} 
;			}
;			if not WinExist(l_info[1])
;			{
;				try {
;					cmd_l := % l_info[6]
;					Run, %cmd_l%,,Hide
;					WinWait,% l_info[1],,3
;					;MsgBox 3 %cmd_l%
;				}
;			}
;		}
;		
;		WinSet, Redraw,,% l_info[1]
;		WinMove,% l_info[1],,% l_info[2],% l_info[3],% l_info[4],% l_info[5]
;		WinSet, Redraw,,% l_info[1]
;	}
;	SoundBeep, 440, 100
;
;}

return
