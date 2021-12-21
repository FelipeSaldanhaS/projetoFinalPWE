<%@page import="com.mysql.fabric.Response"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="classes.Usuario"%>
<%@page import="multitools.RandomCode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>




<title>Cadastro de Usuário</title>
<style>
body {
	background-image:
		url("https://images-americanas.b2w.io/produtos/184208180/imagens/papel-de-parede-infantil-grade-azul-cola-para-aplicacao-colecao-abracadabra-181125qi/184208180_1_large.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	background-color: white;
}
</style>
</head>


<body>

	<%
	String acao = request.getParameter("acao");

	if (acao != null) {
		int idUsuario = 0;
		String email = request.getParameter("email");
		String senha = new Usuario(email).newPassword();
		int idNivelUsuario = 1;
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String endereco = request.getParameter("endereco");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String uf = request.getParameter("uf");
		String cep = request.getParameter("cep");
		String telefone = request.getParameter("telefone");
		Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro,
				cidade, uf, cep, telefone);

			
			usuario.save();
			

		}
		
	%>

	<div class="container"
		style="align-self: center; position: relative; height: 100vh; width: 100vw; padding: 60px;">
		<h3 style="color: blue">Cadastre-se</h3>
		<form action="Cadastro.jsp" method="POST">
			<div class="row">
				<div class="col-md-6">
					<label for="nome">Nome: </label> <input type="text"
						class="form-control" id="nome" name="nome"
						placeholder="Digite o Nome" onkeyup="this.value = this.value.toUpperCase();" required>
				</div>
				<div class="col-md-6">
					<label for="email">Email: </label> <input type="email" id="email"
						name="email" class="form-control" placeholder="Digite o Email"
						 required>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<label for="cpf">CPF: </label> <input type="text"
						class="form-control" id="cpf" name="cpf" 
						maxlength="14" placeholder="Digite o Cpf" required>
				</div>


				<div class="col-md-6">
					<label for="telefone">Telefone: </label> <input type="text"
						class="form-control" name="telefone" id="telefone"
						placeholder="Digite o Telefone" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label for="cep">Cep: </label> <input type="text"
						class="form-control" id="cep" name="cep"
						placeholder="Digite o Cep" required>
				</div>

				<div class="col-md-6">
					<label for="endereco">Endereço: </label> <input type="text"
						class="form-control" name="endereco" id="endereco"
						placeholder="Digite o Endereco" onkeyup="this.value = this.value.toUpperCase();" required>
				</div>
				<div class="col-md-3">
					<label for="bairro">Bairro: </label> <input type="text"
						class="form-control" name="bairro" id="bairro" 
						placeholder="Digite o Bairro" onkeyup="this.value = this.value.toUpperCase();" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="cidade">Cidade: </label> <input type="text"
						class="form-control" id="cidade" name="cidade"placeholder="Digite o Cidade" onkeyup="this.value = this.value.toUpperCase();" required>
				</div>

				<div class="col-md-3">
				<label for="uf">UF: </label> 
					<select class="form-control" id="uf"
						name="uf" >
						<option value="0" selected disabled>Selecione..</option>
						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AP">AP</option>
						<option value="AM">AM</option>
						<option value="BA">BA</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MT">MT</option>
						<option value="MS">MS</option>
						<option value="MG">MG</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PR">PR</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SP">SP</option>
						<option value="SE">SE</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>


			<div class="col-12">
				<input type="hidden" name="acao" value="1">
				<button type="button" id="btnCadastrar" class="btn btn-light"
					style="background-color: lightblue; margin-top: 30px"
					onclick="this.form.submit();">Cadastrar</button>
				<button type="button" id="btnCadastrar" class="btn btn-light"
					style="background-color: lightblue; margin-top: 30px"
					onclick="window.location.href='Login.jsp'">Voltar</button>
			</div>


		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
	<script type="text/javascript">
        $(document).ready(function () {
            $('#cpf').mask('999.999.999-99');
            $('#cep').mask('00000-000');
            $('#telefone').mask('(00) 00000-0000');
        });
    </script>

</html>