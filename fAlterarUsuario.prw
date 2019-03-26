#include 'protheus.ch'

/*/{Protheus.doc} fAltUsr
Fun��o para realizar altera��es dos cadastro de usu�rios, 
utilizando o servi�o RestFull "/Users" padr�o do Protheus.
@author     Jerfferson Silva
@since      13.03.2019
/*/
User Function fAltUsr()

  Local oRestClient := Nil
  Local cUrl			  := "/rest/users/"
  Local cGetParams	:= ""
  Local nTimeOut		:= 200
  Local aHeadStr		:= {"Content-Type: application/json"}
  Local cHeaderGet	:= ""
  Local cRetWs		  := ""
  Local oObjJson		:= Nil
  Local cStrResul		:= ""
  Local cCodUsr      := ""

  cCodUsr := "001822"

  //Verifica se o parametro existe. Se n�o existir cria.
	If !ExisteSX6( "MV_XSRVREST" )
		CriarSX6( "MV_XSRVREST", "C", "Endeer�o e porta do servidor RESTFULL Protheus. Ex: http://10.201.0.14:8182", "http://10.201.0.14:8182" )
	EndIf

  oRestClient := FWRest():New(AllTrim(GetMv("MV_XSRVREST")))

  // chamada de classe REST com retorno de dados do usu�rio
  oRestClient:setPath(cUrl+cCodUsr)

  cRetWs	:= HttpGet(cUrl, cGetParams, nTimeOut, aHeadStr, @cHeaderGet)
  If !FWJsonDeserialize(cRetWs, @oObjJson)
    MsgStop("Ocorreu erro no processamento do Json.")
    Return Nil
	ElseIf AttIsMemberOf(oObjJson,"errorCode")
		MsgStop("errorCode: " + DecodeUTF8(oObjJson:errorCode) + " - errorMessage: " + DecodeUTF8(oObjJson:errorMessage))
		Return Nil
	Else
		
		cStrResult := DecodeUTF8(oObjJson:userName) + ", "
		cStrResult += DecodeUTF8(oObjJson:displayName) + ", "

		AVISO("Dados da consulta: ", cStrResult, {"Fechar"}, 2)

	EndIf

Return