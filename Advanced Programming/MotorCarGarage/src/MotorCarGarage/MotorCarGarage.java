/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MotorCarGarage;

/**
 *
 * @author x13532883
 */
public class MotorCarGarage {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("MotorCarGarage");
        System.out.println("10, Drumcondra Road");
        System.out.println("Phone: 563400");
        
        
    ArrayList<Car> carList = new ArrayList<Car>();
    Car carone = new Car("Nissan","red", 2010);
    Car cartwo = new Car("open", "white", 2015);
    Car carthree = new Car("Fiat", "blue", 2011);
    carone.printCar();
    
    carlist.add(carone);
    carlist.add(cartwo);
    carlist.add(carthree);
    
    for ( int i=0; i<carlist.size(); i++)
        carlist.get(i).printCar();
    
        
    }
    
}
