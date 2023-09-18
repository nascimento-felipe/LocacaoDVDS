package locacaodvds.dao;

import java.util.ArrayList;
import java.util.List;
import locacaodvds.entidades.Dvd;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.ClassificacaoEtaria;
import locacaodvds.entidades.Genero;

/**
 *
 * @author rifersouli
 */
public class DvdDAO extends DAO<Dvd> {

    public DvdDAO() throws SQLException {
    }

    @Override
    public void salvar(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO "
                + " dvd ( "
                + " titulo, "
                + " ano_lancamento, "
                + " ator_principal_id, "
                + " ator_coadjuvante_id, "
                + " data_lancamento, "
                + " duracao_minutos, "
                + " classificacao_etaria_id, "
                + " genero_id) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?);");

        stmt.setString(1, obj.getTitulo());
        stmt.setInt(2, obj.getAnoLancamento());
        stmt.setInt(3, obj.getAtorPrincipal().getId());
        stmt.setInt(4, obj.getAtorCoadjuvante().getId());
        stmt.setDate(5, obj.getDataLancamento());
        stmt.setInt(6, obj.getDuracaoMinutos());
        stmt.setInt(7, obj.getClassificacaoEtaria().getId());
        stmt.setInt(8, obj.getGenero().getId());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void atualizar(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE dvd"
                + " SET "
                + " titulo = ?, "
                + " ano_lancamento = ?, "
                + " ator_principal_id = ?, "
                + " ator_coadjuvante_id = ?, "
                + " data_lancamento = ?, "
                + " duracao_minutos = ?, "
                + " classificacao_etaria_id = ?, "
                + " genero_id = ? "
                + " WHERE id = ?;");

        stmt.setString(1, obj.getTitulo());
        stmt.setInt(2, obj.getAnoLancamento());
        stmt.setInt(3, obj.getAtorPrincipal().getId());
        stmt.setInt(4, obj.getAtorCoadjuvante().getId());
        stmt.setDate(5, obj.getDataLancamento());
        stmt.setInt(6, obj.getDuracaoMinutos());
        stmt.setInt(7, obj.getClassificacaoEtaria().getId());
        stmt.setInt(8, obj.getGenero().getId());
        stmt.setInt(9, obj.getId());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public void excluir(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM dvd "
                + " WHERE "
                + " id = ?;");

        stmt.setInt(1, obj.getId());

        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public List<Dvd> listarTodos() throws SQLException {

        List<Dvd> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT "
                + " d.id AS dvdId,"
                + " d.titulo AS dvdTitulo, "
                + " d.ano_lancamento AS dvdAnoLancamento, "
                + " d.ator_principal_id AS dvdAp, "
                + " d.ator_coadjuvante_id AS dvdAc, "
                + " d.data_lancamento AS dvdDataLancamento, "
                + " d.duracao_minutos AS dvdDuracaoMinutos, "
                + " d.classificacao_etaria_id AS dvdCe, "
                + " d.genero_id AS dvdG, "
                + " ap.id AS apId, "
                + " ap.nome AS apNome, "
                + " ap.sobrenome AS apSobrenome, "
                + " ap.data_estreia AS apDataEstreia, "
                + " ac.id AS acID, "
                + " ac.nome AS acNome, "
                + " ac.sobrenome AS acSobrenome, "
                + " ac.data_estreia AS acDataEstreia, "
                + " ce.id AS ceId, "
                + " ce.descricao AS ceDescricao, "
                + " g.id AS gId, "
                + " g.descricao AS gDescricao "
                + " FROM dvd d "
                + " JOIN ator ap ON ap.id = d.ator_principal_id "
                + " JOIN ator ac ON ac.id = d.ator_coadjuvante_id "
                + " JOIN classificacao_etaria ce ON ce.id = d.classificacao_etaria_id "
                + " JOIN genero g ON g.id = d.genero_id "
                + " ORDER BY d.titulo;"
        );

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Dvd d = new Dvd();
            Ator ap = new Ator();
            Ator ac = new Ator();
            ClassificacaoEtaria ce = new ClassificacaoEtaria();
            Genero g = new Genero();

            ce.setId(rs.getInt("ceId"));
            ce.setDescricao(rs.getString("ceDescricao"));

            g.setId(rs.getInt("gId"));
            g.setDescricao(rs.getString("gDescricao"));

            ap.setId(rs.getInt("apId"));
            ap.setNome(rs.getString("apNome"));
            ap.setSobrenome(rs.getString("apSobrenome"));
            ap.setDataEstreia(rs.getDate("apDataEstreia"));

            ac.setId(rs.getInt("acId"));
            ac.setNome(rs.getString("acNome"));
            ac.setSobrenome(rs.getString("acSobrenome"));
            ac.setDataEstreia(rs.getDate("acDataEstreia"));

            d.setId(rs.getInt("dvdId"));
            d.setTitulo(rs.getString("dvdTitulo"));
            d.setAnoLancamento(rs.getInt("dvdAnoLancamento"));
            d.setAtorCoadjuvante(ac);
            d.setAtorPrincipal(ap);
            d.setDataLancamento(rs.getDate("dvdDataLancamento"));
            d.setDuracaoMinutos(rs.getInt("dvdDuracaoMinutos"));
            d.setClassificacaoEtaria(ce);
            d.setGenero(g);

            lista.add(d);
        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Dvd obterPorId(int id) throws SQLException {

        Dvd d = new Dvd();
        Ator ap = new Ator();
        Ator ac = new Ator();
        ClassificacaoEtaria ce = new ClassificacaoEtaria();
        Genero g = new Genero();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT "
                + " d.id AS dvdId,"
                + " d.titulo AS dvdTitulo, "
                + " d.ano_lancamento AS dvdAnoLancamento, "
                + " d.ator_principal_id AS dvdAp, "
                + " d.ator_coadjuvante_id AS dvdAc, "
                + " d.data_lancamento AS dvdDataLancamento, "
                + " d.duracao_minutos AS dvdDuracaoMinutos, "
                + " d.classificacao_etaria_id AS dvdCe, "
                + " d.genero_id AS dvdG, "
                + " ap.id AS apId, "
                + " ap.nome AS apNome, "
                + " ap.sobrenome AS apSobrenome, "
                + " ap.data_estreia AS apDataEstreia, "
                + " ac.id AS acID, "
                + " ac.nome AS acNome, "
                + " ac.sobrenome AS acSobrenome, "
                + " ac.data_estreia AS acDataEstreia, "
                + " ce.id AS ceId, "
                + " ce.descricao AS ceDescricao, "
                + " g.id AS gId, "
                + " g.descricao AS gDescricao "
                + " FROM dvd d "
                + " JOIN ator ap ON ap.id = d.ator_principal_id "
                + " JOIN ator ac ON ac.id = d.ator_coadjuvante_id "
                + " JOIN classificacao_etaria ce ON ce.id = d.classificacao_etaria_id "
                + " JOIN genero g ON g.id = d.genero_id "
                + " WHERE d.id = ? "
                + " ORDER BY d.titulo;"
        );

        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            ce.setId(rs.getInt("ceId"));
            ce.setDescricao(rs.getString("ceDescricao"));

            g.setId(rs.getInt("gId"));
            g.setDescricao(rs.getString("gDescricao"));

            ap.setId(rs.getInt("apId"));
            ap.setNome(rs.getString("apNome"));
            ap.setSobrenome(rs.getString("apSobrenome"));
            ap.setDataEstreia(rs.getDate("apDataEstreia"));

            ac.setId(rs.getInt("acId"));
            ac.setNome(rs.getString("acNome"));
            ac.setSobrenome(rs.getString("acSobrenome"));
            ac.setDataEstreia(rs.getDate("acDataEstreia"));

            d.setId(rs.getInt("dvdId"));
            d.setTitulo(rs.getString("dvdTitulo"));
            d.setAnoLancamento(rs.getInt("dvdAnoLancamento"));
            d.setAtorCoadjuvante(ac);
            d.setAtorPrincipal(ap);
            d.setDataLancamento(rs.getDate("dvdDataLancamento"));
            d.setDuracaoMinutos(rs.getInt("dvdDuracaoMinutos"));
            d.setClassificacaoEtaria(ce);
            d.setGenero(g);
        }

        rs.close();
        stmt.close();

        return d;

    }
}
