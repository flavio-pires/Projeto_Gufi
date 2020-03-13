using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.Gufi.WebApi.Domains;
using Senai.Gufi.WebApi.Interfaces;
using Senai.Gufi.WebApi.Repositories;

namespace Senai.Gufi.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class InstituicaoController : ControllerBase
    {
        private IInstituicaoRepository _instituicaoRepository { get; set; }

        public InstituicaoController()
        {
            _instituicaoRepository = new InstituicaoRepository();
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_instituicaoRepository.Listar());
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_instituicaoRepository.BuscarPorId(id));
        }

        [HttpPost]
        public IActionResult Post(Instituicao novaInstituicao)
        {
            _instituicaoRepository.Cadastrar(novaInstituicao);

            return Ok("Nova instituição cadastrada!");
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, Instituicao instituicaoAtualizada)
        {
            try
            {
                _instituicaoRepository.Atualizar(id, instituicaoAtualizada);

                return Ok("Instituição atualizada!");
            }
            catch(Exception erro)
            {
                return BadRequest(erro);
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _instituicaoRepository.Deletar(id);

            return Ok("Instituição excluída!");
        }
    }
}