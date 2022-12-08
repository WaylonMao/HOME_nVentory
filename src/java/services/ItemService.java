/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import database.CategoryDB;
import database.ItemDB;
import java.util.List;
import modules.Category;
import modules.Item;
import modules.User;

/**
 *
 * @author WL
 */
public class ItemService {

    private ItemDB idb;
    private User user;
    private final int PRICE_MIN = 1;
    private final int PRICE_MAX = 10000;

    public ItemService(User user) {
        this.idb = new ItemDB();
        this.user = user;
    }

    public boolean add(String itemName, Double price, User user, Integer categoryId) {
        Category category = new CategoryDB().get(categoryId);
        Item item = new Item();
        item.setCategory(category);
        item.setItemName(itemName);
        item.setOwner(user);
        item.setPrice(price);
        if (item == null || item.getCategory() == null || item.getCategory().equals("")
                || item.getItemName() == null || item.getItemName().equals("") || !item.getOwner().equals(user)) {
            return true;
        }
        if (price < PRICE_MIN || price > PRICE_MAX) {
            return true;
        }
        idb.insertItem(item);
        return false;
    }

    public boolean update(Item item) {
        if (item == null || item.getCategory() == null || item.getCategory().equals("")
                || item.getItemName() == null || item.getItemName().equals("") || !item.getOwner().equals(user)) {
            return true;
        }
        double price = item.getPrice();
        if (price < PRICE_MIN || price > PRICE_MAX) {
            return true;
        }
        idb.updateItem(item);
        return false;
    }

    public Item getItem(Integer itemID) {
        return idb.getItem(itemID);
    }

    public boolean delete(Integer itemId) {
        Item item = this.getItem(itemId);
        if (item == null || !item.getOwner().equals(user)) {
            return true;
        }
        try {
            idb.removeItem(item);
            return false;
        } catch (Exception e) {
            return true;
        }
    }
}
