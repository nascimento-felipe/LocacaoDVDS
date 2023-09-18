package locacaodvds.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaodvds.entidades.Ator;

/**
 *
 * @author lama
 */
public class AtorDAO extends DAO<Ator> {

    public AtorDAO() throws SQLException {
    }

    @Override
    public void salvar(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO "
                + " ator (nome, sobrenome, data_estreia) "
                + " VALUES (?, ?, ?);");

        stmt.setString(1, obj.getNome());
        stmt.setString(2, obj.getSobrenome());
        stmt.setDate(3, obj.getDataEstreia());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void atualizar(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE ator "
                + " SET "
                + " nome = ?, "
                + " sobrenome = ?, "
                + " data_estreia = ? "
                + " WHERE "
                + " id = ?;");

        stmt.setString(1, obj.getNome());
        stmt.setString(2, obj.getSobrenome());
        stmt.setDate(3, obj.getDataEstreia());
        stmt.setInt(4, obj.getId());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void excluir(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM ator "
                + " WHERE "
                + " id = ?;");
        
        stmt.setInt(1, obj.getId());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public List<Ator> listarTodos() throws SQLException {
        List<Ator> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM ator "
                + " ORDER BY nome, sobrenome;");

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Ator a = new Ator();

            a.setId(rs.getInt("id"));
            a.setNome(rs.getString("nome"));
            a.setSobrenome(rs.getString("sobrenome"));
            a.setDataEstreia(rs.getDate("data_estreia"));

            lista.add(a);
        }

        rs.close();
        stmt.close();

        return lista;
    }

    @Override
    public Ator obterPorId(int id) throws SQLException {
        Ator a = new Ator();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM ator "
                + " WHERE id = ?;");
        
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            a.setId(rs.getInt("id"));
            a.setNome(rs.getString("nome"));
            a.setSobrenome(rs.getString("sobrenome"));
            a.setDataEstreia(rs.getDate("data_estreia"));
        }

        rs.close();
        stmt.close();

        return a;
    }

}
