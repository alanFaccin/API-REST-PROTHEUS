#include 'protheus.ch'

//-------------------------------------------------------------------
/*/{Protheus.doc} fTestUsr
Fun��o para teste.
@author     Jerfferson Silva
@since      22.03.2019
@version    1.0
/*/
//-------------------------------------------------------------------
User Function fTestUsr()
    
    Private	aRet  := {}

    If !ParamInf(@aRet)
        Return
    Else
        U_fAltUsr(aRet[1])
    Endif

Return

//-------------------------------------------------------------------
/*/{Protheus.doc} ParamInf
Perguntas
@author     Jerfferson Silva
@since      15.03.2019
@return     aRet, Com as respostas
/*/
//-------------------------------------------------------------------
Static Function ParamInf(aRet)

    Local	lReturn   := .T.
    Local   aPergs    := {}
    Local	cSayCEP     := Space(6)
    Local	cLoad	  := "fTestUsr"
    Local   lCanSave  := .T.
    Local   lUserSave := .T.
    Private cCadastro := "Par�metros"

    aAdd( aPergs ,{1,"Usu�rio",cSayCEP , "@!"   ,'.T.',     ,'.T.',38,.F.}) 
    If ParamBox (aPergs, "Usu�rio", @aRet,,,,,,, cLoad, lCanSave, lUserSave)
        Aadd(aRet, {.T.} )
    Else
        lReturn := .F.
    EndIf

Return (lReturn)