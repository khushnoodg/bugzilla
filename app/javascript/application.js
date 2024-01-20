// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


var select = document.getElementById('status');
    
const selectElement = document.getElementById('bug_type');
  if (selectElement) {
    selectElement.addEventListener('change', (event) => {
       
            addOption(event.target.value);
    });
  }
  function addOption(val) {
    while (select.options.length > 0) {
        select.remove(0);
      }
        var option = document.createElement('option');
        option.value = "New";
        option.text = "New";
        var option2 = document.createElement('option');
        option2.value = "Started";
        option2.text = "Started";
        var option3 = document.createElement('option');
        if (val=="Bug") {
            option3.value = "Resolved";
            option3.text = "Resolved";
            
        }
        else if(val=="Feature"){
            option3.value = "Completed";
            option3.text = "Completed";
        } 
        select.add(option);
        select.add(option2);
        select.add(option3);
  }
  const selectElement1 = document.getElementById('projects');
  if (selectElement1) {
    selectElement1.addEventListener('change', (event) => {
      handleUserSelection(event.target.value);
    })
  }
  function handleUserSelection(val) {
    const myDiv = document.getElementById('plist');
    const xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
         myDiv.innerHTML = ""
        const data = JSON.parse(xhr.responseText);
         data.forEach(element => {
          myDiv.innerHTML += "<div style='border:1px solid black;'><a href='projects/"+element.id+"/edit'>Edit</a><br><a href='projects/"+element.id+"'>Show</a><br><strong style='color:red;'>Project Name </strong>"+element.name+"</div>";
         
         });
console.log(data);

      } else {
        console.error('Error:', xhr.status, xhr.statusText);
      }
    }
  };
  const url = '/?pid=' + val;
  xhr.open('GET', url, true);
  xhr.send();



    // Use the selectedUserId as needed
    console.log("Selected user ID:", val);
  }