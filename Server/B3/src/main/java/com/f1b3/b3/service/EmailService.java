package com.f1b3.b3.service;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.spring6.SpringTemplateEngine;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class EmailService {
    private final JavaMailSender javaMailSender;
    private final SpringTemplateEngine templateEngine;

    @Async
    public void sendEmailNotice(String email) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        try {
            String htmlContent = "<!DOCTYPE html>\n" +
                "<html lang=\"ko\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>멘토링 신청 완료</title>\n" +
                "</head>\n" +
                "<body style=\"font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;\">\n" +
                "    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width: 600px; margin: auto; background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\">\n" +
                "        <tr>\n" +
                "            <td align=\"center\" style=\"color: #003366; font-size: 24px; font-weight: bold; padding-bottom: 10px;\">\n" +
                "                [시멘토] 멘토링 신청이 완료되었습니다.\n" +
                "            </td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td align=\"center\" style=\"color: #003366; font-size: 18px; padding: 10px;\">\n" +
                "                멘토링 신청이 완료되었습니다.\n" +
                "            </td>\n" +
                "        </tr>\n" +
                "    </table>\n" +
                "</body>\n" +
                "</html>";

            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(email);
            mimeMessageHelper.setSubject("[시멘토] 멘토링 신청이 완료되었습니다.");
            mimeMessageHelper.setText(htmlContent, true);
            javaMailSender.send(mimeMessage);

            log.info("Succeeded to send Email");
        } catch (Exception e) {
            log.info("Failed to send Email...");
            throw new RuntimeException(e);
        }
    }
}
