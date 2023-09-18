package locacaodvds.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.dao.ClassificacaoEtariaDAO;
import locacaodvds.entidades.ClassificacaoEtaria;

/**
 *
 * @author lama
 */
public class ClassificacaoEtariaService {

    public List<ClassificacaoEtaria> getTodos() {
        List<ClassificacaoEtaria> lista = new ArrayList<>();
        ClassificacaoEtariaDAO dao = null;

        try {
            dao = new ClassificacaoEtariaDAO();
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
