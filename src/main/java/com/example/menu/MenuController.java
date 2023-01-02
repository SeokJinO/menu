package com.example.menu;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class MenuController {

    @Autowired
    final MenuService menuService;

    @GetMapping("/menulist")
    public List<MenuDTO> menuList()  {
        List<MenuDTO> list = menuService.getMenuList();
        return list;
    }

    @PostMapping("/menuinsert")
    public void insertmenu(@RequestBody MenuDTO menu) {
        menuService.insertmenu(menu);
    }

    @GetMapping("/randmenu")
    public String randmenu() {
        String randmenu = menuService.getrandmenu();
        return randmenu;
    }

    @DeleteMapping("/reset")
    public void reset() {
        menuService.reset();
    }
}
