ValidateCustomer();
function ValidateCustomer() {
    let inputs = GetValidationFields();
    let valid = true;
    fieldcount = 0;

    //first name
    if (inputs[0].value.length > 30) {
        AddIsInvalidClass(inputs[0]);
        valid = false;
    }
    else
        AddIsValidClass(inputs[0]);
    fieldcount++;

    //last name
    if (inputs[1].value.length > 50) {
        AddIsInvalidClass(inputs[1]);
        valid = false;
    }
    else
        AddIsValidClass(inputs[1]);
    fieldcount++;

    //phone
    const phoneRegex = new RegExp("^\\d{10}$");
    if (inputs[2].value.length != 0)
        if (inputs[2].value.length != 10 || !phoneRegex.test(inputs[2].value)) {
            AddIsInvalidClass(inputs[2]);
            valid = false;
        }
        else
            AddIsValidClass(inputs[2]);
    else
        AddIsValidClass(inputs[2]);
    fieldcount++;

    //email
    const emailRegex = new RegExp("^.+@{1}.+(\\.com|\\.ca|\\.gov|\\.net)$");
    if (inputs[3].value.length != 0)
        if (!emailRegex.test(inputs[3].value) || inputs[3].value.length > 30) {
            AddIsInvalidClass(inputs[3]);
            valid = false;
        }
        else
            AddIsValidClass(inputs[3]);
    else
        AddIsValidClass(inputs[3]);
    fieldcount++;

    //postal code
    const postalRegex = new RegExp("^[a-z]{1}[0-9]{1}[a-z]{1}[0-9]{1}[a-z]{1}[0-9]{1}$", "i");
    if (inputs[4].value.length != 0)
        if (!postalRegex.test(inputs[4].value)) {
            AddIsInvalidClass(inputs[4]);
            valid = false;
        }
        else
            AddIsValidClass(inputs[4]);
    else
        AddIsValidClass(inputs[4]);
    fieldcount++;

    //city
    if (inputs[5].value.length > 60) {
        AddIsInvalidClass(inputs[5]);
        valid = false;
    }
    else
        AddIsValidClass(inputs[5]);
    fieldcount++;

    //Address
    const addressRegex = new RegExp("^\\d{1,4}\\s+(.*\\s)*(st|ave|rd|blvd|ln){1}$", "i");
    if (inputs[6].value.length != 0)
        if (!addressRegex.test(inputs[6].value) || inputs[6].value.length > 60) {
            AddIsInvalidClass(inputs[6]);
            valid = false;
        }
        else
            AddIsValidClass(inputs[6]);
    else
        AddIsValidClass(inputs[6]);
    fieldcount++;

    //check for at least one field entered so that a completely blank customer isn't added
    let counter = 0;
    for (let input of inputs) {
        if (input.value == "")
            counter++;
    }
    if (counter == 7) {
        valid = false;
    }

    //check that all fields were validated
    if (fieldcount != inputs.length) {
        alert("One or more fields not validated! if you are seeing this message, please alert your administrator");
        return false;
    }

    return valid;
}

//used to navigate back to customer search
function BackToCustomerSearch() {
    window.location.href = "CustomerSearch.aspx";
    return false;
}