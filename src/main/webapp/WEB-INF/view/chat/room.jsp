<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>VIEWCHAT</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function messagelog() {
	$('#chatView').empty()
	$.ajax({
		url: 'log/' + '${chatRoom.roomNum}'
		}).done(messages => {
			if(messages.length) {
				const chatList = []
				
				$.each(messages, (i, message) => {
					if('${userId}' != `\${message.userId}`) {
						chatList.push(
							`<li class='mt-3 w-75'>
		                        <div class='row m-1'>
		                            <span class='p-1 border'>
		                            	\${message.message}
		                            </span>
		                        </div>
		                        <small class='row small time ml-1'>\${message.messageRegTime}</small>
		                    </li>`)
					} else {
						chatList.push(
							`<li class='w-100 mt-3'>
		                        <div class='row m-1 justify-content-end'>
		                            <span class='p-1 border sendChat'>
		                               	 \${message.message}
		                            </span>
		                        </div>
		                        <small class='row m-1 small justify-content-end time'>\${message.messageRegTime}</small>
		                    </li>`)
					}
				})
				
				$('#chatView').append(chatList.join(''));
			} else {
				$('#chatView').empty()
				$('#chatView').append('<li class="text-center w-100"><span>????????? ???????????????.</span></li>')
			} 
		})
}


$(() => {
	if(!'${chatRoom.roomNum}') {
		location.reload()
	} else {		
		messagelog()
	}
		
	$('#addMsgBtn').click(() => {
		if(!$('#msgText').val()) {
			$('#msgText').focus()
		} else {			
			$.ajax({
				url: 'sendMsg',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					userId: '${userId}',
					roomNum: '${chatRoom.roomNum}',
					message: $('#msgText').val()
				})
			}).done(messagelog)
			$('#msgText').val('')
		}
	})
	
	$('#msgText').keydown(e => {
        if(e.keyCode == 13) {
        	if(!$('#msgText').val()) {
    			$('#msgText').focus()
    		} else {			
    			$.ajax({
    				url: 'sendMsg',
    				method: 'post',
    				contentType: 'application/json',
    				data: JSON.stringify({
    					userId: '${userId}',
    					roomNum: '${chatRoom.roomNum}',
    					message: $('#msgText').val()
    				})
    			}).done(messagelog)
    			$('#msgText').val('')
    		}
		}
    })  
})
</script>
<style>
.fa-comments {
    color: black;
}

.sendMsg {
    bottom: 3.2rem;
    z-index: 1000;
}

.sendChat {
    background-color: #eee7da;
}
</style>
</head>
<body>
    <header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-center align-items-center'>
			<strong>
				${traderNickName}
			</strong>
		</div>
	</header>

	<div class="container">
		<div id='mainContent' class="row justify-content-center">
			<div class='col mt-2 min-vh-100'>
                <ul id='chatView' class='row m-1 list-unstyled'>

                </ul>
            </div>
            <div class='row justify-content-center position-fixed sendMsg w-100'>
                <input id='msgText' type='text' class='col-10 form-control' placeholder='????????? ??????????????????.'/>
                <button id='addMsgBtn' type='button' class='col-2 form-control'>
                    <i class="fa-solid fa-paper-plane"></i>
                </button>
            </div>
        </div>
	</div>

	<div class='container-fulid'>
		<nav id='navBar' class='row d-sm-none fixed-bottom border p-2'>
			<div class='col m-3 text-center'>
				<a id='goHome' href='../used' class='ml-2'>
					<i class='fa-solid fa-house fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='blind' href='../blind' class='ml-2'>
					<i class="fa-regular fa-rectangle-list fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='chat' href='/chat' class='ml-2'>
					<i class="fa-regular fa-comments fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='user' href='../user/mypage' class='ml-2'>
					<i class="fa-regular fa-user fa-xl"></i>
				</a>
			</div>
		</nav>
	</div>

	<footer class='container-fulid border mt-5 p-3'>
		<div class='row m-3'>
			<div class='col-sm-3 border d-flex justify-content-center align-items-center'>
				<div>???????????????</div>
			</div>
			<div class='col text-center m-3'>
				<span>?????? RECYLE ????????? ????????? ???????????? ????????? ?????????11 ??????????????? 6??? ????????????: ?????????</span><br>
				<span>?????????????????????: 123-45-67890 ????????????: 1212-8282(????????? ????????????)</span><br>
				<span>COPYRIGHT USE RECYLE ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</footer>   
</body>
</html>