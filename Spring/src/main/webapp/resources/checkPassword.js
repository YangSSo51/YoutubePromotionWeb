
 	function checkPassword(){
		var form = document.getElementById("loginForm");
		var password1 = document.getElementById("password").value;
		var password2 = document.getElementById("passwordCheck").value;
		
		if(!password1 && !password2){
			// 비밀번호를 변경하지 않음
			alert("비밀번호를 변경하지 않음.");
			return true;
		}
		else if(password1 || password2){
			// 비밀번호를 변경함
			if(password1 == password2){
			    var passphrase="1234";
			    var iv = "1234";
				var encrypt = encrypt_data(password1, passphrase, iv);
	    		form.password.value=encrypt;  // 암호화 한 값으로 등록	   
	    		alert(encrypt); 		
				return true;
			}
			else{
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	}