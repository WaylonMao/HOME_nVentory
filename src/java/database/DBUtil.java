package database;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DBUtil {
    private static final EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("HOME_nVentoryPU");

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}
