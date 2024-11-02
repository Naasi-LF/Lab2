<?php # LOGIN HELPER FUNCTIONS.

# Function to load specified or default URL.
function load( $page = 'login.php' )
{
  # Begin URL with protocol, domain, and current directory.
  $url = 'http://' . $_SERVER[ 'HTTP_HOST' ] . dirname( $_SERVER['REQUEST_URI']) ;
  
  $Url = $_SERVER['REQUEST_URI'];
  $parts = parse_url($url);
  
  
  $newUrl = $parts['scheme'] . '://' . $parts['host'] . $parts['path'] . '/' . $page;;
  
  # Execute redirect then quit. 
  header( "Location: $newUrl" ) ; 
  exit() ;
}

# Function to check email address and password. 
function validate( $dbc, $email = '', $pwd = '')
{
  # Initialize errors array.
  $errors = array() ; 

  # Check email field.
  if ( empty( $email ) ) 
  { $errors[] = 'Enter your email address.' ; } 
  else  { $e = trim( $email ) ; }

  # Check password field.
  if ( empty( $pwd ) ) 
  { $errors[] = 'Enter your password.' ; } 
  else { $p = trim( $pwd ) ; }

  # On success retrieve user_id, first_name, and last name from 'users' database.
  if ( empty( $errors ) ) 
  {
    $stmt = $dbc->prepare("SELECT user_id, first_name, last_name FROM users WHERE email = ? AND pass = SHA1(?)");
    $stmt->bind_param('ss', $e, $p);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) 
    {
      $row = $result->fetch_assoc();
      return array( true, $row ); 
    }
    # Or on failure set error message.
    else { $errors[] = 'Email address and password not found.' ; }

    $stmt->close();
  }
  # On failure retrieve error message/s.
  return array( false, $errors ) ; 
}
