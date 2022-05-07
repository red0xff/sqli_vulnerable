<!DOCTYPE html>
<html>
  <head>
    <title>Useless fact listing</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <div>
    <form class="form-inline mt-2 mt-md-0" action="/index.php" method="get">
      <input class="form-control mr-sm-2" type="number" placeholder="1" aria-label="id" name="id">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Query</button>
    </form>
    </div>
    <main class="container" role="main">
      <div class="jumbotron">
        <h1>Query Result</h1>
<?php
  if (isset($_GET['id']))
  {
    $fp = fsockopen("127.0.0.1", 1337, $errno, $errstr, 5);
    if (!$fp) {
      echo "<p class='alert alert-danger'>$errstr ($errno)</p>";
    } else {
      fwrite($fp, $_GET['id'] . "\n");
      if (!feof($fp))
        echo "<p class='alert alert-success'>" . htmlspecialchars(fgets($fp, 512)) . "</p>";
      fclose($fp);
    }
  }
?>
      </div>
    </main>
  </body>
</html>
