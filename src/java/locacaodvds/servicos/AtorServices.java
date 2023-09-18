package locacaodvds.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.dao.AtorDAO;
import locacaodvds.entidades.Ator;

/**
 *
 * @author lama
 */
public class AtorServices {

    public List<Ator> getTodos() {
        List<Ator> lista = new ArrayList<>();
        AtorDAO dao = null;

        try {
            dao = new AtorDAO();
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
