using Senai.Gufi.WebApi.Domains;
using Senai.Gufi.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Gufi.WebApi.Repositories
{
    public class InstituicaoRepository : IInstituicaoRepository
    {
        GufiContext ctx = new GufiContext();

        public void Atualizar(int id, Instituicao instituicaoAtualizada)
        {
            Instituicao insituicaoBuscada = ctx.Instituicao.FirstOrDefault(i => i.IdInstituicao == id);

            if (instituicaoAtualizada != null)
            {
                insituicaoBuscada.Cnpj = instituicaoAtualizada.Cnpj;
                insituicaoBuscada.NomeFantasia = instituicaoAtualizada.NomeFantasia;
                insituicaoBuscada.Endereco = instituicaoAtualizada.Endereco;
            }

            ctx.Instituicao.Update(insituicaoBuscada);

            ctx.SaveChanges();
        }

        public Instituicao BuscarPorId(int id)
        {
            return ctx.Instituicao.FirstOrDefault(i => i.IdInstituicao == id);
        }

        public void Cadastrar(Instituicao novaInstituicao)
        {
            ctx.Instituicao.Add(novaInstituicao);

            ctx.SaveChanges();
        }

        public void Deletar(int id)
        {
            ctx.Instituicao.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }

        public List<Instituicao> Listar()
        {
            return ctx.Instituicao.ToList();
        }
    }
}
