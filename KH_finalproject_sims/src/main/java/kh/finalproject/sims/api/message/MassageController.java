package kh.finalproject.sims.api.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MassageController {
	
	@Value("#{apikey['apikey.messageSecret']}")
	private String messageSecret;
	
	@Value("#{apikey['apikey.messageKey']}")
	private String messageKey;
	
	private DefaultMessageService messageService;
    
    
    /**
     * 단일 메시지 발송 예제
     */
	@ResponseBody
    @PostMapping("/send-one")
    public String sendOne(String phoneNum) {
		System.out.println(messageKey);
		System.out.println(messageSecret);
    	messageService = NurigoApp.INSTANCE.initialize(messageKey, messageSecret, "https://api.coolsms.co.kr");
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01027431304"); // 계정에서 등록할 발신번호 입력
        message.setTo(phoneNum); // 수신번호 입력
        message.setText("문자 테스트 "); // "SMS는 한글 45자, 영자 90자까지 입력할 수 있습니다."

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        return new Gson().toJson(response);
    }
    
   
//	try {
//	  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
//	  messageService.send(message);
//	} catch (NurigoMessageNotReceivedException exception) {
//	  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
//	  System.out.println(exception.getFailedMessageList());
//	  System.out.println(exception.getMessage());
//	} catch (Exception exception) {
//	  System.out.println(exception.getMessage());
//	}
	
}
