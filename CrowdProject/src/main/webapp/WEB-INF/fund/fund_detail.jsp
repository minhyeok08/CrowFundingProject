<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* .thumbnail {
    border: none;
    padding: 10px;
}

.thumbnail .main_img, .thumbnail .story_img {
    width: 100%;
    height: auto;
    border-radius: 8px; 
}

.story-section {
   box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
   border-radius:8px;
} */
.thumbnail {
    border: none;
    padding: 10px;
}

.thumbnail .main_img, .thumbnail .story_img {
    width: 100%;
    height: auto;
    border-radius: 8px; 
}

.story-section {
   box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
   border-radius:8px;
}

/* Added new CSS rules */
.image-wrapper p {
   text-align:center; 
   color:#333; 
   font-size:16px; 
}

.hover-shadow:hover{
   transform: scale(1.05);
   transition-duration:.3s;
}
.story-section {
    box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
    border-radius:8px;
    padding:20px;
    background-color:#f9f9f9; /* Light grey background */
    margin-bottom:20px; /* Space between each story section */

    /* Adding overflow property */
    height: 1000px; /* Or any height that suits your design */
    overflow-y: auto; /* Will add vertical scrollbar if content is taller than the specified height */
}

/* For Chrome and Safari browsers */
.story-section::-webkit-scrollbar {  
    width: 10px;  /* Scrollbar width */
}

/* Scrollbar Track */
.story-section::-webkit-scrollbar-track {
    background: #f1f1f1;  /* Scrollbar track color */
}

/* Scrollbar Handle */
.story-section::-webkit-scrollbar-thumb {
    background: #888;  /* Scrollbar handle color */
}

/* Scrollbar Handle on hover */
.story-section::-webkit-scrollbar-thumb:hover {
    background: #555;  /* Scrollbar handle color on hover */
}
</style>
</head>
<body>
	<!-- <div class="row" id="fDetail">
		<div class="row">
			<div class="thumbnail"
				style="width: 700px; border: none; padding: 10px;">
				<img v-if="fund_detail.mainimg.startsWith('http')" :src="fund_detail.mainimg" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
				<img v-else :src="'../Fundimages/'+fund_detail.mainimg" class="main_img"
					style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
			</div>7
		</div>
		<div class="row">
			<h4>프로젝트 스토리</h4>
			<div class="thumbnail"
				style="width: 700px; border: none; padding: 10px;" v-for="img in detailimages">
				<img v-if="img.startsWith('http')" :src="img" class="main_img"
					style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
				<img v-else :src="'../Fundimages/'+img" class="main_img"
					style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
			</div>
		</div>
	</div> -->
	<div class="row" id="fDetail">
    <div class="row">
        <div class="thumbnail">
            <img v-if="fund_detail.mainimg.startsWith('http')" :src="fund_detail.mainimg" class="main_img">
            <img v-else :src="'../Fundimages/'+fund_detail.mainimg" class="main_img">
        </div>
    </div>
    <div class="row story-section">
    <hr>
        <h4 style="text-align:center">프로젝트 스토리</h4>
        
        <!-- Adding a wrapper for the image and its description -->
        <div v-for="(img, index) in detailimages" :key="'image-' + index"  class="thumbnail image-wrapper">

            <!-- Adding a hover effect on the image -->
            <img v-if="img.startsWith('http')" :src='img' class='story_img hover-shadow'>
            <img v-else :src="'../Fundimages/'+ img"  class='story_img hover-shadow'>

            

         </div>
     </div>
</div>
	<script>
	new Vue({
		 el:'#fDetail',
		 data:{
			 wfno:${wfno},
			 fund_detail:{},
			 detailimages:[],
			 no:0
		 },
		 mounted:function(){
			 axios.get('../fund/fund_detail_vue.do',{
				 params:{
					 wfno:this.wfno
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.fund_detail=response.data
				 this.detailimages=response.data.detailimg.split("^")
				 
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 }
	 })	
	</script>
</body>
</html>