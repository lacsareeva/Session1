<?php
// Database connection
$conn = new mysqli('localhost', 'root', '', 'session1');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$departments = [];
$sqlDepartments = "SELECT id, name FROM departments";
$resultDepartments = $conn->query($sqlDepartments);
if ($resultDepartments->num_rows > 0) {
    while ($row = $resultDepartments->fetch_assoc()) {
        $departments[] = $row;
    }
}

$assetGroups = [];
$sqlAssetGroups = "SELECT id, name FROM assetgroups";
$resultAssetGroups = $conn->query($sqlAssetGroups);
if ($resultAssetGroups->num_rows > 0) {
    while ($row = $resultAssetGroups->fetch_assoc()) {
        $assetGroups[] = $row;
    }
}

$locations = [];
$SqlLocations = "SELECT id, name FROM locations";
$resultlocations = $conn->query($SqlLocations);
if ($resultAssetGroups->num_rows > 0) {
    while ($row = $resultlocations->fetch_assoc()) {
        $locations[] = $row;
    }
}


$Employees = [];
$SqlEmployees = "SELECT id, firstname, lastname FROM employees";
$resultEmployees = $conn->query($SqlEmployees);
if ($resultAssetGroups->num_rows > 0) {
    while ($row = $resultEmployees->fetch_assoc()) {
        $Employees[] = $row;
    }
}


$query = "SELECT * FROM assets";
$result = mysqli_query($conn, $query);

if ($result) {
    // Get the number of rows
    $row_count = mysqli_num_rows($result);

    $row_count = $row_count + 1;
} else {
    echo "Error executing query: " . mysqli_error($conn);
}


///////////GET

if (isset($_GET['id'])) {

    $id = $_GET['id'];

    $sql =  mysqli_query($conn, "SELECT departmentlocations.*, departments.*, assets.*
    FROM assets
    JOIN departmentlocations ON assets.DepartmentLocationID = departmentlocations.ID
    JOIN departments ON departmentlocations.DepartmentID = departments.ID
    JOIN locations ON departmentlocations.LocationID = locations.ID WHERE `AssetSN`='$id'");

    $edit = mysqli_fetch_array($sql);
}


$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session 1</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>

    </style>
</head>

<body>
    <!-- Portrait -->
    <div class="Transfer-Container">
    <div class="Portrait">
    <header class="header" >
    </header>
    <div class=contain>
               <i class="fas fa-wifi"></i>
               <i class="fas fa-signal"></i>
               <i class="fas fa-battery-three-quarters"></i>
    </div>

        <form action="" id="myForm" method="POST" enctype="multipart/form-data">
            <div class="container1">
                <div class="Assetinfo">
                    <div class="header1">
                        <h4>Asset Transfer <a href="AssetCatalogue(Index).php">Back</a></h4>
                        
                    </div>
                </div>

                <div class="line"><br>
                    <div id="SA">Selected Asset</div>
                    <hr>
                </div>
                <div class="container-input">
                     <div class="assetname">
                        <label for="Asset">Asset Name</label>
                        <input id="Asset" type="text" name="ID" value="<?php echo $edit['ID']; ?>" hidden>
                        <input id="Asset" type="text" name="AssetName" value="<?php echo $edit['AssetName']; ?>" disabled>
                    </div>
                    <div class="assetname">
                    <br>
                    <label for="Asset" style="margin-right: 2px">Department</label>
                        <select name="DepartmentID" disabled>
                            <option value="">Department</option>
                            <?php foreach ($departments as $department) : ?>
                                <option value="<?php echo $department["id"]; ?>" <?php if (isset($edit["DepartmentID"]) && $edit["DepartmentID"] == $department["id"]) {
                                                                                        echo "Selected";
                                                                                    } ?>> <?php echo $department["name"]; ?> </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="assetname">
                    <br>
                        <label for="Asset" style="margin-right: 19px">Asset SN</label>
                        <input id="AssetSN" type="text" name="AssetName" value="<?php echo $edit['AssetSN']; ?>" disabled>
                    </div>
                </div>
                <div class="line">
                <br>
                    <label for="Asset" id = "DesDept">Destination Department</label><br>
                    <hr>
                </div>
                <div class="container-input">
                    <div class="assetname">
                        <select name="DistinationDepartmentID">
                            <option value="">Destination Department</option>
                            <?php foreach ($departments as $department) :
                                // remove from option
                                if (isset($edit["DepartmentID"]) && $edit["DepartmentID"] == $department["id"]) {
                                    continue;
                                }
                            ?>
                                <option value="<?php echo $department["id"]; ?>">
                                    <?php echo $department["name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="assetname">
                    <br>
                        <select name="DistinationLocationID" >
                            <option value="">Destination Location</option>
                            <?php foreach ($locations as $location) : ?>
                                <option value="<?php echo $location['id']; ?>"><?php echo $location['name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="assetname">
                    <br>
                        <label for="Asset">New Asset SN</label>
                        <input id="NewAssetSN" name="AssetSN" type="text" placeholder="dd/gg/nnnn" disabled>
                    </div>
                </div>

                <div class="container-button">
                    <div class="button-list">
                        <div><a onclick="submitForm()" class="cursor">Submit</a>               
                        <a class="cancel" href="AssetCatalogue(Index).php">Cancel</a>
                    </div>
                </div>
            </div>
        </form>
        
    <footer class="footer">
    <!-- Content within your footer -->
    </footer>

    </div>
</div>
</body>

<?php

$conn = new mysqli('localhost', 'root', '', 'session1');


if ($_SERVER["REQUEST_METHOD"] == "POST") {



    //location of data
    $Department = $_POST['DistinationDepartmentID'];
    $LocationID = $_POST['DistinationLocationID'];
    $AssetGroupID = $edit['AssetGroupID'];


    $NewAssetSN = "0$Department/0$AssetGroupID/00$Department$AssetGroupID";


    $sql = "SELECT * FROM `departmentlocations` WHERE DepartmentID = $Department AND LocationID = $LocationID";
    $result = $conn->query($sql);

    if (!$result) {
        die("Failed to execute query: " . $conn->error);
    } elseif ($result->num_rows < 1) {

        $datetoday = date("Y-m-d");
        $sql = "INSERT INTO `departmentlocations`(`DepartmentID`,`LocationID`,`StartDate`) VALUES ('$Department', '$LocationID', '$datetoday')";
        $result = $conn->query($sql);

    }

    $locate = mysqli_query($conn, "SELECT * FROM `departmentlocations` WHERE DepartmentID = $Department AND LocationID = $LocationID");
    $forlocation = mysqli_fetch_array($locate);

    $NewDepartmentID = $forlocation['ID'];


    $sql = "UPDATE `assets` SET AssetSN = '$NewAssetSN', `DepartmentLocationID` = '$NewDepartmentID' WHERE `ID` = '$id'";
    $result = $conn->query($sql);


    if ($result == TRUE) {

        //current
        $AssetID = $edit['ID'];
        $TransferDate = date('Y-m-d');
        $OldAssetSN = $edit['AssetSN'];
        $OldDepartmentID = $edit['DepartmentLocationID'];

        $sql = "INSERT INTO `assettransferlogs` (`AssetID`, `TransferDate`, `FromAssetSN`, `ToAssetSN`, `FromDepartmentLocationID`, `ToDepartmentLocationID`)
                VALUES('$AssetID', '$TransferDate', '$OldAssetSN', '$NewAssetSN', '$OldDepartmentID', '$NewDepartmentID')";
        $result = $conn->query($sql);


        if ($result == TRUE) {

            echo " <script> alert('Asset transfer successfully')</script>";
            echo "<script> window.location.href = 'AssetCatalogue(Index).php'; </script>";

        } else {

            echo "Error:" . $sql . "<br>" . $conn->error;
        }
    } else {

        echo "Error:" . $sql . "<br>" . $conn->error;
    }
}


?>
<script>
    // Submit
    function submitForm() {
        document.getElementById("myForm").submit();
    }
</script>
</html>