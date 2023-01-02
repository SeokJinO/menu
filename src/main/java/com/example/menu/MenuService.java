package com.example.menu;

import java.util.List;

public interface MenuService {
    List<MenuDTO> getMenuList();

    void insertmenu(MenuDTO menu);

    String getrandmenu();

    void reset();
}
