<?php  
 //pagination.php  
 mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

 try{
 $connect = mysqli_connect("db", "root", "1234", "otdel_kadrov");
 }catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
 }  
 $record_per_page = 10;  
 $page = '';  
 $output = '';  
 if(isset($_POST["page"]))  
 {  
      $page = $_POST["page"];  
 }  
 else  
 {  
      $page = 1;  
 }  
 $query = "";
 $start_from = ($page - 1)*$record_per_page;  

 $a = $_POST["method"];
 if($a == 2)  
 {  
     $query = "SELECT employee.FIO, dateup, datedown, reason, salary, heads.FIO1 FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads WHERE CURDATE()< date_add(dateup, INTERVAL 3 MONTH) ORDER BY FIO LIMIT $start_from, $record_per_page;";  
 } else if ($a==1){
     $query = "SELECT employee.FIO, dateup, datedown, reason, salary, heads.FIO1 FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads LIMIT $start_from, $record_per_page;";  
 }else if($a==3){
     $query = "SELECT employee.FIO, dateup, datedown, reason, salary, heads.FIO1 FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads WHERE datedown is not null LIMIT $start_from, $record_per_page;";  
 }else if ($a==4){
     $query = "SELECT * FROM otdel_kadrov.employee right JOIN (SELECT max(dateup) as dateup, heads.FIO1 FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads GROUP BY FIO1) as t on employee.dateup = t.dateup LIMIT $start_from, $record_per_page;";  

 }
 try{
 $result = mysqli_query($connect, $query);  
 }catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
 }  
 $output .= "  
 <table class='table table-bordered  border-primary'>
 <thead>
   <tr>
     <th scope='col'>ФИО</th>
     <th scope='col'>Дата приема на работу</th>
     <th scope='col'>Дата увольнения</th>
     <th scope='col'>Причина увольнения</th>
     <th scope='col'>Размер заработной платы</th>
     <th scope='col'>Начальник</th>
   </tr>
 </thead> 
 <tbody>
 ";  
 while($row = mysqli_fetch_array($result))  
 {  
      $output .= '  
           <tr>  
                <td>'.$row["FIO"].'</td> 
                <td>'.$row["dateup"].'</td> 
                <td>'.$row["datedown"].'</td>  
                <td>'.$row["reason"].'</td>  
                <td>'.$row["salary"].'</td>  
                <td>'.$row["FIO1"].'</td>   
           </tr>  
      ';  
 }  
 $output .= '</table><br /><div align="center">';   
 if($a == 2)  { 
     $page_query = "SELECT count(*) FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads WHERE CURDATE()< date_add(dateup, INTERVAL 3 MONTH);";
 } else if ($a == 1) {
     $page_query = "SELECT count(*) FROM otdel_kadrov.employee;";  
 } else if($a == 3){
     $page_query = "SELECT count(*) FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads WHERE datedown is not null;"; 
 } else if($a == 4){
     $page_query = "SELECT count(*) FROM otdel_kadrov.employee right JOIN (SELECT  max(dateup) as dateup, heads.FIO1 FROM otdel_kadrov.employee LEFT JOIN heads on employee.head = heads.IdHeads GROUP BY FIO1) as t  on employee.dateup = t.dateup;"; 
 }
 $page_result = mysqli_query($connect, $page_query);  
 $total_records = $page_result->fetch_row()[0];
 $total_pages = ceil($total_records/$record_per_page);
 
 for($i=1; $i<=$total_pages; $i++)  
 {  
      $output .= "<span class='pagination_link' style='cursor:pointer; padding:6px; border:1px solid #ccc;' id='".$i."'>".$i."</span>";  
 }  
 $output .= '</div><br /><br />';  
 echo $output;  
 ?>  