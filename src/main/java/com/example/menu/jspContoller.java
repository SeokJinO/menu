package com.example.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class jspContoller {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String list() {
        return "/writeForm";
    }
}
