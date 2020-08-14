
	function encrypt_data(pText, init_key, init_iv) {
	    var key = CryptoJS.enc.Utf8.parse(init_key);
	    var iv = CryptoJS.enc.Utf8.parse(init_iv);
	    var cipherData = CryptoJS.AES.encrypt(pText, key, {iv: iv});
	    return cipherData;
	}
	function decrypt_data(cipherText, init_key, init_iv) {
	    var key = CryptoJS.enc.Utf8.parse(init_key);
	    var iv = CryptoJS.enc.Utf8.parse(init_iv);
	    var Data = CryptoJS.AES.decrypt(cipherText, key, {iv: iv});
	    return Data;
	
	}
	function encrypt(){ 
	       var passphrase="1234";
	       var iv = "1234";
	       var username = document.getElementById("username").value;
		   var password = document.getElementById("password").value;
	
		   if(!username){
				alert("아이디를 입력하세요.");
				document.getElementById("username").focus();
				return false;
			}
		   else if(!password){
				alert("비밀번호를 입력하세요.");
				document.getElementById("password").focus();
				return false;
			}
		   else{
	    	   var encrypt = encrypt_data(password, passphrase, iv);
	    	   var form = document.loginForm;
	    	   form.password.value=encrypt;  // 암호화 한 값으로 등록
	    	   alert(encrypt);
	    	   
			   var decrypt= decrypt_data(encrypt.toString(), passphrase, iv);
			   // var text = decrypt.toString(CryptoJS.enc.Utf8);
			   
	           return true;
		   }
	}