package com.example.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService{

    @Autowired
    MenuDAO menuDAO;

    @Override
    public List<MenuDTO> getMenuList() {

        return menuDAO.getMenuList();
    }

    @Override
    public void insertmenu(MenuDTO menu) {
        menuDAO.insertMenu(menu);
    }

    @Override
    public String getrandmenu() {
        return menuDAO.getRandMenu();
    }

    @Override
    public void reset() {
        menuDAO.reset();
    }
}
