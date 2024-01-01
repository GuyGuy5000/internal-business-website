ValidateEmployee();

function ValidateEmployee() {
    let inputs = GetValidationFields();
    let valid = true;
    fieldcount = 0;

    //first name
    if (inputs[0].value.length > 30) {
        AddIsInvalidClass(inputs[0]);
        valid = false;
    }
    else {
        AddIsValidClass(inputs[0]);
        valid = true;
    }
    fieldcount++;

    //last name
    if (inputs[1].value.length > 50) {
        AddIsInvalidClass(inputs[1]);
        valid = false;
    }
    else {
        AddIsValidClass(inputs[1]);
        valid = true;
    }
    fieldcount++;

    //check that all fields were validated
    if (fieldcount != inputs.length) {
        alert("One or more fields not validated! if you are seeing this message, please alert your administrator");
        return false;
    }

    return valid;
}