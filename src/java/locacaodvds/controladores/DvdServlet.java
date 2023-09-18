package locacaodvds.controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Date;
import locacaodvds.dao.DvdDAO;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.ClassificacaoEtaria;
import locacaodvds.entidades.Dvd;
import locacaodvds.entidades.Genero;

/**
 *
 * @author lama
 */
@WebServlet(name = "DvdServlet", urlPatterns = {"/processaDvd"})
public class DvdServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        DvdDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new DvdDAO();

            if (acao.equals("inserir")) {

                String titulo = request.getParameter("titulo");
                String anoLancamento = request.getParameter("anoLancamento");
                int atorPrincipal = Integer.parseInt(request.getParameter("atorPrincipal"));
                int atorCoadjuvante = Integer.parseInt(request.getParameter("atorCoadjuvante"));
                String dataLancamento = request.getParameter("dataLancamento");
                String duracaoMinutos = request.getParameter("duracaoMinutos");
                int classificacaoEtaria = Integer.parseInt(request.getParameter("classificacaoEtaria"));
                int genero = Integer.parseInt(request.getParameter("genero"));

                Ator ap = new Ator();
                ap.setId(atorPrincipal);

                Ator ac = new Ator();
                ac.setId(atorCoadjuvante);

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(classificacaoEtaria);

                Genero g = new Genero();
                g.setId(genero);

                Dvd d = new Dvd();
                d.setTitulo(titulo);
                d.setAnoLancamento(Integer.parseInt(anoLancamento));
                d.setAtorPrincipal(ap);
                d.setAtorCoadjuvante(ac);
                d.setDataLancamento(Date.valueOf(dataLancamento));
                d.setDuracaoMinutos(Integer.parseInt(duracaoMinutos));
                d.setClassificacaoEtaria(ce);
                d.setGenero(g);

                dao.salvar(d);

                disp = request.getRequestDispatcher(
                        "/formularios/dvds/listagem.jsp");

            } else if (acao.equals("alterar")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String titulo = request.getParameter("titulo");
                String anoLancamento = request.getParameter("anoLancamento");
                int atorPrincipal = Integer.parseInt(request.getParameter("atorPrincipal"));
                int atorCoadjuvante = Integer.parseInt(request.getParameter("atorCoadjuvante"));
                String dataLancamento = request.getParameter("dataLancamento");
                String duracaoMinutos = request.getParameter("duracaoMinutos");
                int classificacaoEtaria = Integer.parseInt(request.getParameter("classificacaoEtaria"));
                int genero = Integer.parseInt(request.getParameter("genero"));

                Ator ap = new Ator();
                ap.setId(atorPrincipal);

                Ator ac = new Ator();
                ac.setId(atorCoadjuvante);

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(classificacaoEtaria);

                Genero g = new Genero();
                g.setId(genero);

                Dvd d = new Dvd();
                d.setId(id);
                d.setTitulo(titulo);
                d.setAnoLancamento(Integer.parseInt(anoLancamento));
                d.setAtorPrincipal(ap);
                d.setAtorCoadjuvante(ac);
                d.setDataLancamento(Date.valueOf(dataLancamento));
                d.setDuracaoMinutos(Integer.parseInt(duracaoMinutos));
                d.setClassificacaoEtaria(ce);
                d.setGenero(g);

                dao.atualizar(d);

                disp = request.getRequestDispatcher(
                        "/formularios/dvds/listagem.jsp");

            } else if (acao.equals("excluir")) {

                int id = Integer.parseInt(request.getParameter("id"));

                Dvd d = new Dvd();
                d.setId(id);

                dao.excluir(d);
                disp = request.getRequestDispatcher(
                        "/formularios/dvds/listagem.jsp");

            } else {

                int id = Integer.parseInt(request.getParameter("id"));
                Dvd d = dao.obterPorId(id);
                request.setAttribute("dvd", d);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/dvds/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/dvds/excluir.jsp");
                }
            }
        } catch (SQLException exc) {
            exc.printStackTrace();
        } finally {
            if (dao != null) {
                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    exc.printStackTrace();
                }
            }
        }

        if (disp != null) {
            disp.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
