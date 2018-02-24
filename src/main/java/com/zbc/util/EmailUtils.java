package com.zbc.util;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public final class EmailUtils {

    /**
     * 发送邮件
     * @param toAddress 收件人邮箱
     * @param toNickName 昵称
     * @param subject 主题
     * @param content 内容
     * @throws UnsupportedEncodingException 字符集不支持
     * @throws MessagingException 邮件发送异常
     */
    public static void sendEmail(String toAddress,String toNickName,String subject,String content) throws UnsupportedEncodingException, MessagingException {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol","smtp");
        props.setProperty("mail.smtp.host",SendEmailConfig.EMAIL_SMTP_URL);
        props.setProperty("mail.smtp.auth","true");
        // 如果使用QQ邮箱，需要SSL验证
        // 新建邮件会话
        Session session = Session.getDefaultInstance(props);
        // 邮件对象
        MimeMessage mimeMessage = new MimeMessage(session);
        // 发送对象
        Transport transport = null;
        try {
            // 发件人
            mimeMessage.setFrom(new InternetAddress(SendEmailConfig.FROM_ADDRESS,SendEmailConfig.SEND_NICKNAME,"UTF-8"));
            // 收件人
            mimeMessage.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(toAddress,toNickName,"UTF-8"));
            // 主题
            mimeMessage.setSubject(subject,"UTF-8");
            // 内容
            mimeMessage.setContent(content,"text/html;charset=UTF-8");
            mimeMessage.saveChanges();
            // 发送邮件
            transport = session.getTransport();
            transport.connect(SendEmailConfig.FROM_ADDRESS,SendEmailConfig.EMAIL_PWD);
            transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
        } catch (MessagingException e) {
            throw new MessagingException(e.toString(),e);
        } finally {
            transport.close();
        }

    }

    private EmailUtils(){}
}
