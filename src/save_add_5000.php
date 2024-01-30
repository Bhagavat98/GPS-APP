<?php

require_once('connection.php');
error_reporting(0);
$mainreferance = $_POST['mainreferance'];
$referance = $_POST['referance'];
$position = $_POST['position'];
$name = $_POST['name'];
$voter_id = $_POST['voter_id'];
$dob = $_POST['dob'];
$new_sponcer = $_POST['new_sponcer'];
$mobile = $_POST['mobile'];
$address = $_POST['address'];
$pin = $_POST['pin'];
$package = $_POST['package_amount'];
$reg_amt = $_POST['reg_amt'];


date_default_timezone_set('Asia/Kolkata');		
$cur_date_time = date("Y-m-d h:i:s a");

$select_add_info =mysql_query("SELECT id FROM add_info ORDER BY id DESC ");
$row_add_info = mysql_fetch_array($select_add_info);
$id_add_info = $row_add_info['id'];
$new_id_add_info = $id_add_info + 1;

$select_link =mysql_query("SELECT id FROM link ORDER BY id DESC ");
$row_link = mysql_fetch_array($select_link);
$id_link = $row_link['id'];
$new_id_link = $id_link + 1;

$fname1 = $_FILES['file1']['name'];

$fpath = 'images/';

$var1 = $fpath.$fname1;


move_uploaded_file($_FILES['file1']['tmp_name'], $fpath.$fname1);

$imgpath1 = $fpath.$fname1;

$imagepathnew1 = 'images/'.$fname1;

//$s = mysql_query("SELECT * FROM add_info WHERE uid='$mainreferance' ");
//$r = mysql_fetch_array($s);

     //$package1 = $r['package'];
    // $slink = mysql_query("SELECT * FROM link WHERE main_id = '$mainreferance' ");
	// $count_row = mysql_num_rows($slink);
	 
 //if($package1 == '5000')
 //{
	
	// if($count_row < 30)
	// {

    $refferanceid = $_POST['referance'];
	//echo $refferanceid;
	$stment = 1;
    for($i = 0; $i < $stment; $i++){

       $get_refer =  mysql_query("SELECT * FROM link WHERE cust_id = '$referance' ");
        while ($rows = mysql_fetch_array($get_refer)){
            $refferanceid = $rows['refferanceid'];
            if ($refferanceid) {
                //count of num_ref add 1
                $rowSQL = mysql_query( "SELECT MAX( num_ref ) AS max FROM `tree_diagram` WHERE cust_id = '$refferanceid' " );
                $row = mysql_fetch_array( $rowSQL );
               $largestNumber = $row['max'] +1;  //count of num_ref add 1

               if ($largestNumber < 17) {
                $insert_tree=mysql_query("INSERT INTO `tree_diagram`(`cust_id`, `ref_id`, `num_ref`) VALUES ('$refferanceid','$new_sponcer','$largestNumber')");
               } else {
                //echo "End Your Limit 16";
               }
                echo $refferanceid."<br>";
                //$num_ref_cust =  count($refferanceid);
                 $referance = $refferanceid;

            } else {
                break;
            }
        }
        $stment = 100;//for manualy increement
        }


		 $insert_link=mysql_query("insert into link(id,refferanceid,position,cust_id) values('$new_id_link','$referance','$position','$new_sponcer')");

		 if($insert_link){
		
		        $insert_add_info=mysql_query("insert into add_info(id,uid,name,voterid,dob,mobile,address,pin,package,reg_amt,datetime,img,path) values('$new_id_add_info','$new_sponcer','$name','$voter_id','$dob','$mobile','$address','$pin','$package','$reg_amt','$cur_date_time','$imagepathnew1','$fpath')");		  
		 }
	 //}
	 else{
		 //$set_id = '0';
		 echo "<script>alert('Cross the limit');</script>";
	 }
	 
	 
	 
 //}

 
//$data = array("set_id" => $set_id); 
//echo json_encode($data);

?>
<style type="text/css">

    /* this is the important part (should be used in HTML head): */
    .pagebreak {
        page-break-after: always;
    }
    .nopadding {
        padding: 0 !important;
        margin: 0 !important;
    }
    #color {
        color: red;
    }
    @media print {
        #color {
            color: red !important;
            -webkit-print-color-adjust: exact;
        }
        .col-sm-6{
            width:50%;
        }
    }
    @media screen{
        .col-sm-6{
            width:50%;
        }
    }
</style>

<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script>
    var a = ['', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ', 'Eighteen ', 'Nineteen '];
    var b = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
    $(document).ready(function () {

        inWords($('#Net_Total').val());

    });
    $(document).ready(function () {

        inWords($('#Net_Total1').val());

    });
    function numberWithCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        var z = 0;
        var len = String(x1).length;
        var num = parseInt((len / 2) - 1);

        while (rgx.test(x1)) {
            if (z > 0) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            else {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
                rgx = /(\d+)(\d{2})/;
            }
            z++;
            num--;
            if (num == 0) {
                break;
            }
        }
        return x1 + x2;
    }

    function inWords(num) {


        if ((num = num.toString()).length > 9) return 'overflow';
        n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
        if (!n) return;
        var str = '';
        str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'Crore ' : '';
        str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'Lakh ' : '';
        str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'Thousand ' : '';
        str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'Hundred ' : '';
        str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) : '';

        $('#container3').text(str);
        $('#container4').text(str);
        document.getElementById('Net_Total1').value = numberWithCommas(num) + ".00";
        document.getElementById('Net_Total').value = numberWithCommas(num) + ".00";
    }

    function printing() {
        var printButton = document.getElementById("bprint");
        var close = document.getElementById("close");
        printButton.style.visibility = 'hidden';
        close.style.visibility = 'hidden';
        window.print();

        printButton.style.visibility = 'visible';
        close.style.visibility = 'visible';
    }

    function close123() {
        window.location = 'add_5000.php';
    }

</script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<div class="container col-sm-12" >

<div class="col-xs-12 nopadding" style="border-top: 1px solid #000000;border-right: 1px solid #000000;border-left: 1px solid #000000; border-bottom: 1px solid #000000;">
    <table class="printTable" width="100%"
           style="">
        <tbody>
        <tr>
            <td style="border-bottom: hidden;border-right: hidden" align="left">
            </td>
            <td style="border-bottom: hidden;border-right: hidden" align="center">
                <label><strong style="font-size: 14px;padding-right: 5px;">Registration</strong></label>
            </td>
            <td style="border-bottom: hidden;border-right: hidden" align="right">

            </td>

        </tr>
        </tbody>
    </table>
    <div class="col-xs-12 nopadding">
        <table class="printTable" width="100%"
               style="">
            <tbody>
            <tr>

                <td style="border-bottom: hidden;border-right: hidden" align="center">
                   <?php echo $address;
                   ?>
                </td>

            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-xs-12 nopadding" style="border-top: 1px solid #000000;">

        <table class="printTable" width="100%">
            <tbody>
          
            <tr>
                <td style="border-bottom: hidden;border-right: hidden" width="50%">
                    <label style="font-size: 14px;padding-left: 5px;">Name  : <?php echo $name;?></label> </td>
                <td style="border-bottom: hidden;border-right: hidden" width="50%">
                    <label style="font-size: 14px;padding-left: 5px;">Ph.No: <?php echo $mobile;?></label></td>
            </tr>
            <tr>
               
                <td style="border-bottom: hidden;" width="50%">
                    <label style="font-size: 14px;">Date :<?php echo date("d-m-Y",strtotime($cur_date_time));?></label></td>
                 <td style="border-bottom: hidden;" width="50%">
                            <label style="font-size: 14px;">Adhar/Voter ID :<?php echo $voter_id;?></label></td>
            </tr>
			 <tr>
               
                <td style="border-bottom: hidden;" width="50%">
                    <label style="font-size: 14px;">Pin Code :<?php echo $pin;?></label></td>
                 
            </tr>
     
            
            </tbody>
        </table>
    </div>
    <div class="col-xs-12 nopadding">

        <table border='1' width='100%' height="400" align='center' bordercolor='#000000'
               style='border-collapse:collapse;border-left: hidden;border-right: hidden;font-size: 12px;'>

            <tr height="15">
                <th ><input type='text' value='Sr.No' readonly='true'
                            style='border-style : hidden;text-align: center;width:40px; font-weight:bold'/></th>
               
                <th ><input type='text' value='Referred By' readonly='true'
                            style='border-style : hidden;text-align: center;width:120px;font-weight:bold'/></th>
                <th ><input type='text' value='Name' readonly='true'
                            style='border-style : hidden;text-align: center;width:120px;font-weight:bold'/></th>
               
            </tr>
            <?php
            $result2 = mysql_query("SELECT * FROM link WHERE cust_id='$new_sponcer'");
            $count =0;
            while($row2 = mysql_fetch_array($result2))
            {
                $main_id = $row2['main_id'];
                $refferanceid = $row2['refferanceid'];
                $cust_id = $row2['cust_id'];

				
				$r_main1 = mysql_query("SELECT * FROM add_info WHERE uid = '$refferanceid' ");
				$row_main1 = mysql_fetch_array($r_main1);
				$name_main1 = $row_main1['name'];
				
				$r_main2 = mysql_query("SELECT * FROM add_info WHERE uid = '$cust_id' ");
				$row_main2 = mysql_fetch_array($r_main2);
				$name_main2 = $row_main2['name'];
				
			
                $count=$count+1;
                ?>
                <tr style="border-bottom:hidden;" height="15px;!important">
                    <td align="center"><label style="padding-top: 3px;"><?php echo $count; ?></label></td>
                   
                    <td><label style="padding-top: 3px;padding-left: 10px;"><?php echo $name_main1;?></label></td>
                    <td align="center"><label style="padding-top: 3px;"><?php echo $name_main2; ?></label></td>
                   
                  
                </tr>

            <?php } ?>
            <tr>
                <td>&nbsp;</td>
                <td></td>
                <td></td>
                <td></td>
               
               
            </tr>
           

        </table>
    </div>
    <div class="col-xs-12 nopadding">

        <table border='1' align='center' width="100%" bordercolor='#000000'
               style='border-collapse:collapse;border-right: hidden;border-left: hidden;border-top: hidden;border-bottom: hidden'>

          

        </table>

    </div>
 

</div>
</div>



</div>
<div class="col-xs-12">


    <p align="center" style='margin-bottom:1px;margin-top:10px;'>
	
	<input id="bprint" type="button" name="Submit" onclick="printing();" value="Print"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="close" type="button" name="close" onclick="close123();" value="Close"/>
    </p>
</div>