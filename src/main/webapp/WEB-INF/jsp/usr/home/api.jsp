<script>
        $(document).ready(function() {
            // 여러분의 OpenWeatherMap API 키
            var apiKey = 'b342d193e9fb91052ba05619ca90dc8b';
            // 현재 날씨 데이터를 가져오기 위한 API 엔드포인트
            var apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
            var cityNameKorean = '대전'; // 도시 이름 한국어 표시용
            var cityNameEnglish = 'daejeon'; // 도시 이름 영어 API 요청용
            var params = {
                q: cityNameEnglish,
                appid: apiKey,
                units: 'metric'
            };
            // 날씨 데이터를 가져오기 위한 AJAX 요청
            $.ajax({
                url: apiUrl,
                data: params,
                dataType: 'json',
                success: function(data) {
                    // 날씨 아이콘 처리
                    var weatherIcon = data.weather[0].icon;
                    var iconUrl = 'http://openweathermap.org/img/wn/' + weatherIcon + '.png';
                    $('.weather-icon').html('<img src="' + iconUrl + '">');
                    // 온도 처리
                    var temperature = Math.round(data.main.temp);
                    $('.temperature').text(temperature + '°C');
                    
                    // 습도 처리
                    var humidity = data.main.humidity;
                    $('.humidity').text('습도: ' + humidity + '%');
                    // 풍속 처리
                    var windSpeed = data.wind.speed;
                    $('.wind-speed').text('풍속: ' + windSpeed + 'm/s');
                    // 도시 이름 처리
                    $('.city').text(cityNameKorean);
                },
                error: function(xhr, status, error) {
                    // 오류 처리
                    console.error('날씨 데이터 가져오기 오류:', error);
                }
            });
        });
    </script>
     <div class="weater-container-box" style="margin-left: 5%; margin-top: 7%;">
        <div class="city" style="font-size: 30px; font-weight: 700;"></div>
        <div class="weather-icon"></div>
        <div class="temperature" style="font-size: 30px; color: red; margin-top: 40px;"></div>
        <div class="humidity" style="font-size: 18px; margin-top: 10px;"></div>
       <div class="wind-speed" style="font-size: 18px; margin-top: 10px;"></div>
</div>