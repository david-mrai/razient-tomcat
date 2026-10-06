/***************************************************************************************
 * FILE: RegExpValidate.js   29-Julio-2004
 * VALIDATION FUNCTIONS:
 *   
 * validateEmail			- checks format of email address
 * validateUSPhone		- checks format of US phone number
 * validateNumeric		- checks for valid numeric value
 * validateRange			- checks for valid numeric range
 * validateInteger		- checks for valid integer value
 * validateNotEmpty	      - checks for blank form field
 * validateUSZip			- checks for valid US zip code
 * validateUSDate			- checks for valid date in US format
 * validateValue			- checks a string against supplied pattern
 *   
 *   FORMAT FUNCTIONS:
 *   
 * rightTrim			- removes trailing spaces from a string
 * leftTrim				- removes leading spaces from a string
 * trimAll				- removes leading and trailing spaces from a string
 * removeCurrency			- removes currency formatting characters (), $ 
 * addCurrency			- inserts currency formatting characters
 * removeCommas			- removes comma separators from a number
 * addCommas			- adds comma separators to a number
 * removeCharacters		- removes characters from a string that match passed pattern
 *   
 **************************************************************************************
 * DESCRIPTION: Validates that a string contains a 
 *   valid email pattern. 
 *   
 *  PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *    
 * REMARKS: Accounts for email with country appended
 *   does not validate that email contains valid URL
 *   type (.com, .gov, etc.) or valid country suffix.
 *
 *   ----- Valor Original 29/07/2004 -------
 *   var objRegExp  = /(^[a-z]([a-z_\.]*)@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;
 * 
 **************************************************************************************/
function validateEmail( strValue)
{
    var objRegExp  = /(^[a-z0-9._%-]([a-z0-9._%-\.]*)@([a-z0-9._%-\.]*)([.][a-z]{3})$)|(^[a-z0-9._%-]([a-z0-9._%-\.]*)@([a-z0-9._%-\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;
    //check for valid email
    return objRegExp.test(strValue);
}


/*******************************************************
 * DESCRIPTION: Validates that a string contains valid
 *   US phone pattern. 
 *   Ex. (999) 999-9999 or (999)999-9999
 *   
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 ******************************************************/
function validateUSPhone( strValue )
{
    var objRegExp  = /^\([1-9]\d{2}\)\s?\d{3}\-\d{4}$/;
    //check for valid us phone with or without space between area code
    return objRegExp.test(strValue); 
}


/******************************************************************************
 * DESCRIPTION: Validates that a string contains only valid decimal numbers.
 * 
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *******************************************************************************/
function  validateNumeric( strValue )
{
    var aValue = false;
    var objRegExp  =  /(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?\.\d\d*$)/; 
    //check for numeric characters 
    var eval = objRegExp.test(strValue);
    if ( eval ) {
        if (strValue.indexOf(".") == -1 && strValue != 0){  
            // Decimal Dot
            alert("You need to include (.) decimals");
            aValue = !eval;
        } 
        else { 
            aValue = eval;
        }
    }
    return aValue;
}


/******************************************************************************
 * DESCRIPTION: Validates that a string is between one valid range.
 * 
 * PARAMETERS:
 *    strRGValue  - String that contains Evaluation Type
 *    strValueLow - String that contains Low value
 *    strValueHig - String that contains Hig value
 *    strValue    - String that contains the value to evaluate  
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *******************************************************************************/
function  validateRange( strRGValue, strValueLow, strValueHigh, strValue )
{
    var txt = strValue;
    var aValue = false;
	
    switch (strRGValue){
        case "1":
            if (txt == strValueLow){ // A = X
                aValue = true;
            } 
 		else {
                aValue = false;
            }
            break
        case "2":
            if (txt != strValueLow){ // A <> X
                aValue = true;
            } 
 		else{
                aValue = false;
            }
            break
        case "3":
 		if (txt < strValueLow){ // A < X
                aValue = true;
            } 
 		else{
                aValue = false;
            }
            break
        case "4":
 		if (txt <= strValueLow){ // A <= X
                aValue = true;
            } 
 		else {
                aValue = false;
            }
            break
        case "5":
 		if (txt > strValueLow){ // A > X
                aValue = true;
            } 
 		else {
                aValue = false;
            }
            break
        case "6":
 		if (txt >= strValueLow){ // A >= X
                aValue = true;
            } 
 		else {
                aValue = false;
            }
            break
        case "7":
 		if (strValueLow < txt && txt < strValueHigh){ // X < A < Y
                aValue = true; 
            }
 		else{
                aValue = false;
            }
            break
        case "8":
 		if (strValueLow < txt && txt <= strValueHigh){ // X < A <= Y
                aValue = true; 
            }
 		else {
                 aValue = false;
            }
            break
        case "9":
 		if (strValueLow <= txt && txt < strValueHigh){ // X <= A < Y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
            break
        case "10":
 		if (strValueLow <= txt && txt <= strValueHigh){ // X <= A <= y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
 		break
        case "11":
 		if (strValueLow > txt && txt > strValueHigh){ // X > A > Y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
            break
        case "12":
 		if (strValueLow > txt && txt >= strValueHigh){ // X > A >= Y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
            break
        case "13":
 		if (strValueLow >= txt && txt > strValueHigh){ // X >= A > y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
            break
        case "14":
 		if (strValueLow >= txt && txt >= strValueHigh){ // X >= A >= Y
                aValue = true; 
            } 
 		else{
                aValue = false;
            }
            break
    }
    return aValue;   
}

/*****************************************************
 * DESCRIPTION: Validates that a string contains only 
 *     valid integer number.
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 ***************************************************/
function validateInteger( strValue )
{
    var objRegExp  = /(^-?\d\d*$)/; 
    //check for integer characters
    return objRegExp.test(strValue);
}


/****************************************************
 * DESCRIPTION: Validates that a string is not all
 *   blank (whitespace) characters.
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 ***************************************************/
function validateNotEmpty( strValue ) {

    var strTemp = strValue;
    strTemp = trimAll(strTemp);
    if(strTemp != null && strTemp.length > 0){
        return true;
    } 
    else{ 
        return false;
    }
}


/************************************************
 * DESCRIPTION: Validates that a string a United
 *   States zip code in 5 digit format or zip+4
 *   format. 99999 or 99999-9999
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 * 
 **************************************************/
function validateUSZip( strValue )
{
    var objRegExp  = /(^\d{5}$)|(^\d{5}-\d{4}$)/;
    //check for valid US Zipcode
    return objRegExp.test(strValue);
}


/********************************************************
 * DESCRIPTION: Validates that a string contains only 
 *     valid dates with 2 digit month, 2 digit day, 
 *     4 digit year. Date separator can be ., -, or /.
 *     Uses combination of regular expressions and 
 *     string parsing to validate date.
 *     Ex. mm/dd/yyyy or mm-dd-yyyy or mm.dd.yyyy
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *    
 * REMARKS:
 *    Avoids some of the limitations of the Date.parse()
 *    method such as the date separator character.
 ********************************************************/
function validateDatemmddyyyy( strValue )
{
    var objRegExp = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/;
    var aValue = false;
    //check to see if in correct format
    if( objRegExp.test(strValue) ){
        var strSeparator = strValue.substring(2,3); //find date separator
        var arrayDate = strValue.split(strSeparator); //split date into month, day, year
        //create a lookup for months not equal to Feb.
        var arrayLookup = { '01' : 31,'03' : 31, '04' : 30,'05' : 31,'06' : 30,'07' : 31,
                        '08' : 31,'09' : 30,'10' : 31,'11' : 30,'12' : 31};
        var intDay = parseInt(arrayDate[1], 10); 
    
        //check if month value and day value agree
        if(arrayLookup[arrayDate[0]] != null && (arrayDate[0] <= "12" && arrayDate[0] >= "01")) {
            if(intDay <= arrayLookup[arrayDate[0]] && intDay != 0){
                aValue = true; //found in lookup table, good date
            }
        }
        else {
            aValue = false; //not found in lookup table, bad date
        }
    
        if( aValue == false && arrayDate[0] == "02" ){
        //check for February
        //if( aValue == true ){
           var intYear = parseInt(arrayDate[2], 10);
           var intMonth = parseInt(arrayDate[0], 10);
           if( ((intYear % 4 == 0 && intDay <= 29) || (intYear % 4 != 0 && intDay <=28)) && intDay !=0){
              aValue = true; //Feb. had valid number of days
           }
        }
    }
    return aValue; //any other values, bad date
}


/********************************************************
 * DESCRIPTION: Validates that a string contains only 
 *     valid dates with  2 digit day, 2 digit month, 
 *     4 digit year. Date separator can be ., -, or /.
 *     Uses combination of regular expressions and 
 *     string parsing to validate date.
 *     Ex. dd/mm/yyyy or dd-mm-yyyy or dd.mm.yyyy
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *    
 * REMARKS:
 *    Avoids some of the limitations of the Date.parse()
 *    method such as the date separator character.
 ********************************************************/
function validateDateddmmyyyy( strValue )
{
    var objRegExp = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/;
    var aValue = false;
    //check to see if in correct format
    if(!objRegExp.test(strValue)){
        aValue = false; //doesn't match pattern, bad date
    }
    else{
        var strSeparator = strValue.substring(2,3); //find date separator
        var arrayDate = strValue.split(strSeparator); //split date into day, month, year
        //create a lookup for months not equal to Feb.
        var arrayLookup = { '01' : 31,'03' : 31, '04' : 30,'05' : 31,'06' : 30,'07' : 31,
                        '08' : 31,'09' : 30,'10' : 31,'11' : 30,'12' : 31};
        var intDay = parseInt(arrayDate[0], 10);
        //check if month value and day value agree
        if(arrayLookup[arrayDate[1]] != null && (arrayDate[1] <= "12" && arrayDate[1] >= "01")) {
            if(intDay <= arrayLookup[arrayDate[1]] && intDay != 0){
                aValue = true; //found in lookup table, good date
            }
        }
        else {
            aValue = false; //not found in lookup table, bad date
        }
        
        if( aValue == false && arrayDate[0] == "02" ){
           //check for February
           var intYear = parseInt(arrayDate[2], 10);
           var intMonth = parseInt(arrayDate[1], 10);
           if( ((intYear % 4 == 0 && intDay <= 29) || (intYear % 4 != 0 && intDay <=28)) && intDay !=0){
               aValue = true; //Feb. had valid number of days
           }
        }
    }
    return aValue; //any other values, bad date
}


/*********************************************************
 * DESCRIPTION: Validates that a string contains only 
 *     valid dates with 4 digit year, 2 digit month, 
 *     2 digit day. Date separator can be ., -, or /.
 *     Uses combination of regular expressions and 
 *     string parsing to validate date.
 *     Ex. yyyy/mm/dd or yyyy-mm-dd or yyyy.mm.dd
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *    
 * REMARKS:
 *    Avoids some of the limitations of the Date.parse()
 *    method such as the date separator character.
 *********************************************************/
function validateDateyyyymmdd( strValue )
{
    var objRegExp = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
    var aValue = false;
    //check to see if in correct format
    if(!objRegExp.test(strValue)){
        aValue = false; //doesn't match pattern, bad date
    }
    else{
        var strSeparator = strValue.substring(4,5); //find date separator
        var arrayDate = strValue.split(strSeparator); //split date into month, day, year
        //create a lookup for months not equal to Feb.
        var arrayLookup = { '01' : 31,'03' : 31, '04' : 30,'05' : 31,'06' : 30,'07' : 31,
                        '08' : 31,'09' : 30,'10' : 31,'11' : 30,'12' : 31};
        var intDay = parseInt(arrayDate[2], 10);    
        //check if month value and day value agree
        if(arrayLookup[arrayDate[1]] != null && (arrayDate[1] <= "12" && arrayDate[1] >= "01")) {
            if(intDay <= arrayLookup[arrayDate[1]] && intDay != 0){
                aValue = true; //found in lookup table, good date
            }
        }
        else {
            aValue = false; //not found in lookup table, bad date
        }
        
       if( aValue == false && arrayDate[0] == "02" ){
           //check for February
           var intYear = parseInt(arrayDate[0], 10);
           var intMonth = parseInt(arrayDate[1], 10);
           if( ((intYear % 4 == 0 && intDay <= 29) || (intYear % 4 != 0 && intDay <=28)) && intDay !=0){
              aValue = true; //Feb. had valid number of days
           }
        }
    }
    return aValue; //any other values, bad date
}


/*********************************************************
 * DESCRIPTION: Validates that a string contains only 
 *     valid hours with 2 digit hours, 2 digit minutes, 
 *     2 digit seconds. Hours separator can be : only.
 *     Uses combination of regular expressions and 
 *     string parsing to validate hour.
 *     Ex. hh:mm:ss 
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    
 * RETURNS:
 *    True if valid, otherwise false.
 *    
 *********************************************************/
function validateHour( strValue )
{
 /* var objRegExp =  /^([1-9]|1[0-2]):[0-5]\d(:[0-5]\d(\.\d{1,3})?)?$/; */
 var objRegExp =  /^(|0[0-9]|1[0-9]|2[0-3]):[0-5]\d(:[0-5]\d(\.\d{1,3})?)?$/;
 
 var aValue = false;
 //check to see if in correct format
if(!objRegExp.test(strValue)){
   aValue = false; //doesn't match pattern, bad hour
} 
 else{
   aValue = true;
 }
return aValue;
}


/************************************************
 * DESCRIPTION: Validates that a string a matches
 *   a valid regular expression value.
 *     
 * PARAMETERS:
 *    strValue - String to be tested for validity
 *    strMatchPattern - String containing a valid
 *       regular expression match pattern.
 *       
 * RETURNS:
 *    True if valid, otherwise false.
 **************************************************/
function validateValue( strValue, strMatchPattern )
{
    var objRegExp = new RegExp( strMatchPattern); 
    //check if string matches pattern
    return objRegExp.test(strValue);
}


/************************************************
 * DESCRIPTION: Trims trailing whitespace chars.
 *     
 * PARAMETERS:
 *    strValue - String to be trimmed.  
 *       
 * RETURNS:
 *    Source string with right whitespaces removed.
 **************************************************/
function rightTrim( strValue )
{
    var objRegExp = /^([\w\W]*)(\b\s*)$/;
    if(objRegExp.test(strValue)) {
        //remove trailing a whitespace characters
        strValue = strValue.replace(objRegExp, '$1');
    }
    return strValue;
}


/**************************************************
 * DESCRIPTION: Trims leading whitespace chars.
 *     
 * PARAMETERS:
 *    strValue - String to be trimmed
 *    
 * RETURNS:
 *    Source string with left whitespaces removed.
 **************************************************/
function leftTrim( strValue )
{
    var objRegExp = /^(\s*)(\b[\w\W]*)$/;
    if(objRegExp.test(strValue)) {
        //remove leading a whitespace characters
        strValue = strValue.replace(objRegExp, '$2');
    }
    return strValue;
}


/*****************************************************
 * DESCRIPTION: Removes leading and trailing spaces.
 * 
 * PARAMETERS: Source string from which spaces will
 *   be removed;
 * 
 * RETURNS: Source string with whitespaces removed.
 ****************************************************/
function trimAll( strValue )
{
    var objRegExp = /^(\s*)$/;
    //check for all spaces
    if(objRegExp.test(strValue)) {
        strValue = strValue.replace(objRegExp, '');
        if( strValue.length == 0){
            return strValue;
        }
    }
    //check for leading & trailing spaces
    objRegExp = /^(\s*)([\W\w]*)(\b\s*$)/;
    if(objRegExp.test(strValue)) {
        //remove leading and trailing whitespace characters
        strValue = strValue.replace(objRegExp, '$2');
    }
    return strValue;
}


/*************************************************************
 * DESCRIPTION: Removes currency formatting from 
 *   source string.
 *   
 * PARAMETERS: 
 *   strValue - Source string from which currency formatting
 *      will be removed;
 * 
 * RETURNS: Source string with commas removed.
 *************************************************************/
function removeCurrency( strValue )
{
    var objRegExp = /\(/;
    var strMinus = '';
    //check if negative
    if(objRegExp.test(strValue)){
        strMinus = '-';
    }
    objRegExp = /\)|\(|[,]/g;
    strValue = strValue.replace(objRegExp,'');
    if( strValue.indexOf('$') >= 0 ){
        strValue = strValue.substring(1, strValue.length);
    }
    return strMinus + strValue;
}


/************************************************
 * DESCRIPTION: Formats a number as currency.
 * 
 * PARAMETERS: 
 *   strValue - Source string to be formatted
 * 
 * REMARKS: Assumes number passed is a valid 
 *   numeric value in the rounded to 2 decimal 
 *   places.  If not, returns original value.
 **************************************************/
function addCurrency( strValue )
{
    var objRegExp = /-?[0-9]+\.[0-9]{2}$/;   
    if( objRegExp.test(strValue)) {
        objRegExp.compile('^-');
        strValue = addCommas(strValue);
        if (objRegExp.test(strValue)){
            strValue = '(' + strValue.replace(objRegExp,'') + ')';
        }
        return '$' + strValue;
    }
    else
        return strValue;
}


/************************************************
 * DESCRIPTION: Removes commas from source string.
 * 
 * PARAMETERS: 
 *   strValue - Source string from which commas will 
 *     be removed;
 * 
 * RETURNS: Source string with commas removed.
 **************************************************/
function removeCommas( strValue )
{
    var objRegExp = /,/g; //search for commas globally
    //replace all matches with empty strings
    return strValue.replace(objRegExp,'');
}


/*****************************************************
 * DESCRIPTION: Inserts commas into numeric string.
 * PARAMETERS: 
 *   strValue - source string containing commas.
 * RETURNS: String modified with comma grouping if
 *   source was all numeric, otherwise source is 
 *   returned.
 * REMARKS: Used with numbers with 2 or more decimal 
 *   places.
 ****************************************************/
function addCommasDec(strValue, strPRValue)
{
    var delimiter = ","; // replace comma if desired
    var ra = roundedDecimal(strValue, strPRValue);
    var za = preserveZeros(ra, strPRValue);
    var a = za.split('.', 2 );
    var d = a[1];
    var i = parseInt(a[0], 10);
    if(isNaN(i)){
        return '';
    }
    var minus = '';
    if(i < 0) {
        minus = '-';
    }
    i = Math.abs(i);
    var n = new String(i);
    var a = [];
    while(n.length > 3){
        var nn = n.substr(n.length-3);
        a.unshift(nn);
        n = n.substr(0,n.length-3);
    }
    if(n.length > 0) { 
        a.unshift(n); 
    }
    n = a.join(delimiter);
    if(d.length < 1) {
        strValue = n; 
    }
    else { 
        strValue = n + '.' + d;
    }
    strValue = minus + strValue;
    return strValue;
}


/****************************************************
 * DESCRIPTION: Inserts commas into numeric string.
 * PARAMETERS: 
 *   strValue - source string containing commas.
 * RETURNS: String modified with comma grouping if
 *   source was all numeric, otherwise source is 
  *  returned.
 * REMARKS: Used with integers.
 ***************************************************/
function addCommasInt(strValue)
{
    var objRegExp  = new RegExp('(-?[0-9]+)([0-9]{3})'); 
    //check for match to search criteria
    while(objRegExp.test(strValue)) {
       //replace original string with first group match, 
       //a comma, then second group match
       strValue = strValue.replace(objRegExp, '$1,$2');
    }
    return strValue;
}


/********************************************************
 * DESCRIPTION: Removes characters from a source string
 *  based upon matches of the supplied pattern.
 * 
 * PARAMETERS: 
 *   strValue - source string containing number.
 *   
 * RETURNS: String modified with characters
 *   matching search pattern removed
 *   
 * USAGE:  strNoSpaces = removeCharacters( ' sfdf  dfd', 
 *                                 '\s*')
 * *****************************************************/
function removeCharacters( strValue, strMatchPattern )
{
    var objRegExp =  new RegExp( strMatchPattern, 'gi' );
    //replace passed pattern matches with blanks
    return strValue.replace(objRegExp,'');
}

/*************************************************************
 * roundedDecimal - Used internally to round a value
 * val - The number to be rounded
 *************************************************************/
function roundedDecimal(strValue, strPRValue)
{
    var factor;
    var i;

    // round to a certain precision
    factor = 1;
    for (i=0; i<strPRValue; i++){
        factor *= 10;
    }
    strValue *= factor;
    strValue = Math.round(strValue);
    strValue /= factor;
    return (strValue);
}

/******************************************************************
 * preserveZeros - Used internally to make the number a string
 * 	that preserves zeros at the end of the number
 * val - The number
 ******************************************************************/
function preserveZeros(strValue, strPRValue)
{
    var i;
    var val = strValue;

    // make a string - to preserve the zeros at the end
    val = val + '';
    if (strPRValue <= 0){
        return val; // leave now. no zeros are necessary - v1.0.1 less than or equal
    }
    var decimalPos = val.indexOf('.');
    if (decimalPos == -1){
        val += '.';
        for (i=0; i<strPRValue; i++){
            val += '0';
        }
    }
    else {
        var actualDecimals = (val.length - 1) - decimalPos;
        var difference = strPRValue - actualDecimals;
        for (i=0; i<difference; i++){
            val += '0';
        }
    }	
    return val;
}

