<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Отдел кадров</title>
  </head>
  <body>
  <button type="button" class="btn btn-primary" id="all">Все</button>
  <button type="button" class="btn btn-secondary" id="time">Испытательный срок</button>
  <button type="button" class="btn btn-success" id="fared">Уволенные</button>
  <button type="button" class="btn btn-danger" id="heads">Начальники</button>
<div class="table-responsive" id="pagination_data">  </div> 
  </body>
</html>
<script>  
 $(document).ready(function(){  
      var a =1;
      load_data();  
      function load_data(page, method=1)  {    
           $.ajax({  
                url:"pagination.php",  
                method:"POST",  
                data:{
                  page:page,
                  method:method
                  },  
                success:function(data){  
                     $('#pagination_data').html(data);  
                }  
           })  
      }  
      $(document).on('click', '#all', function(){   //ALL
           a=1;
           load_data(undefined,a);  
      });  
      $(document).on('click', '#time', function(){   //TIME
           a=2;
           load_data(undefined,a);  
      });  
      $(document).on('click', '#fared', function(){   //fared
           a=3;
           load_data(undefined,a);  
      });  
      $(document).on('click', '#heads', function(){   //heads
           a=4;
           load_data(undefined,a);  
      });  
      $(document).on('click', '.pagination_link', function(){  
           var page = $(this).attr("id");  
           load_data(page,a);  
      });  
 });  
 </script>  