

//gets all inputs  that have 'valid' in their class attribute
var GetValidationFields = function () { return document.querySelectorAll("[class*=valid]"); }

//Adds is-valid to class attribute
function AddIsValidClass(input) {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid")
}

//Adds is-invalid to class attribute
function AddIsInvalidClass(input) {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid")
}
