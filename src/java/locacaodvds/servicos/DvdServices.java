package locacaodvds.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.dao.DvdDAO;
import locacaodvds.entidades.Dvd;

/**
 *
 * @author lama
 */
public class DvdServices {

    public List<Dvd> getTodos() {
        List<Dvd> lista = new ArrayList<>();
        DvdDAO dao = null;

        try {
            dao = new DvdDAO();
            lista = dao.listarTodos();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (dao != null) {
                try {
                    dao.fecharConexao();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return lista;
    }

}
