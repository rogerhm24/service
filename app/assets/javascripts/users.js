#app/assets/javascripts/users.js
$(document).ready(function() { //Document. ready makes sure the document is loaded b4 code executes
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content')); // setting the stripe public key using stripe.js, so stripe know who we are.
  // Watch for a form submission:
  $("#form-submit-btn").click(function(event) { // calling the bttn name from submit, when clicked
    event.preventDefault(); // preventing the button from summiting for a bit
    $('input[type=submit]').prop('disabled', true); // disable the button temporarily
    var error = false;
    var ccNum = $('#card_number').val(),    // varibles that user put in
        cvcNum = $('#card_code').val(),     // varibles that user put in
        expMonth = $('#card_month').val(),  // varibles that user put in
        expYear = $('#card_year').val();   // varibles that user put in

    if (!error) { // if no error send card info to stripe
      // Get the Stripe token: which is a set of numbers and letter to replace actual card info
      Stripe.createToken({
        number: ccNum, // varibles that user put in
        cvc: cvcNum,  // varibles that user put in
        exp_month: expMonth, // varibles that user put in
        exp_year: expYear // varibles that user put in
      }, stripeResponseHandler); // running this function A
    }
    return false;
  }); // form submission
  
  function stripeResponseHandler(status, response) { //actual function A
    // Get a reference to the form:
    var f = $("#new_user");

    // Get the token from the response:
    var token = response.id; // token frm sripe ( letter and numbers )

    // Add the token to the form:
    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />'); //creating another hidden field the replaces credit info.. with token

    // Submit the form:
    f.get(0).submit(); // actually summity info to our database now
  }
});

