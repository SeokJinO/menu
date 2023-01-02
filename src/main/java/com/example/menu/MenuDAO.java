package com.example.menu;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuDAO {
    List<MenuDTO> getMenuList();

    void insertMenu(MenuDTO menu);

    String getRandMenu();

    void reset();
}
