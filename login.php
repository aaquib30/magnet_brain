<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form id="loginForm" method="POST">
            <label>Username:</label>
            <input type="text" name="username" required><br>
            <label>Password:</label>
            <input type="password" name="password" required><br>
            <button type="submit">Login</button>
        </form>
        <div id="message"></div>
    </div>

   
    <script>

    $(document).ready(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault(); // Prevent form submission

        var formData = $(this).serialize(); // Serialize the form data

        // Send AJAX request using jQuery
        $.ajax({
            url: 'login.php',
            method: 'POST',
            data: formData,
            success: function(response) {
                // Handle the response here
                if (response.status === 'success') {
                    window.location.href = 'index.php'; // Redirect to index.php on successful login
                } else {
                    $('#message').html('<div style="color: red;">' + response.message + '</div>');
                }
            },
            error: function(xhr, status, error) {
                // Handle errors here
                console.error('Error:', error); // Log the error to the console
                $('#message').html('<div style="color: red;">Error occurred while processing your request.</div>');
            }
        });
    });
});









    </script>
</body>
</html>

