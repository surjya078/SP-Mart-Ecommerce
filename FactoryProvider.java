package com.mycompany.ecommerce.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

    public static SessionFactory factory;

    public static SessionFactory geFactory() {
        try {
            //    new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            if (factory == null) {
                factory = new Configuration()
                        .configure("hibernate.cfg.xml")
                        .buildSessionFactory();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
    }
}
