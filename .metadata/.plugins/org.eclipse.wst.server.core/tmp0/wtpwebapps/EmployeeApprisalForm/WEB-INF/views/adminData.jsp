<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div  id="afterData">
	 	<div>Employee Name : ${employeeDetails.name}</div>
	 	<div>Employee CTC : ${employeeDetails.ctc}</div>
	 	<div>Employee Level : ${employeeDetails.level}</div>
	 	<div>Employee designation : ${employeeDetails.designation}</div>
	 	<div>Employee email : ${employeeDetails.username}</div>
	 	
	  <label for="joiningDate">Joining Date:</label>
	  <input type="text" id="joiningDate" name="joiningDate" value="${employeeDetails.postedDate}" disabled />
	  <label for="ProcessedDate">Processed Date:</label>
	  <input type="text" id="ProcessedDate" name="ProcessedDate"  value="${employeeDetails.processedDate}" disabled />
	  <br />
	  <!-- Button to open the modal -->
	  <h4>Do you want to promote?</h4>
	  <button id="openModalBtn1">Yes</button>
	  <button id="openModalBtn2">No</button>
	
	  <!-- Modal -->
	  <div id="myModal1" class="modal">
	    <div class="modal-content">
	      <span id="close1" class="close">&times;</span>
	      <h2>Employee Details</h2>
	      <form id="employeeForm">
	        <label for="basicSalary">Current CTC:</label>
	        <input type="text" id="basicSalary" name="basicSalary" value="${employeeDetails.ctc}" disabled />
	
	        <label for="revCTC">Revised CTC:</label>
	        <input type="text" id="revCTC" name="revCTC"  value="${employeeDetails.ctc}" required />
	
	        <label for="curLevel">Current Level:</label>
	        <input type="text" id="curLevel" name="curLevel" value="${employeeDetails.level}" disabled />
	
	        <label for="level">Revised Level:</label>
	        <select id="level" name="level" required>
		        <option value="">Select Level</option>
				
				 <c:forEach begin="${Math.min(employeeDetails.level.substring(1)+1,9)}" end="9" var="level">
				    <option value="L${level}">L${level}</option>
				</c:forEach>
			
				
		          
	          <!-- Add more options for different levels -->
	        </select>
	
	        <label for="designation">Designation:</label>
	        <input type="text" id="designation" name="designation" value="${employeeDetails.designation}" required />
	
	        <button style="margin:10px 220px;" onclick="updateDatabaseYes()" >Update</button>
	      </form>
	    </div>
	  </div>
	
	  <div id="myModal2" class="modal">
	    <div class="modal-content">
	      <span id="close2" class="close">&times;</span>
	      <h2>Employee Salary Details</h2>
	      <div class="modalpart">
	        <h2>Main pay</h2>
	        <label>
	          <input type="radio" name="section1" value="basic" onclick="enableSection2('basic')" />
	          Basic
	        </label>
	        <input type="text" id="basicSalary2" name="basicSalary2" value="${employeeDetails.basic}" disabled />
	        <span style="color: rebeccapurple;" > <span id="basicper">0</span> % incremented</span>
	        <br />
	        <label>
	          <input type="radio" name="section1" value="medical" onclick="enableSection2('medical')" />
	          Medical </label><input type="text" id="medicalSalary" value="${employeeDetails.medical}" disabled />
	          <span style="color: rebeccapurple;" > <span id="medicalper">0</span> % incremented</span>
	          <br />
	        <label>
	          <input type="radio" name="section1" value="special" onclick="enableSection2('special')" />
	          Special Allowance </label><input type="text" id="specialSalary" value="${employeeDetails.specialAllowances}" disabled />
	          <span style="color: rebeccapurple;" > <span id="saper">0</span> % incremented</span>
	          <br />
	
	        <div id="sectionIndicator" style="display: none">
	          <h2 id="sectionNameIndicator">Section 2</h2>
	          <form>
	            <label for="percentageSelect">Percentage:</label>
	            <select id="percentageSelect" onchange="showManualInput()">
	              <option value="5">5%</option>
	              <option value="10">10%</option>
	              <option value="15">15%</option>
	              <option value="manual">Manual</option>
	            </select>
	            <input type="text" id="manualInput" style="display: none" onchange="manualChange()" />
	          </form>
	        </div>
	      </div>
	      <div class="modalpart">
	        <h2>secondary pay</h2>
	        <div id="inputFields">
	          <label for="pfInput">
	            <input name="section3" type="radio" id="pfInput"  onclick="enableSection3('pf')" disabled />PF:</label>
	            <input type="text" id="pfTextInput" value="${employeeDetails.pf}" disabled>
	          <br />
	
	          <label for="hraInput">
	            <input name="section3" type="radio" id="hraInput" onclick="enableSection3('hra')" disabled />HRA:</label>
	            <input type="text" id="hraTextInput" value="${employeeDetails.hra}" disabled>
	          <br />
	
	          <label for="foodInput">
	            <input name="section3" type="radio" id="foodInput"  onclick="enableSection3('food')"disabled />Food:</label>
	            <input type="text" id="foodTextInput" value="${employeeDetails.food}" disabled>
	          <br />
	
	          <label for="travelInput">
	            <input name="section3" type="radio" id="travelInput" onclick="enableSection3('travel')" disabled />Travel:</label>
	            <input type="text" id="travelTextInput" value="${employeeDetails.travel}" disabled>
	          <br />
	        </div>
	
	
	        <div id="sectionIndicator2" style="display: none">
	          <h2 id="sectionNameIndicator2">Section 4</h2>
	          <form>
	            <label for="percentageSelect2">Percentage:</label>
	            <select id="percentageSelect2" onchange="showManualInput2()" >
	              <option value="5">5%</option>
	              <option value="10">10%</option>
	              <option value="15">15%</option>
	              <option value="manual">Manual</option>
	            </select>
	            <input type="text" id="manualInput2" style="display: none" onchange="manualChange2()" />
	          </form>
	        </div>
	      </div>
	    	<button style="margin:10px 220px;" onclick="updateDatabaseNo()" >Update</button>
	    </div>
	  </div>
		
	</div>

	<script>
	
	function updateDatabaseNo(){
		var data={
				type:"no_promotion",
				eid:"${employeeDetails.empID}",
				basic:document.getElementById("basicSalary2").value,
				medical:document.getElementById("medicalSalary").value,
				sa:document.getElementById("specialSalary").value,
				hra:document.getElementById("hraTextInput").value,
				pf:document.getElementById("pfTextInput").value,
				food:document.getElementById("foodTextInput").value,
				travel:document.getElementById("travelTextInput").value
		}
		
		 $.ajax({
	    	    url: 'updateDetails.do',
	    	    type: 'POST',
	    	    dataType: 'html',
	    	    data: data,
	    	    success: function(response) {
	    	    	 closeModal2();
	    	    	 alert("User's salary is updated");
	    	    	 $('#nextContent').html(response);
	    	    },
	    	    error: function(xhr, status, error) {
	    	    	alert("User's salary is updated");
	    	    }
	    });
	}
	
	function updateDatabaseYes(){
		var data={
				type:"yes_promotion",
				eid:"${employeeDetails.empID}",
				ctc:document.getElementById("revCTC").value,
				lvl:document.getElementById("level").value,
				dsg:document.getElementById("designation").value
		}
		
		 $.ajax({
	    	    url: 'updateDetails.do',
	    	    type: 'POST',
	    	    dataType: 'html',
	    	    data: data,
	    	    success: function(response) {
	    	    	 closeModal1();
	    	    	 alert("User's is now promoted");
	    	    	 $('#nextContent').html(response);
	    	    },
	    	    error: function(xhr, status, error) {
	    	    	alert("Useris not promoted!an error occured");
	    	    }
	    });
	}
	
	
	</script>
		
  <script>
    // Get the modal element
    var modal1 = document.getElementById("myModal1");

    // Get the button that opens the modal
    var openModalBtn1 = document.getElementById("openModalBtn1");

    // Get the close button element
    var closeBtn1 = document.getElementById("close1");

    // Function to open the modal
    function openModal1() {
      modal1.style.display = "block";
    }

    // Function to close the modal
    function closeModal1() {
      modal1.style.display = "none";
    }

    openModalBtn1.addEventListener("click", openModal1);

    // Close the modal when the close button is clicked
    closeBtn1.addEventListener("click", closeModal1);

    // Close the modal when the user clicks outside the modal content
    window.addEventListener("click", function (event) {
      if (event.target == modal1) {
        closeModal1();
      }
    });

    // Submit form data
    document
      .getElementById("employeeForm")
      .addEventListener("submit", function (event) {
        event.preventDefault();

        // Retrieve form field values
        var basicSalary = document.getElementById("basicSalary").value;
        var level = document.getElementById("level").value;
        var designation = document.getElementById("designation").value;

        // Perform further actions with the form data (e.g., submit to server)
        console.log("Basic Salary: " + basicSalary);
        console.log("Level: " + level);
        console.log("Designation: " + designation);

        // Close the modal after submitting the form
        closeModal1();
      });
  </script>

  <script>
    // Get the modal element
    var modal2 = document.getElementById("myModal2");

    // Get the button that opens the modal
    var openModalBtn2 = document.getElementById("openModalBtn2");

    // Get the close button element
    var closeBtn2 = document.getElementById("close2");
	
    // Function to open the modal
    function openModal2() {
      modal2.style.display = "block";
    }

    // Function to close the modal
    function closeModal2() {
      modal2.style.display = "none";
    }

    openModalBtn2.addEventListener("click", openModal2);

    // Close the modal when the close button is clicked
    closeBtn2.addEventListener("click", closeModal2);

    // Close the modal when the user clicks outside the modal content
    window.addEventListener("click", function (event) {
      if (event.target == modal2) {
        closeModal2();
      }
    });

    // Submit form data
    document
      .getElementById("employeeForm")
      .addEventListener("submit", function (event) {
        event.preventDefault();

        // Retrieve form field values
        var basicSalary = document.getElementById("basicSalary").value;
        var level = document.getElementById("level").value;
        var designation = document.getElementById("designation").value;

        // Perform further actions with the form data (e.g., submit to server)
        console.log("Basic Salary: " + basicSalary);
        console.log("Level: " + level);
        console.log("Designation: " + designation);

        // Close the modal after submitting the form
        closeModal2();
      });
  </script>

  <script>
    // Get the modal element

    var selectedSection = null;
    function enableSection2(selection) {
      var inputFields = document.getElementById("inputFields");
      document.getElementById("sectionIndicator").style.display = "block";
      var sectionNameIndicator = document.getElementById(
        "sectionNameIndicator"
      );
      backToDefault();

      // Enable or disable input fields based on the selection
      if (selection === "basic") {
        sectionNameIndicator.innerHTML = "Basic Salary Increment";
        selectedSection = "basic";
        console.log(selectedSection);
        document.getElementById("pfInput").disabled = false;
        document.getElementById("hraInput").disabled = false;
        document.getElementById("foodInput").disabled = true;
        document.getElementById("travelInput").disabled = true;
      } else if (selection === "special") {
        sectionNameIndicator.innerHTML = "Special allowence Increment";
        selectedSection = "special";
        document.getElementById("pfInput").disabled = true;
        document.getElementById("hraInput").disabled = true;
        document.getElementById("foodInput").disabled = false;
        document.getElementById("travelInput").disabled = false;
      } else if (selection === "medical") {
        sectionNameIndicator.innerHTML = "Medical benefit Increment";
        selectedSection = "medical";
        document.getElementById("pfInput").disabled = true;
        document.getElementById("hraInput").disabled = true;
        document.getElementById("foodInput").disabled = true;
        document.getElementById("travelInput").disabled = true;
      }
    }

    function showManualInput() {
      var percentageSelect = document.getElementById("percentageSelect");
      var manualInput = document.getElementById("manualInput");

      if (percentageSelect.value === "manual") {
        manualInput.style.display = "inline-block";
      } else {
        manualInput.style.display = "none";
        changeValue(percentageSelect.value);
      }
    }

    function manualChange() {
      var manualInput = document.getElementById("manualInput");
      console.log(selectedSection, "Value: " + manualInput.value);
      changeValue(manualInput.value);
    }
    function dectwo(number) {
    	  return Number(number.toFixed(2)).toString();
    	}


    function changeValue(value) {
      console.log(selectedSection, "Value: " + value);
      if (selectedSection === "basic") {
        document.getElementById("basicSalary2").value = dectwo(${employeeDetails.basic}*(100+Number(value))/100);
        document.getElementById("basicper").innerHTML=value;
      } else if (selectedSection === "medical") {
    	  document.getElementById("medicalSalary").value = dectwo(${employeeDetails.medical}*(100+Number(value))/100);
    	  document.getElementById("medicalper").innerHTML=value;
        
      } else if (selectedSection === "special") {
    	  document.getElementById("specialSalary").value = dectwo(${employeeDetails.specialAllowances}*(100+Number(value))/100);
    	  document.getElementById("saper").innerHTML=value;
        
      }
    }

    function backToDefault(){
      document.getElementById("manualInput").value = "";
      document.getElementById("percentageSelect").value = "default";
      document.getElementById("manualInput").style.display = "none";
    }
  </script>

  <script>
    // Get the modal element

    var selectedSection2 = null;
    function enableSection3(selection) {
      document.getElementById("sectionIndicator2").style.display = "block";
      var sectionNameIndicator = document.getElementById(
        "sectionNameIndicator2"
      );
      backToDefault2();

      // Enable or disable input fields based on the selection
      if (selection === "pf") {
        sectionNameIndicator.innerHTML = "PF % of basic pay";
        selectedSection2 = "pf";

      } else if (selection === "hra") {
        sectionNameIndicator.innerHTML = "HRA % of basic pay";
        selectedSection2 = "hra";

      } else if (selection === "food") {
        sectionNameIndicator.innerHTML = "Food % of Special Allowance ";
        selectedSection2 = "food";
      }else if (selection === "travel") {
        sectionNameIndicator.innerHTML = "Travel % of Special Allowance ";
        selectedSection2 = "travel";
      }
    }

    function showManualInput2() {
      var percentageSelect2 = document.getElementById("percentageSelect2");
      var manualInput2 = document.getElementById("manualInput2");

      if (percentageSelect2.value === "manual") {
        manualInput2.style.display = "inline-block";
      } else {
        manualInput2.style.display = "none";
        changeValue2(percentageSelect2.value);
      }
    }

    function manualChange2() {
      var manualInput2 = document.getElementById("manualInput2");
      console.log(selectedSection2, "Value: " + manualInput2.value);
      changeValue2(manualInput2.value);
    }

    function changeValue2(value) {
      console.log(selectedSection2, "Value: " + value);
      if (selectedSection2 === "pf") {
        document.getElementById("pfTextInput").value = value;
      } else if (selectedSection2 === "hra") {
        document.getElementById("hraTextInput").value = value;
      }else if (selectedSection2 === "food") {
        document.getElementById("foodTextInput").value = value;
      }else if (selectedSection2 === "travel") {
        document.getElementById("travelTextInput").value = value;
      }
    }

    function backToDefault2(){
      document.getElementById("manualInput2").value = "";
      document.getElementById("percentageSelect2").value = "default";
      document.getElementById("manualInput2").style.display = "none";
    }
  </script>
   
  <!-- JavaScript code to handle modal functionality -->