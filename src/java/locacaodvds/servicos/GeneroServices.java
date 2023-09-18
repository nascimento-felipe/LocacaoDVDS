package locacaodvds.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.dao.GeneroDAO;
import locacaodvds.entidades.Genero;

/**
 *
 * @author lama
 */
public class GeneroServices {

    public List<Genero> getTodos() {
        List<Genero> lista = new ArrayList<>();
        GeneroDAO dao = null;

        try {
            dao = new GeneroDAO();
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
