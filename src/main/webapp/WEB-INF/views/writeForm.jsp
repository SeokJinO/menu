<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<style>
    .menu{

    }
</style>
<body>
<br><p>
<div class="container">
    <form action="/writeForm"></form>
    <input type="text" id="menu">
    <input type="button" onclick="addmenu()" value="추가">
    <button onclick="resultmenu()">결과</button>
    <button onclick="reset()">리셋</button>
    <button onclick="image()">사진</button>
    </form>
</div>
<div id="menuList">

</div>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $.ajax({
        async:false, // 비동기 여부 : true(비동기), false(동기)
        type:'GET',
        url: 'http://localhost:8080/menulist',
        dataType:"json", //서버에서 보내준 데이터의 타입
        contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
        success : function(data) {
            let str = '';
            $(data).each(function () {
                str += '<p>'+this.menu+'</p>'

            })
            $('#menuList').html(str);
        }
    })
    function resultmenu() {
        $.ajax({
            async:false, // 비동기 여부 : true(비동기), false(동기)
            type:'GET',
            url: 'http://localhost:8080/randmenu',
            dataType:"json", //서버에서 보내준 데이터의 타입
            contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
            success : function(data){
                alert(data);

            }
        })
        location.reload();
    }
    function image() {
        let menu = document.getElementById('menu').value;

        $.ajax({
            async:false, // 비동기 여부 : true(비동기), false(동기)
            type:'GET',
            url: 'https://dapi.kakao.com/v2/search/image?page=1&size=1&query='+menu,
            dataType:"json", //서버에서 보내준 데이터의 타입
            beforeSend : function (xhr) {
                xhr.setRequestHeader("Authorization", "KakaoAK f6bb7effc2627fa783db658cf0698901");
            },
            contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
            success : function(data){
                let a = data['documents'];

                console.log(a);
                console.log(a.height);
                console.log(data['documents'].height);

            }
        })
    }
    function addmenu() {
        let menu = document.getElementById('menu').value;
        console.log(menu);
        let obj = {
            menu : menu
        }
        $.ajax({
            async:false, // 비동기 여부 : true(비동기), false(동기)
            type:'GET',
            data: JSON.stringify(obj),
            url: 'http://localhost:8080/menuinsert',
            dataType:"json", //서버에서 보내준 데이터의 타입

            contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
            success : function(data){

            }

        })
        location.reload();
    }

    function reset() {
        $.ajax({
            async:false, // 비동기 여부 : true(비동기), false(동기)
            type:'DELETE',
            url: 'http://localhost:8080/reset',
            dataType:"json", //서버에서 보내준 데이터의 타입
            contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
            success : function(data){

            }
        })
        location.reload();
    }
</script>
</body>
</html>


{
    "documents": [
        {
        "collection": "news",
        "datetime": "2021-05-04T16:52:52.000+09:00",
        "display_sitename": "중앙일보",
        "doc_url": "http://v.media.daum.net/v/20210504165252197",
        "height": 343,
        "image_url": "https://t1.daumcdn.net/news/202105/04/joongang/20210504165252527wthv.jpg",
        "thumbnail_url": "https://search2.kakaocdn.net/argon/130x130_85_c/BvlmH2izrCT",
        "width": 496
        }
    ],
    "meta": {
    "is_end": false,
    "pageable_count": 4000,
    "total_count": 40832154
    }
}
