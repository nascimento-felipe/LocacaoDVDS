package locacaodvds.controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ws.rs.BadRequestException;
import java.sql.SQLException;
import locacaodvds.dao.ClassificacaoEtariaDAO;
import locacaodvds.entidades.ClassificacaoEtaria;

/**
 *
 * @author lama
 */
@WebServlet(name = "ClassificacaoEtariaServlet", urlPatterns = {"/processaClassificacaoEtaria"})
public class ClassificacaoEtariaServlet extends HttpServlet {

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

        ClassificacaoEtariaDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new ClassificacaoEtariaDAO();

            if (acao.equals("inserir")) {

                String descricao = request.getParameter("descricao");

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setDescricao(descricao);

                dao.salvar(ce);

                disp = request.getRequestDispatcher(
                        "/formularios/classificacaoEtaria/listagem.jsp");

            } else if (acao.equals("alterar")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(id);
                ce.setDescricao(descricao);

                dao.atualizar(ce);

                disp = request.getRequestDispatcher(
                        "/formularios/classificacaoEtaria/listagem.jsp");

            } else if (acao.equals("excluir")) {

                int id = Integer.parseInt(request.getParameter("id"));

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(id);

                try {
                    dao.excluir(ce);
                    disp = request.getRequestDispatcher(
                            "/formularios/classificacaoEtaria/listagem.jsp");
                } catch (BadRequestException e) {
                    System.out.println("Tentativa de deletar classificacao cadastrada em dvd.");
                    disp = request.getRequestDispatcher("/formularios/classificacaoEtaria/error.jsp");
                }

            } else {

                int id = Integer.parseInt(request.getParameter("id"));
                ClassificacaoEtaria g = dao.obterPorId(id);
                request.setAttribute("classificacaoEtaria", g);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/classificacaoEtaria/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/classificacaoEtaria/excluir.jsp");
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
