<p>Copyright &copy; <script>document.write(new Date().getFullYear())</script> Synergy Inc.</p>

<script>

$("form[name='header_form']").validate({
	// Specify validation rules
	rules : {
		// The key name on the left side is the name attribute
		// of an input field. Validation rules are defined
		// on the right side
		type : "required",
		value : "required",

	},
	// Specify validation error messages

	submitHandler : function(form) {
		form.submit();
	}
});

</script>