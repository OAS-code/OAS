/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entity;

/**
 *
 * @author MrTu
 */
public class Category {
    int categoryid;
    String name;
    String description;
    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    public Category(int categoryid, String name) {
        this.categoryid = categoryid;
        this.name = name;
    }

    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Category(int categoryid, String name, String description) {
        this.categoryid = categoryid;
        this.name = name;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public String getName() {
        return name;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
