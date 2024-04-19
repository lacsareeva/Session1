<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session 1</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>

    <div class="session-container1">
        <div class="container">
           <header class="header" >
            </header>
            <div class=contain>
               <i class="fas fa-wifi"></i>
               <i class="fas fa-signal"></i>
               <i class="fas fa-battery-three-quarters"></i>
            </div>
            <div class = "assetlist"> 
             <label>Transfer History</label><br>
             </div> 
             
            <?php
            // Database connection
            $conn = new mysqli('localhost', 'root', '', 'session1');

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            if (isset($_GET['id'])) {

                $ID = $_GET['id'];

                // Fetch asset data from database
                $sql = "SELECT departmentlocations.*, departments.Name As deparmentName , locations.Name As locationName, assettransferlogs.*, assets.*
                FROM assets
                JOIN assettransferlogs ON Assets.ID = assettransferlogs.AssetID
                JOIN departmentlocations ON assettransferlogs.FromDepartmentLocationID = departmentlocations.ID
                JOIN departments ON departmentlocations.DepartmentID = departments.ID
                JOIN locations ON departmentlocations.LocationID = locations.ID
                WHERE `AssetSN`='$ID' 
                ORDER BY `assettransferlogs`.`ID` ASC";
                $result = $conn->query($sql);

                $sql2 = "SELECT departmentlocations.*, departments.Name As deparmentName , locations.Name As locationName, assettransferlogs.*, assets.*
                FROM assets
                JOIN assettransferlogs ON Assets.ID = assettransferlogs.AssetID
                JOIN departmentlocations ON assettransferlogs.ToDepartmentLocationID = departmentlocations.ID
                JOIN departments ON departmentlocations.DepartmentID = departments.ID
                JOIN locations ON departmentlocations.LocationID = locations.ID
                WHERE `AssetSN`='$ID'
                ORDER BY `assettransferlogs`.`ID` ASC";
                $result2 = $conn->query($sql2);

                if ($result && $result2) {
                    if ($result->num_rows > 0 && $result2->num_rows > 0) {
                        while (($row = $result->fetch_assoc()) && ($row2 = $result2->fetch_assoc())) {
            ?>
            
             <div class="table-container">
               <table>
                 <thead> </thead>
                  <tbody>
                            <tr>
                            <td class="td1">
                                    <p style="font-size: 40px; margin-left: 25px;"><i class="fas fa-file-alt"></i></p>
                                </td>
                                <td class="td2">
                                    <div style="margin-left: 15px; margin-bottom: 2px">Relocation date: <?php echo $row2['TransferDate']; ?> </div>
                                    <div style="margin-left: 15px; margin-bottom: 2px"> <?php echo $row['deparmentName']; ?>, <?php echo $row['locationName']; ?> - <?php echo $row['FromAssetSN']; ?></div>
                                    <div style="margin-left: 15px"> <?php echo $row2['deparmentName']; ?>, <?php echo $row2['locationName']; ?> - <?php echo $row2['ToAssetSN']; ?></div>
                                </td>
                                 
                            </tr>
                  </tbody>
               </table>
             </div>
                    <?php
                        }
                    } else {
                        ?>
                        <label class="noAsset" >No Assets Found.</label>
                    <?php
                    }
                } else {
                    echo "Error: " . $conn->error;
                }
            } else {
                    ?>
                      <label class="noAsset" >No Asset ID specified.</label>
            <?php
            }

            // Close connection
            $conn->close();
            ?>

        <div class="button1" onclick="back()">
          
                <p>BACK</p>
          
            </div>
            <footer class="footer">
    <!-- Content within your footer -->
    </footer>
       </div>
    </div>

</body>

<script>
    function back() {
        window.location.href = "AssetCatalogue(Index).php";
    }
</script>

</html>
