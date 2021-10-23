package com.example.demo.controller;

import com.example.demo.domain.Message;
import com.example.demo.domain.User;
import com.example.demo.repository.MessageRepository;
import com.example.demo.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file) throws IOException {

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

            return "/main";
        } else {
            messageService.addMessage(user, message, file);
            model.addAttribute("message", null);
            model.addAttribute("messages", messageService.getListOfMessages());

            return "redirect:/messages";
        }

    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Model model) {
        model.addAttribute("messages", messageService.filterMessages(filter));
        return "messages";
    }

    @GetMapping("/messages")
    public String getMessages(Map<String, Object> model) {
        model.put("messages", messageService.getListOfMessages());
        return "messages";
    }

}
