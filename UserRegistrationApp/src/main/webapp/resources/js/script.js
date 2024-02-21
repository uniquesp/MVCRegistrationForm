// Toggle password visibility
$(document).ready(function() {
	$('#togglePassword').on('click', function() {
		const passwordInput = $('#password');
		const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
		passwordInput.attr('type', type);
	});
});
$(document).ready(function() {
	$('#toggleConfirmPassword').on('click', function() {
		const passwordInput = $('#confirmPassword');
		const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
		passwordInput.attr('type', type);
	});
});



// country state city api 
var config = {
	cUrl: 'https://api.countrystatecity.in/v1/countries',
	ckey: 'NHhvOEcyWk50N2Vna3VFTE00bFp3MjFKR0ZEOUhkZlg4RTk1MlJlaA=='
}

var countrySelect = document.querySelector('.country'),
	stateSelect = document.querySelector('.state'),
	citySelect = document.querySelector('.city')

function loadCountries() {
	let apiEndPoint = config.cUrl
	fetch(apiEndPoint, { headers: { "X-CSCAPI-KEY": config.ckey } })
		.then(Response => Response.json())
		.then(data => {
			// console.log(data);
			data.forEach(country => {
				const option = document.createElement('option')
				option.value = country.iso2
				option.textContent = country.name
				countrySelect.appendChild(option)
			})
		})
		.catch(error => console.error('Error loading countries:', error))
	stateSelect.disabled = true
	citySelect.disabled = true
	stateSelect.style.pointerEvents = 'none'
	citySelect.style.pointerEvents = 'none'
}

function loadStates() {
	stateSelect.disabled = false
	citySelect.disabled = true
	stateSelect.style.pointerEvents = 'auto'
	citySelect.style.pointerEvents = 'none'
	const selectedCountryCode = countrySelect.value
	// console.log(selectedCountryCode);
	stateSelect.innerHTML = '<option value="">Select State</option>' // for clearing the existing states
	citySelect.innerHTML = '<option value="">Select City</option>' // Clear existing city options
	fetch(`${config.cUrl}/${selectedCountryCode}/states`, { headers: { "X-CSCAPI-KEY": config.ckey } })
		.then(response => response.json())
		.then(data => {
			// console.log(data);
			data.forEach(state => {
				const option = document.createElement('option')
				option.value = state.iso2
				option.textContent = state.name
				stateSelect.appendChild(option)
			})
		})
		.catch(error => console.error('Error loading countries:', error))
}

function loadCities() {
	citySelect.disabled = false
	citySelect.style.pointerEvents = 'auto'
	const selectedCountryCode = countrySelect.value
	const selectedStateCode = stateSelect.value
	// console.log(selectedCountryCode, selectedStateCode);
	citySelect.innerHTML = '<option value="">Select City</option>' // Clear existing city options
	fetch(`${config.cUrl}/${selectedCountryCode}/states/${selectedStateCode}/cities`, { headers: { "X-CSCAPI-KEY": config.ckey } })
		.then(response => response.json())
		.then(data => {
			// console.log(data);
			data.forEach(city => {
				const option = document.createElement('option')
				option.value = city.iso2
				option.textContent = city.name
				citySelect.appendChild(option)
			})
		})
}



// Password validation
function validatePassword() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	// Password requirements: at least 6 characters, 1 uppercase letter, and 1 symbol
	var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$/;
	if (password !== confirmPassword) {
		alert("Password and confirm password do not match.");
	} else if (!passwordRegex.test(password)) {
		alert("Password must have at least 6 characters with at least 1 uppercase letter and 1 symbol.");
	}
}


//Phone no validation
    function validateMobileNumber() {
        var mobileInput = document.getElementById("mobile");
        var mobileNumber = mobileInput.value;

        // Regular expression to match a 10-digit Indian mobile number
        var mobileRegex = /^[789]\d{9}$/;

        if (!mobileRegex.test(mobileNumber)) {
            // Invalid mobile number
            mobileInput.setCustomValidity("Please enter a valid 10-digit Indian mobile number.");
        } else {
            // Valid mobile number
            mobileInput.setCustomValidity("");
        }
    }


// Name Validation
  function validateName() {
        var NameInput = document.getElementById("name");
        var name = NameInput.value;

        // Regular expression to match a 10-digit Indian mobile number
        var nameRegex = /[A-Za-z]+(\s[A-Za-z]+)?/;

        if (!nameRegex.test(name)) {
            // Invalid mobile number
            NameInput.setCustomValidity("Please enter a valid 10-digit Indian mobile number.");
        } else {
            // Valid mobile number
            NameInput.setCustomValidity("");
        }
    }
    
    
  // validate mail
  function validateEmail() {
  //  var emailInput = document.getElementById("email");
  //  var email = emailInput.value;

    // Regular expression to validate email address
 //   var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

 //   if (!emailRegex.test(email)) {
        // Invalid email address
        emailInput.setCustomValidity("Please enter a valid email address.");
   // } else {
        // Valid email address
  //      emailInput.setCustomValidity.toLowerCase("");
  //  }
}

