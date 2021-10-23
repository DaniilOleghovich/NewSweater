package com.example.demo.service;

import com.example.demo.domain.Message;
import com.example.demo.domain.User;
import com.example.demo.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public void addMessage(User user, Message message, MultipartFile file) throws IOException {

        message.setAuthor(user);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }

        messageRepository.save(message);
    }

    public Iterable<Message> filterMessages(String filter) {
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        } else {
            messages = messageRepository.findAll();
        }
        return messages;
    }

    public Iterable<Message> getListOfMessages() {
        return messageRepository.findAll();
    }

}
