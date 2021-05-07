#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InfoFenetre(ByRef nbmoniteur, ByRef MonWA1Top, ByRef MonWA2Top, ByRef MonWA1Right, ByRef MonWA2Right, ByRef MonWA1Bottom, ByRef MonWA2Bottom, ByRef MonWA1Left, ByRef MonWA2Left){
	
		SysGet, nbmoniteur, 80
		SysGet, MonWA1, MonitorWorkArea, 1
		if (nbmoniteur == 2){
			SysGet, MonWA2, MonitorWorkArea, 2
		}
	
}

InfoFenetre(nbmoniteur, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
ObtenirCoordonnees(nbmoniteur, A1x, A1y, B1x, B1y, C1x, C1y, D1x, D1y, A2x, A2y, B2x, B2y, C2x, C2y, D2x, D2y, MonWA1Top, MonWA2Top, MonWA1Right, MonWA2Right, MonWA1Bottom, MonWA2Bottom, MonWA1Left, MonWA2Left)
DemiLongeur1 := distance(MonWA1Right, MonWA1Left)
DemiLongeur1 /= 2
DemiLongeur2 := distance(MonWA2Right, MonWA2Left)
DemiLongeur2 /= 2
DemiHauteur1 := distance(MonWA1Top, MonWA1Bottom)
DemiHauteur1 /= 2
DemiHauteur2 := distance(MonWA2Top, MonWA2Bottom)
DemiHauteur2 /= 2


;-----------------------------
;-----------------------------
!Left::DeplaceGauche( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x)
!Right::DeplaceDroite( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y)
!Up::DeplaceHaut( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y,  A2x, A2y)
!Down::DeplaceBas( DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y)
!^::WinSet, AlwaysOnTop, -1,A
!m::WinSet, Style, -0xC00000,A
!p::WinSet, Style, +0xC00000,A
!PgUp::ChangeMoniteur(DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y)
!PgDn::ChangeMoniteur(DemiHauteur1,  DemiHauteur2,  DemiLongeur1,  DemiLongeur2,  A1x,  A1y,  B1x,  D1y, A2x, A2y)

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
;	|					|
;	|					|
;	|		  			|
;	|					|
;	|					|
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
	offsetx := 5
	offsety := 5
	AireT1 := AireTriangle(PointAx, PointAy, Fx + offsetx, Fy + offsety, PointBx, PointAy) ; AFB
	AireT2 := AireTriangle(PointBx, PointAy, Fx + offsetx, Fy + offsety, PointBx, PointDy) ; BFC
	AireT3 := AireTriangle(PointBx, PointDy, Fx + offsetx, Fy + offsety, PointAx, PointDy) ; CFD
	AireT4 := AireTriangle(PointAx, PointDy, Fx + offsetx, Fy + offsety, PointAx, PointAy) ; DFA
	
	SumAireT := AireT1 + AireT2 + AireT3 + AireT4
	
	Vrai := 0
	if((Fx == -9 and Fy == -9) or (SumAireT == AireMoniteur)){
		Vrai := 1
	}
	return %Vrai%
}

SurMoniteur1(ByRef AireMoniteur1, Fx, Fy, ByRef A1x, ByRef A1y, ByRef B1x, ByRef B1y, ByRef C1x, ByRef C1y, ByRef D1x, ByRef D1y){
	AireT1 := AireTriangle(A1x, A1y, Fx, Fy, B1x, B1y)
	AireT2 := AireTriangle(B1x, B1y, Fx, Fy, C1x, C1y)
	AireT3 := AireTriangle(D1x, D1y, Fx, Fy, C1x, C1y)
	AireT4 := AireTriangle(D1x, D1y, Fx, Fy, A1x, A1y)
	
	SumAireT := AireT1 + AireT2 + AireT3 + AireT4
	Vrai := 0

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
	surMoniteurG1 := OuEstLaFenetre(Fx, Fy , A1x, A1y, A1x + DemiLongeur1, D1y, aireMoniteurG1)
	return %surMoniteurG1%
}

GetSurH1(Fx, Fy, Byref DemiHauteur1, ByRef A1x, ByRef A1y, ByRef B1x){
	aireMoniteurH1 := aireRectangle(A1x,A1y, B1x, A1y + DemiHauteur1)
	surMoniteurH1 := OuEstLaFenetre(Fx, Fy , A1x, A1y, B1x, A1y + DemiHauteur1, aireMoniteurH1)
	return %surMoniteurH1%
}

GetSurG2(Fx, Fy, ByRef DemiHauteur2, ByRef DemiLongeur2, ByRef A1x, ByRef A2x, ByRef A1y, ByRef A2y){
	aireMoniteurG2 := aireRectangle(0,0, DemiLongeur2, DemiHauteur2 * 2)
	;surMoniteurG2 := OuEstLaFenetre(Fx - 449 + 1, Fy + 1280 + 0, 0,0, DemiLongeur2, DemiHauteur2 * 2, aireMoniteurG2) ; /!\ offsetx
	surMoniteurG2 := OuEstLaFenetre(Fx - (A2x-A1x), Fy + 0 , 0,0, DemiLongeur2, DemiHauteur2 * 2, aireMoniteurG2)
	return %surMoniteurG2%
}

GetSurH2(Fx, Fy, ByRef DemiHauteur2, ByRef DemiLongeur2, ByRef A1x, ByRef A2x, ByRef A1y, ByRef A2y){
	aireMoniteurH2 := aireRectangle(0,0, DemiLongeur2 * 2, DemiHauteur2)
	;surMoniteurH2 := OuEstLaFenetre(Fx - 449 + 1, Fy + 1280 + 0, 0,0, DemiLongeur2 * 2, DemiHauteur2, aireMoniteurH2) ; /!\ offsetx
	surMoniteurH2 := OuEstLaFenetre(Fx - (A2x-A1x), Fy + (A1y-A2y), 0,0, DemiLongeur2 * 2, DemiHauteur2, aireMoniteurH2)
	return %surMoniteurH2%
}

DeplaceGauche(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x){
	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	;MsgBox %surMoniteurG1% %surMoniteurH1% %surMoniteurG2% %surMoniteurH2%
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurG2
			{
				case 0 :
					Fx := A2x
					Fl := DemiLongeur2
				default :
					if(Fx == A2x and Fl != DemiLongeur2 * 2){
						Fl := DemiLongeur2 * 2
					}
					else{
						Fx := A2x
						Fl := DemiLongeur1
					}
			}
		default :
			Switch surMoniteurG1
			{
				case 0 :
					Fx := A1x + 1
					Fl := DemiLongeur1 - 1
				default :
					if(Fx == (A1x + 1) and Fl != (DemiLongeur1-1) * 2){
						Fl := (DemiLongeur1-1) *2
					}
					else{
						Fx := A1x + 1
						Fl := DemiLongeur1 - 1
					}
			}
			
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	
	

}

DeplaceDroite(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x,  ByRef A2y){

	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	;MsgBox %surMoniteur1% %surMoniteurG1% %surMoniteurH1% %surMoniteurG2% %surMoniteurH2%
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurG2
			{
				case 0 :
					if(Fx == A2x + DemiLongeur2){
						Fx := A1x + 1
						Fy := A1y
						Fl := (DemiLongeur1 - 1) * 2
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
					if(Fx == A1x + DemiLongeur1){
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
					Fx := A1x + 1 + DemiLongeur1
					Fl := DemiLongeur1 - 1
			}
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
}

DeplaceHaut(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y){

	WinGetPos,Fx,Fy,Fl,Fh,A

	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	;MsgBox %A2y% %Fy% %surMoniteurH2% %A1y%
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurH2
			{
				case 0 :
					Fy := A2y
				default :
					if(Fx == A2x or Fx == A2x + DemiLongeur2){
						Fy := A2y
						Fx := A2x
						Fl := DemiLongeur2 *2
						Fh := DemiHauteur2 *2
					}
			}
		default :
			Switch surMoniteurH1
			{
				case 0 :
					Fy := A1y					
				default :
					if(Fx == A1x + 1 or Fx == A1x + 1 + DemiLongeur1){
						Fy := A1y
						Fx := A1x + 1
						Fl := (DemiLongeur1 - 1) *2
						Fh := DemiHauteur1 *2
					}
			}
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
	
}

DeplaceBas(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y){

	WinGetPos,Fx,Fy,Fl,Fh,A
	
	surMoniteur1 := GetSurMoniteur1(Fx, Fy, A1x, A1y, B1x, D1y)
	surMoniteurG1 := GetSurG1(Fx, Fy, DemiLongeur1, A1x, A1y, D1y)
	surMoniteurH1 := GetSurH1(Fx, Fy, DemiHauteur1, A1x, A1y, B1x)
	surMoniteurG2 := GetSurG2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	surMoniteurH2 := GetSurH2(Fx, Fy, DemiHauteur2, DemiLongeur2, A1x, A2x, A1y, A2y)
	
	Switch surMoniteur1
	{
		case 0 :
			Switch surMoniteurH2
			{
				case 0 :
					if(Fy == A2y + DemiHauteur2){
						Fy := A1y
						Fx := A1x + 1
						Fl := (DemiLongeur1 - 1) *2
						Fh := DemiHauteur1 *2
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
					if(Fy == A1y + DemiHauteur1){
						Fy := A2y
						Fx := A2x
						Fl := DemiLongeur2 *2
						Fh := DemiHauteur2 *2
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
}

ChangeMoniteur(Byref DemiHauteur1, ByRef DemiHauteur2, ByRef DemiLongeur1, ByRef DemiLongeur2, ByRef A1x, ByRef A1y, ByRef B1x, ByRef D1y, ByRef A2x, ByRef A2y){
		
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
			Fh := DemiHauteur2 *2
		default :
			Fy := A2y
			Fx := A2x
			Fl := DemiLongeur2 *2
			Fh := DemiHauteur2 *2
	}
	WinMove,A,,%Fx%,%Fy%,%Fl%,%Fh%
}