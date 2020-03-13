using Senai.Gufi.WebApi.Domains;
using Senai.Gufi.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Gufi.WebApi.Repositories
{
    public class TipoUsuarioRepository : ITipoUsuarioRepository
    {
        //Faz a conexão com o banco de dados
        GufiContext ctx = new GufiContext();

        public void Atualizar(int id, TipoUsuario atualizaTipoUsuario)
        {
            //Cria um objeto do tipo "TipoUsuario", depois faz a conexão com a tabela TipoUsuario, seleciona o método que você deseja
            //e passa o parametro dele
            TipoUsuario tipoUsuarioBuscado = ctx.TipoUsuario.Find(id);

            //Objeto buscado vai trazer o atributo titulo e armazenar o novo titulo passado no objeto atualizatipousuario
            tipoUsuarioBuscado.TituloTipoUsuario = atualizaTipoUsuario.TituloTipoUsuario;

            //faz a conexao com a tabela, passa o metodo de atualizar e o objeto buscado que terá o novo titulo atualizado
            ctx.TipoUsuario.Update(tipoUsuarioBuscado);

            //salva as alterações
            ctx.SaveChanges();
        }

        public TipoUsuario BuscarPorId(int id)
        {
            return ctx.TipoUsuario.FirstOrDefault(tu => tu.IdTipoUsuario == id);
        }

        public void Cadastrar(TipoUsuario novoTipoUsuario)
        {
            ctx.TipoUsuario.Add(novoTipoUsuario);

            ctx.SaveChanges();
        }

        public void Deletar(int id)
        {
            ctx.TipoUsuario.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }

        public List<TipoUsuario> Listar()
        {
            return ctx.TipoUsuario.ToList();
        }
    }
}
