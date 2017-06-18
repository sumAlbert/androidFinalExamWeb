<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <style type="text/css">
      body,html,#container{
        height: 100%;
        margin: 0px;
        position: relative;
      }
      .search{
        position: absolute;
        margin: 10px auto 0;
        width: 100%;
        z-index: 2;
        height: 2em;
      }
      #map-search{
        border-radius: .3em;
        display: block;
        padding: .5em;
        margin:0 auto;
        height: 98%;
        width: 85%;
        border: none;
        outline: none;
      }
    </style>
    <title>快速入门</title>
  </head>
  <body >
    <div class="search">
      <input id="map-search" placeholder="输入地址">
    </div>
    <div id="container" tabindex="0"></div>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=38bbb2a09a27ed6e5f188848b951d20f&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script type="text/javascript">
        var url = location.search;
        var longitude=116.480983;
        var latitude=40.0958;
        if (url.indexOf("?") != -1) {
          var str = url.substr(1);
          strs = str.split("&");
          longitude=strs[0];
          latitude=strs[1];
        }
        var map = new AMap.Map('container',{
            resizeEnable: true,
            zoom: 10,
            center: [longitude, latitude]
        });
        var autoOptions = {
            city: "北京", //城市，默认全国
            input: "map-search"//使用联想输入的input的id
        };
        autocomplete= new AMap.Autocomplete(autoOptions);
        var placeSearch = new AMap.PlaceSearch({
            city:'北京',
            map:map
        });
        AMap.event.addListener(autocomplete, "select", function(e){
            //TODO 针对选中的poi实现自己的功能
            placeSearch.search(e.poi.name)
        });
        //        function test() {
//            alert("123");
//            window.control.toastMessage("js调用android");
//            return false;
//        }
    </script>
  </body>
</html>