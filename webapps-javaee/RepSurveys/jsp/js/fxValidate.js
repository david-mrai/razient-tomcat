/************************************************************************************
 * File: fxValidate.js   29-Junio-2004
 * This file validate all fields.
 *
 ******************************************************
 * Function: Validate for textField with Decimal
 * Format: (.00) with Dot Decimal.
 ******************************************************/	
function validateTN(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strPRValue, strFPValue)
{
    var aValue = 0;
    strValue = removeCommas( aField.value );
    var aNotEmpty = validateNotEmpty( strValue );
    
    if ( strOBValue ){
        if (!aNotEmpty){
           aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateNumeric( strValue );
        if (!retVNVal){
            aValue = 2;
        }
    }
    if ( aValue == 0 && !isNaN(parseInt(strRGValue, 10) ) && aNotEmpty ){
         var iRange = parseInt(strRGValue, 10);
         if(iRange>0 && iRange<15){      
	      if (  !isNaN(parseFloat(strRLValue)) && !isNaN(parseFloat(strRHValue)) ){
         	   var retRNVal = validateRange( strRGValue, parseFloat(strRLValue,10), parseFloat(strRHValue,10), parseFloat(strValue, 10) );
	   	   if (!retRNVal){
                  aValue = 3;
               }
            }
         }
    }
    return aValue;
}
// End Function validateTN()	


/*************************************************/
// Function: Format for textField with Decimal
// Format: add commas to Decimal value.
/*************************************************/
function formatTN(aField, strPRValue, strFPValue)
{
    aField.value = removeCommas(aField.value);
    if (strFPValue){
        aField.value = addCommasDec(aField.value, strPRValue);
    }
    return aField.value;
}
// End Function FormatTN()


/*************************************************/
// Function: Validate for textField with Integer
// Format: Without decimal places.
/*************************************************/
function validateTI(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue    = 0;
    strValue      = removeCommas( aField.value );
    var aNotEmpty = validateNotEmpty( strValue );

    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateInteger( strValue );
        if (!retVNVal){
            aValue = 2;
        }
    }
    if ( aValue == 0 && !isNaN(parseInt(strRGValue, 10) ) && aNotEmpty ){
         var iRange = parseInt(strRGValue, 10);
         if(iRange>0 && iRange<15){      
	      if (  !isNaN(parseFloat(strRLValue)) && !isNaN(parseFloat(strRHValue)) ){
         	   var retRNVal = validateRange( strRGValue, parseFloat(strRLValue,10), parseFloat(strRHValue,10), parseFloat(strValue, 10) );
	   	   if (!retRNVal){
                  aValue = 3;
               }
            }
         }
    }
    return aValue;
}
// End Function validateTI()	


/*************************************************/
// Function: Format for textField with Integer
// Format: add commas to Int value.
/*************************************************/
function formatTI(aField, strFPValue)
{
    aField.value = removeCommas(aField.value);
    if (strFPValue){
        aField.value = addCommasInt(aField.value);
    }
    return aField.value;
}
// End Function FormatTI()


/***********************************************/
// Function: Validate for textField with eMail
// Format: yyz@abcd.com
/***********************************************/
function validateTE(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue    = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateEmail( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTE()	


/*************************************************/
// Function: Validate for TextField with US Phone
// Format: (123) 456-7890
/*************************************************/
function validateTP(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateUSPhone( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTP()		


/******************************************************/
// Function: Validate for TextField with US Postal Code
// Format: 99999 or 99999-9999
/******************************************************/
function validateTPC(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateUSZip( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTPC()		


/****************************************************/
// Function: Validate for TextField with AlphaNumeric
// Format: Without Format
/****************************************************/
function validateTA(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        if(!validateValue(aField.value, '^[a-zA-Z0-9]+$')){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTA()


/*****************************************************/
// Function: Validate for TextField with Date mmddyyyy
// Format: mm/dd/yyyy or mm-dd-yyyy or mm.dd.yyyy
/*****************************************************/
function validateTD1(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDatemmddyyyy( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTD1()


/*****************************************************/
// Function: Validate for TextField with Date ddmmyyyy
// Format: dd/mm/yyyy or dd-mm-yyyy or dd.mm.yyyy
/*****************************************************/
function validateTD2(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty( aField.value );

    if ( strOBValue ){
       if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDateddmmyyyy( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTD2()


/*****************************************************/
// Function: Validate for TextField with Date yyyymmdd
// Format: yyyy/mm/dd or yyyy-mm-dd or yyyy.mm.dd
/*****************************************************/
function validateTD3(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue    = 0;
    var aNotEmpty = validateNotEmpty( aField.value );
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDateyyyymmdd( aField.value );
        if (!retVNVal){
            aValue = 2;
        }
    }
    return aValue;
}
// End Function validateTD3()


/****************************************************************************/
// Function: Validate for TextField with Date mmddyyyy hh:mm:ss
// Format: mm/dd/yyyy hh:mm:ss or mm-dd-yyyy hh:mm:ss or mm.dd.yyyy hh:mm:ss
/*****************************************************************************/
function validateTD11(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var strValue      = aField.value;
    var strSeparator  = strValue.substring(10,11); // Busca Separador DateTime
    var arrayDateTime = strValue.split(strSeparator); // Divide el Campo en mmddyyyy y hh:mm:ss
    var aDateField    = arrayDateTime[0]; // Asigna el valor de la fecha al valor del Campo, sin la Hora.
    var aTimeField    = arrayDateTime[1] // Asigna el valor de la hora al valor del campo, sin fecha.
    var aValue        = 0;
    
    var aNotEmpty = validateNotEmpty( aField.value );
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDatemmddyyyy( aDateField ); // Valida la fecha.
        if (!retVNVal){
            aValue = 2;
        }
    }	
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateHour( aTimeField ); // Valida la hora.
        if (!retVNVal){
            aValue = 3;
        }        
    }
    return aValue;
}
// End Function validateTD11()


/****************************************************************************/
// Function: Validate for TextField with Date mmddyyyy hh:mm:ss
// Format: dd/mm/yyyy hh:mm:ss or dd-mm-yyyy hh:mm:ss or dd.mm.yyyy hh:mm:ss
/*****************************************************************************/
function validateTD12(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var strValue      = aField.value;
    var strSeparator  = strValue.substring(10,11); // Busca Separador DateTime
    var arrayDateTime = strValue.split(strSeparator); // Divide el Campo en mmddyyyy y hh:mm:ss
    var aDateField    = arrayDateTime[0]; // Asigna el valor de la fecha al valor del Campo, sin la Hora.
    var aTimeField    = arrayDateTime[1] // Asigna el valor de la hora al valor del campo, sin fecha.    
    var aValue        = 0;
    
    var aNotEmpty = validateNotEmpty( aField.value );
    if ( strOBValue ){
       if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDateddmmyyyy( aDateField );
        if (!retVNVal){
            aValue = 2;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateHour( aTimeField ); // Valida la hora.
        if (!retVNVal){
            aValue = 3;
        }        
    }    
    return aValue;
}
// End Function validateTD12()

/****************************************************************************/
// Function: Validate for TextField with Date mmddyyyy hh:mm:ss
// Format: yyyy/mm/dd hh:mm:ss or yyyy-mm-dd hh:mm:ss or yyyy.mm.dd hh:mm:ss
/*****************************************************************************/
function validateTD13(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var strValue      = aField.value;
    var strSeparator  = strValue.substring(10,11); // Busca Separador DateTime
    var arrayDateTime = strValue.split(strSeparator); // Divide el Campo en mmddyyyy y hh:mm:ss
    var aDateField    = arrayDateTime[0]; // Asigna el valor de la fecha al valor del Campo, sin la Hora.
    var aTimeField    = arrayDateTime[1] // Asigna el valor de la hora al valor del campo, sin fecha.
    var aValue        = 0;
    
    var aNotEmpty = validateNotEmpty( aField.value );
    if ( strOBValue ){
        if (!aNotEmpty){
            aValue = 1;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateDateyyyymmdd( aDateField );
        if (!retVNVal){
            aValue = 2;
        }
    }
    if ( aValue == 0 && strFXValue && aNotEmpty ){
        var retVNVal = validateHour( aTimeField ); // Valida la hora.
        if (!retVNVal){
            aValue = 3;
        }        
    }        
    return aValue;
}
// End Function validateTD13()

/*****************************************************/
// Function: Validate for Select
/*****************************************************/
function validateIS(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    aValue = 0;
    if ( aField.options != null && aField.options[0].selected && strOBValue ){
        aValue = 1;
    }
    return aValue;
}
// End Function validateIS()


/*****************************************************/
// Function: Validate for Radio
/*****************************************************/
function validateRD(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var IROK = false;
    var aValue = 0;  
    if (strOBValue) {
		if (aField.length != null) {
			for (var ir=0; ir<aField.length; ir++) {
				if ( aField[ir] != null && aField[ir].checked )
					IROK=true;
			}
		} else {
				if (aField.checked) {
					IROK=true;
				}
		  }
		if (!IROK) {
			aValue = 1;
		}
    }
    return aValue;
}

// End Function validateRD()

/*****************************************************/
// Function: Validate for CheckBox
/*****************************************************/
function validateCB(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var CBOK = false;
    var aValue = 0;
    if (strOBValue) {
		if (aField.length != null){
		    for (var cb=0; cb<aField.length; cb++) {
				if ( aField[cb] != null && aField[cb].checked)
					CBOK=true;
			}
		} else {
				if (aField.checked){
					CBOK=true;
				}
			}
        if (!CBOK) {
            aValue = 1;
        }
    }
    return aValue;
}

// End Function validateCB()

/****************************************************/
// Function: Validate for TextArea
/****************************************************/
function validateTTA(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue = 0;
    var aNotEmpty = validateNotEmpty(aField.value);

    if (strOBValue){
        if ( !aNotEmpty ){
            aValue = 1;
        }
    }
    return aValue;
}
// End Function validateTTA()


/****************************************************/
// Function: Validate for TextField 
// Format: Without Format
/****************************************************/
function validateTX(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue)
{
    var aValue    = 0;
    var aNotEmpty = null;

    if( aField != null){
       aNotEmpty = validateNotEmpty( aField.value );    
       if (strOBValue){
          if ( !aNotEmpty ){
              aValue = 1;
          }
       }
    }
    return aValue;
}
// End Function validateTA()

/****************************************************/
// Function: Validate for TimeClock
// Format: Without Format
/****************************************************/
function validateTimeClock(strTime)
{	
	var objRegExp =  /^(|0[0-9]|1[0-9]|2[0-3]):[0-5]\d(:[0-5]\d(\.\d{1,3})?)?$/;
	var aValue = false;
	 //check to see if in correct format
	if(!objRegExp.test(strTime)){
 	  	aValue = false; //doesn't match pattern, bad hour
	} 
 	else{
   		aValue = true;
 	}
return aValue;
}
// End Function validateTimeClock()