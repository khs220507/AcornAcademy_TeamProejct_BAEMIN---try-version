<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
/* reset css */
	a{
		text-decoration: none;
	}
		
	button{
		outline: none;	
		cursor: pointer;	/* 손가락모양 */
	}
    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body{
      display: flex;
      flex-direction: column;
      align-items: center;
      height: 100vh;
    }

    /* 헤더 */
    header{
      display: flex;
      flex: 1.5;
      justify-content:center;
      align-items: center;
      width: 1280px;

      border: 1px solid black;
	    background-color: #48D1CC;
    }
    .logo{
      flex: 2.5;
      display: flex;
      justify-content: center;
      align-items: center;
      
    }
    .logo a{
    	color: white;
    	font-size: 40px;
    }


    .info-wrap{
      flex: 5;
    }

    .address-wrap{
      width: 400px;
    	display: flex;
      margin: 0 auto;
    	justify-content: center;
    	align-items: center;
    }
    .address-wrap p{
      flex:5;
    	color: white;
    	font-size: 20px;
      cursor: pointer;
    }
    
    .address-wrap img{
     	width: 20px;
     	height: 20px;
      cursor: pointer;
     }

     .map-icon{
      margin-left: 10px;
     }


     .search-wrap{
     	width: 400px;
     	height: 35px;
      display: flex;
      align-items: center;

     	background-color: white;
     	border-radius: 10px;
     	margin: 10px auto;
     }
     .search-wrap input{
     	width: 360px;
     	height: 30px;
     	margin-left: 10px;
      
     	border: none;
     	outline:none;
     }
     .search-wrap img{
      	width: 25px;
      	height: 25px;
        cursor: pointer;
      }
    
    .login-btn-wrap{
      flex: 2.5;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-btn-wrap a{
    	color: white;
    	font-size: 30px;
    }

    /* 카카오맵 모달 */
    .kakao-map-modal{
      position: fixed;
      background-color: rgba(0,0,0,0.4);
      top: 0;
      left: 0;
      height: 100vh;  
      width: 100%; 
      
      display: none;
    }

    .kakao-map-modal-content{
      background-color: white;
      width: 500px;
      height: 400px;
      border-radius: 10px;

      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);
      padding: 20px;
      box-shadow: 0 0 15px rgba(0,0,0,0.15);
      text-align: center;
    }
    .close-btn img{
      width: 20px;
      height: 20px;
      position: absolute;
      top: 10px;
      right: 10px;
    }
    .kakao-map-wrap{
      width: 400px;
      height: 300px;
      border: 1px solid black;
      margin: 0 auto;
    }

    /* 섹션 */
    section{
      flex: 7;
      width: 1280px;
      border: 1px solid black;
    }

    /* 푸터 */
    footer{
      flex: 1.5;
      width: 1280px;
      border: 1px solid black;
    }
  </style>
</head>
<body>
 <header>
    <div class="logo">
		<a href="/final/home">배달의민족</a>
	</div>
      <div class="info-wrap">
          <div class="address-wrap">
            <p>인천 서구 가좌동</p>
            <img class="down-arrow-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEMAAABDCAYAAADHyrhzAAAACXBIWXMAAAsTAAALEwEAmpwYAAACFUlEQVR4nO3aS6iMYRzH8cchtyMWCpHYkEhu2ZIiyWVhY2FDOolkY2shnYRkYWNLOoSykJ0kFnIpSwq5lGzkFuXuo+mcKYvpeGfmzDvv+7zPp2Y5m2/N9OvfE0KSJEmSJEmSH4zBeVyv4GdNoyA7VM8DjG4UYxRuqI5fWD7cz2U+vqmGE1n+P/rF7xUmZYkxAc/Ebct/Q9RhvXhdDs3CJfH5hFmtxJiBD+Kyr+kQddgvHvcbboqs0IO7yu8nlrUcog4rhgZKmR0PIwWnxL4pmogxGa+V0+YRC1GHbcrnYugUXBP7psgKc/BFOewNnYaDiu9eW5siK4zFI8XeFEtDXrAKfxTT0dxC1OGM4nmJ3pA3TMVbxbIp9xB16FMcF0I3GTwi3yzIppjZ1Rg1WIQfXY6xOxQFjnUxRO3E0BOKAhPxvEubYkkoGmzoQowjoahwJccQL7qyKbLCbHzOKcbGUHQ4kEOIgVCi5w0POxjiYyE2RVZYid8ditEXygano98UWWEK3kS/KbLC9hGM0R/KzuC7qXY9rT2VCGWHefjaZox1IRY41EaIcyEmGIfHLYR4h2khNljdwhF5V4gVBpoIcbt2SQuxwnS8zxDiOxaG2GFPhhiHQxUYfA10Z5gQTzA+VAUWD3NEXhuqBicbhDgbqgi9Q6e7uDdFVtj6T4ydoepwFbei3hRZYS4WZP5CkiRJkiShBP4C7su4G0s4YJkAAAAASUVORK5CYII=">
            <img class="map-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAACrklEQVR4nO2Zv2sUQRTHN/6IEEliVESNdTRip51c0FYQo8FgY5NWEIREWws5LVRQRJLGwtKAYOslgn9BLAzGRkliIUZFo14sNB8ZfZhF7m7fzM3ObCRfWDjY/b55n72ZeTOzSbKm/1zAXuASMAG8AL7KZX5XgItAT1JUAYeASfQyoAeTogjYCNwBlrGX8dwGNsSG6AKeOADU+ne2xPwnbLpSlp4CrTFATHfyrVsxBrbLmMjSctAJwHOX+leVUBD7yF89IUBMsdNoDhgA2uXqB2aU3pEQIBUlxNY607W5l6XHIUBeKhIZaOA/rfDPhABZVCTS3sDfofAvhgCpNgnSqfBXQ4C8USTS38A/qPDPhQDRrK3M7NRVw7sNmFf4J0KA3FQk8vutysDukGtQCWF0PQTIcfLXsRAgm4HvOUJUgbbcQQTmYY4gD4JACMipHEFOhN5UzeYAMW9iBwMRmOEcQC4EhRAQM6V+8gjx2VT94CACc8MjyLUoEAKyG/jmAeILsDMaiMBc8QByOSqEkez+3jYB8c6Mt6QIAs43AXIuKYqAVmDaAeJ57nUDaAFeZSRyJPV8yfKsyzx7NOU/nOE3BbjFBaSkfKN/D6CB+xYg91K+9cAzhafkAjIq5rKFZwfwQZHQArDdIm5ZfKMuff69mA9Yes8qQM5YxuwV30dgk43RHKYZTdk0qFzmP3KMOWW9OgbGxTTs2OiuOl1swbWCs7JIHbdZDJpd2k9gj0ujEuekz70Gf5ZDP4Al1UchYEganXRtNBVrLAVx1+NXgCG/D2fHapNCOe1jH472JQPd0qWWfO0NZMbp9RSrU3IzOXY3enDEakBFEJqJKFVd6x55xhZZpQHY71R0AousYg1clZtjScHFymxYrrXSfc3q0yywLg3Sx+pVX4ROsaYkS78A4C8IokWKTaoAAAAASUVORK5CYII=">
          </div>
          <div class="search-wrap">
            <input type="text">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADBElEQVR4nO1YzWsTQRQfFb1Z1Ioaj+rJq1Q9W8281NpaMOhB6sG/olUQeq34PwiibW+1Z7+gaJJ5m30vhsZPBKFFb3qsVSJvE7Q7u5UknU0b2R8MISTz2/dm3sfvrVIpUqRI0bMYXCr258iMA5tZIIPAZlmTWZXP5vdZ+T1bfXlAbSdkq94JzWYGGNeAsd7CWtOMj+A1Ht9Sw/PV6h5NeA8Yf7RoeGg1bgfvnkLcvSXhAoxPOzE84gjj4gWiQ10zfhjxIJB5H2sQoacJJ6BcGtCIGTld+cz65rRmnNSM5XhHzDvh7VLYmBcxhr8B8i61wqG5NKIZ38Y48izxcGrGvG38/EhtcW87PPJ/YLMQDScznWi1iSQs4fyden1nJ3yyz3ZCk1m9WCkdc299cPVBqQyFTbsnbwMKhT6Jf4v3oUqo6oTqfJZw2AW3ZjNq94nBpWK/colGhw1XG5f8kerke9dd8qtAHoRiFScc89+yknnGJb9qaJl1J1QuDbjkHyI8Y91wzSW/AsaV9Q84V3l12CX/ec87anXn7y75VVO3/HmANDSX/MIHViIrxzG6HDohxEySNwCEXxLNAdE2ieYAYzXZKsQ46ZJfs7ltdeQHvdMH6vUdQIbC/OamcgkZA+1OLKrSBTf4OGbroaFq8YhKWgsFkrhQ6NsM56jv79OEHyze+yoJyAxrl1PN5nGnajQ/N7dL9tunD+XySZUUZIaNmaYW2r2J4OQt46GxplSSCEZEwudxI2GugpdbSlgfxzThx7jRMkdmXHVlJrY1/N/49UWYSV2X5hSMoIgZYDwbCDa72kT3/wQqXUvcCdHrms2TfxnT6dLihGs5vWE4sZm2E7tlQxv7poDxRmA0h7VQV25CIDOsjIGtvpkTw6VUrq82YixE93fPiYYjlf1y9UG/IKwB4zdN5hew+SraRuSBdNiNmhRsByc2C6hgPtrxu5QTrgD/hRNsrvS+ExSfE/IaRvUKcuRdjThB+Fn1EnJRJ1ZUr0EHb+/MJzl9V3NIihQpUijn+A1qcPW2rNhwowAAAABJRU5ErkJggg==">
          </div>
      </div>
      <div class="login-btn-wrap"><a href="">로그인</a></div>

  </header>

    <!-- 카카오맵 모달 -->
    <div class="kakao-map-modal">
      <div class="kakao-map-modal-content">
        <a class="close-btn" href=""><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg=="></a>
        <div class="kakao-map-wrap">


        </div>

      </div>
    </div>


  <section></section>
  <footer></footer>

  <script>
    // 카카오맵 모달 띄우기
    $(".map-icon").click(function(){
      $(".kakao-map-modal").fadeIn();
    });

    $(".close-btn").click(function(){
      $(".kakao-map-modal").fadeOut();
    });

  </script>

<!-- 카카오맵-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac76afb73e017bb01fa395c302f99e21"></script>
<script type="text/javascript">
	
	var container = document.querySelector('.kakao-map-modal-content .kakao-map-wrap'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
</script>

</body>
</html>