package com.example.demo.service;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailSenderService mailSenderService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    private void sendMessage(User user) {
        if (user.getEmail() != null) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to Sweater! For activation your account, please, visit the http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSenderService.send(user.getEmail(), "Activation Code", message);
        }
    }

    public boolean addUser(User user) {

        if (userRepository.findByUsername(user.getUsername()) != null) {
            return false;
        }

        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        sendMessage(user);

        return true;
    }

    public boolean activateUser(String code) {

        User user = userRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActive(true);
        user.setActivationCode(null);

        userRepository.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {

        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepository.save(user);
    }

    public void updateProfile(User user, String email, String password) {
        String userEmail = user.getEmail();
        String userPassword = user.getPassword();

        boolean isEmailChanged = (email != null && !email.equals(userEmail) ||
                (userEmail != null && !userEmail.equals(email)));

        boolean isPasswordChanged = (password != null && !password.equals(userPassword) ||
                (userPassword != null && !userPassword.equals(password)));

        if (isEmailChanged) {
            user.setEmail(email);

            if (email != null) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }
        if (isPasswordChanged) {
            user.setPassword(passwordEncoder.encode(password));

            if (password != null) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        userRepository.save(user);

        if (isEmailChanged || isPasswordChanged) {
            sendMessage(user);
        }
    }
}
