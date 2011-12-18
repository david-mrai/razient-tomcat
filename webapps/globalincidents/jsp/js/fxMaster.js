/************************************************************************************
 *  File: fxMaster.js   05-Mayo-2004
 *  This File evaluate all functions.
 ************************************************************************************
 * FUNCTION:    fxMaster
 * DESCRIPTION: Validates all functions. 
 * 
 * PARAMETERS:
 *  aField     - Object to evaluate
 *  strTIValue - Input Type (id code)
 *  strOBValue - Obligatory (True / False)
 *  strFXValue - Function of Evaluation for field (idFunction) (True / False)
 *  strRGValue - Range Type that's possible to evaluate
 *				1.  A  = X	
 *				2.  A != X
 *				3.  A <  X
 *				4.  A <= X
 *				5.  A >  X
 *				6.  A >= X
 *				7.  X <  A <  Y
 *				8.  X <  A <= Y
 *				9.  X <= A <  Y
 *				10. X <= A <= y
 *				11. X >  A >  Y
 *				12. X >  A >= Y
 *				13. X >= A >  y
 *				14. X >= A >= Y
 *  strRLValue - Range Low in Text field type numeric (numeric value)
 *  strRHValue - Range Hig in Text field type numeric (numeric value)
 *  strPRValue - Precision value in text field type decimal (numeric value)
 *  strFPValue - Presentation Function in text field
 *  strLGValue - N/A Because this property has been controlled with the MAXLENGTH
 **************************************************************************************
 *  Mod: Septiembre 27 del 2005
 *  Des: Inicialitation value of variable aValue to "true", because this variable return  
 *       undefinied when comparate its whith other variable.
 *  Mod: Octubre 11 del 2005
 *  Des: Add funtions T11, TD12 and TD13 for DateTime fields. 
 *  Mod: Junio 26 del 2007
 *  Des: Change messages for the update process of records
 **************************************************************************************/
function fxMaster( aField, strTIValue, strOBValue, strFXValue, strRGValue, strRLValue,
				   strRHValue, strPRValue, strFPValue, strLGValue)
{
    var aValue = true;

    /*************************************************/
    // Function: TextField Numeric with Decimal
    /*************************************************/
    if (strTIValue == "TN"){
       var retValTn = validateTN(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strPRValue, strFPValue);
	 if (retValTn == 1){
           alert("The field " + aField.name + " is empty");           
           aValue = false;
       }
       if (retValTn == 2){
            alert("The field " + aField.name + " is Invalid Decimal Number");
            aValue = false;
       }
       if (retValTn == 3){
		alert("The field " + aField.name + " is Out of Range");
		aValue = false;
 	 }
	 formatTN(aField, strPRValue, strFPValue);
    }

   /*************************************************/
   // Function: TextField Numeric with Integer
   /*************************************************/
   else if (strTIValue == "TI"){
	var retValTi = validateTI(aField, strOBValue, strFXValue, strRGValue,strRLValue, strRHValue, strFPValue);
	if (retValTi == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTi == 2){
		alert("The field " + aField.name + " is Invalid Integer");
		aValue = false;
	}
	if (retValTi == 3){
		alert("The field " + aField.name + " is Out of Range");
		aValue = false;
	}
	formatTI(aField, strFPValue);
   }

  /*************************************************/
  // Function: TextField with eMail
  /*************************************************/
   else if (strTIValue == "TE"){
	var retValTe = validateTE(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTe == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTe == 2){
		alert("The field " + aField.name + " is Invalid Email");
		aValue = false;
	}
   }

   /*************************************************/
   // Function: TextField with USPhone
   /*************************************************/
   else if (strTIValue == "TP"){
	var retValTp = validateTP(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTp == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTp == 2){
		alert("The field " + aField.name + " is Invalid Phone");
		aValue = false;
	}
   }

   /*************************************************/
   // Function: TextField with US Postal Code
   /*************************************************/
   else if (strTIValue == "TPC"){
	var retValTpc = validateTPC(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTpc == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTpc == 2){
		alert("The field " + aField.name + " is Invalid Zip Code");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextField with Alphanumeric data
  /*****************************************************/
  else if (strTIValue == "TA"){
	var retValTa = validateTA(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTa == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTa == 2){
		alert("The field " + aField.name + " is not alphaNumeric");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextField with date in format mmddyyyy
  /*****************************************************/
  else if (strTIValue == "TD1"){
	var retValTd1 = validateTD1(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd1 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd1 == 2){
		alert("The field " + aField.name + " is not Correct date");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextField with date in format ddmmyyyy
  /*****************************************************/
  else if (strTIValue == "TD2"){
	var retValTd2 = validateTD2(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd2 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd2 == 2){
		alert("The field " + aField.name + " is not Correct date");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextField with date in format yyyymmdd
  /*****************************************************/
  else if (strTIValue == "TD3"){
	var retValTd3 = validateTD3(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd3 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd3 == 2){
		alert("The field " + aField.name + " is not Correct date");
		aValue = false;
	}
  }


  /*************************************************************/
  // Function: TextField with date in format mmddyyyy hh:mm:ss
  /*************************************************************/
  else if (strTIValue == "TD11"){
  
	var retValTd11 = validateTD11(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd11 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd11 == 2){
		alert("The field " + aField.name + " is not Correct date");
		aValue = false;
	}
	if (retValTd11 == 3){
		alert("The field " + aField.name + " is not Correct hour");
		aValue = false;
	}	
  }

  /*************************************************************/
  // Function: TextField with date in format ddmmyyyy hh:mm:ss
  /*************************************************************/
  else if (strTIValue == "TD12"){
	var retValTd12 = validateTD12(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd12 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd12 == 2){
		alert("The field " + aField.name + " is not Correct date");
		aValue = false;
	}
	if (retValTd12 == 3){
		alert("The field " + aField.name + " is not Correct hour");
		aValue = false;
	}
  }

  /************************************************************/
  // Function: TextField with date in format yyyymmdd hh:mm:ss
  /************************************************************/
  else if (strTIValue == "TD13"){
	var retValTd13 = validateTD13(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTd13 == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
	if (retValTd13 == 2){
		alert("The field " + aField.name + " hasn't correct date");
		aValue = false;
	}
	if (retValTd13 == 3){
		alert("The field " + aField.name + " hasn't correct hour");
		aValue = false;
	}	
  }


  /*****************************************************/
  // Function: Evaluate Select Field
  /*****************************************************/
  else if (strTIValue == "IS"){
	var retValIs = validateIS(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValIs == 1){
		alert("Please choose a value in " + aField.name);
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: Evaluate Radio
  /*****************************************************/
  else if (strTIValue == "RD"){
	var retValRd = validateRD(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValRd == 1){
		alert("Your Radio is a required field.");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: Evaluate CheckBox
  /*****************************************************/
  else if (strTIValue == "CB"){
	var retValCb = validateCB(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValCb == 1){
		alert("Your CheckBox is a required field.");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextArea 
  /*****************************************************/
  else if (strTIValue == "TTA"){
	var retValTta = validateTTA(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTta == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
  }

  /*****************************************************/
  // Function: TextField with Text data
  /*****************************************************/
  else if (strTIValue == "TX"){
	var retValTx = validateTX(aField, strOBValue, strFXValue, strRGValue, strRLValue, strRHValue, strFPValue);
	if (retValTx == 1){
		alert("The field " + aField.name + " is empty");
		aValue = false;
	}
  }

  
  /********************************************************/
  /* Function: Confirm send to delete information         */
  /********************************************************/
  else if (strTIValue == "fxDL") {
		aValue = confirm("Are you sure you want to delete record?");
	}

  /********************************************************/
  /* Function: Confirm send to update information         */
  /********************************************************/
  else if (strTIValue == "fxUP") {
		aValue = confirm("Are you sure you want to update record?");
	}

  /********************************************************/
  /* Function: Confirm send to create information         */
  /********************************************************/
  else if (strTIValue == "fxIN") {
		aValue = confirm("Are you sure you want to create record?");
	}	

  /********************************************************/	
  if( aValue == false && aField.type == 'text'){
     aField.blur();
     aField.focus();     
     aField.select();
  }  
   return aValue;
}// End of fxMaster function


/********************************************************/
/* Function: return a Form Field array by paramField    */
/********************************************************/
function getFieldArray(form,parametro) {
    var array = new Array;
    var count = 0;
            
    for(i=0; i<form.length; i++){
       if(form[i].name == parametro){
          array[count] = form[i];
          count = count + 1;
       } 
    }
    return array;
}


/********************************************************/
/* Function: return a Form Field position by paramField */
/********************************************************/
function getFieldPosition(form,parametro) {
    for(i=0; i<form.length; i++){
        if(form[i].name == parametro){
           return i;
        }
    }
    return 0;
}

