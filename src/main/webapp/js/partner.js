
function doFirst(){

  $(".list-group-1").click(function(){
    $(".list-group-open1").slideToggle("slow");
  })
  
  $(".list-group-2").click(function(){
    $(".list-group-open2").slideToggle("slow");
  })
 

 //document.getElementById('exampleFormControlFile1').onchange = cov_fileChange;
 //document.getElementById('exampleFormControlFile2').onchange = sta_fileChange;


}



//顯示上傳圖片預覽
function cov_fileChange() {
  let myFile = document.getElementById('exampleFormControlFile1').files[0];

  
  let readFile = new FileReader();
  readFile.readAsDataURL(myFile);
  readFile.addEventListener("load", function (e) {
    let image  = document.getElementById('cov_img');
    image.src = this.result; //src HTML標籤屬性 直接點就可以
    
    // image.width = 500 ;
    image.style.maxWidth = '300px' ;//css屬性
    image.style.maxHeight = '300px' ;
  });
}
function sta_fileChange() {
  let myFile = document.getElementById('exampleFormControlFile2').files[0];

  
  let readFile = new FileReader();
  readFile.readAsDataURL(myFile);
  readFile.addEventListener("load", function (e) {
    let image  = document.getElementById('sta_img');
    image.src = this.result; //src HTML標籤屬性 直接點就可以
    
    // image.width = 500 ;
    image.style.maxWidth = '400px' ;//css屬性
    image.style.maxHeight = '300px' ;
  });
}
window.addEventListener('load',doFirst);



