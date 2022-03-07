const $ = elem => document.querySelector(elem);

const countdown = function(_config) {
  var flag = 0;
  //var temp = "";
  const tarDate = $(_config.target).getAttribute('data-date').split('-');
  const day = parseInt(tarDate[2]);
  const month = parseInt(tarDate[1]);
  const year = parseInt(tarDate[0]);
  let tarTime = $(_config.target).getAttribute('data-time');
  let tarhour, tarmin;

  if (tarTime != null) {
    tarTime = tarTime.split(':');
    tarhour = parseInt(tarTime[0]);
    tarmin = parseInt(tarTime[1]);
  }

  let months = [31, new Date().getFullYear() % 4 == 0 ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  let dateNow = new Date();
  let dayNow = dateNow.getDate();
  let monthNow = dateNow.getMonth() + 1;
  let yearNow = dateNow.getFullYear();
  let hourNow = dateNow.getHours();
  let minNow = dateNow.getMinutes();
  let count_day = 0, count_hour = 0, count_min = 0;
  let count_day_isSet = false;
  let isOver = false;

  // Set the date we're counting down to
  const countDownDate = new Date(year, month-1, day, tarhour, tarmin, 0, 0).getTime();

  $(_config.target+' .day .word').innerHTML = _config.dayWord;
  $(_config.target+' .hour .word').innerHTML = _config.hourWord;
  $(_config.target+' .min .word').innerHTML = _config.minWord;
  $(_config.target+' .sec .word').innerHTML = _config.secWord; 


  const updateTime = () => {
    // Get todays date and time
    
    const now = new Date().getTime();

    // Find the distance between now an the count down date
    const distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    // day에 1더함으로써 지정된 시간보다 하루 더 카운트한다
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    requestAnimationFrame(updateTime);
    // If the count down is over, write some text
    if (distance < 0) {
    	//console.log($(_config.target));
     $(_config.target).innerHTML = "경매가 종료되었습니다.";
     flag = 1;
    // temp = "빙구";
     return;
    }

    $(_config.target+' .day .num').innerHTML = addZero(days);
    $(_config.target+' .hour .num').innerHTML = addZero(hours);
    $(_config.target+' .min .num').innerHTML = addZero(minutes);
    $(_config.target+' .sec .num').innerHTML = addZero(seconds);

    if(flag ==1){
  		return;
  	}
  	//console.log(temp);
    
  }
  
 	updateTime();
 	 
 	if(flag ==1){
 // console.log(temp);
  	return;
  	}
}

const addZero = (x) => (x < 10 && x >= 0) ? "0"+x : x;
