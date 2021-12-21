package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Agendamento {
	private int idAgendamento;
	private String nome;
	private String email;
	private String cpf;
	private String telefone;
	private String servico;
	private String data;

	private String tableName = "lojinha.agendamentos";
	private String fieldsName = "idAgendamento, nome, email, cpf, telefone, servico, data";
	private String fieldKey = "idAgendamento";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	public Agendamento(int idAgendamento, String nome, String email, String cpf, String telefone, String servico,
			String data) {
		this.setIdAgendamento(idAgendamento);
		this.setNome(nome);
		this.setEmail(email);
		this.setCpf(cpf);
		this.setTelefone(telefone);
		this.setServico(servico);
		this.setData(data);
	}

	public Agendamento(String idAgendamento, String nome, String email, String cpf, String telefone, String servico,
			String data) {
		this.setIdAgendamento(((idAgendamento == null) ? 0 : Integer.valueOf(idAgendamento)));
		this.setNome(nome);
		this.setEmail(email);
		this.setCpf(cpf);
		this.setTelefone(telefone);
		this.setServico(servico);
		this.setData(data);
	}

	public String toString() {
		return (this.getIdAgendamento() + "" + " | " + this.getNome() + " | " + this.getEmail() + " | " + "********"
				+ " | " + this.getCpf() + " | " + this.getTelefone() + " | " + this.getServico() + " | "
				+ this.getData() + " | ");
	}

	private String[] toArray() {

		String[] temp = new String[] { this.getIdAgendamento() + "", this.getNome(), this.getEmail(), this.getCpf(),
				this.getTelefone(), this.getServico(), this.getData(), };
		return (temp);
	}

	public void save() {
		if (this.getIdAgendamento() > 0) {
			this.dbQuery.update(this.toArray());
		} else {
			this.dbQuery.insert(this.toArray());
		}
	}

	public void delete() {
		if (this.getIdAgendamento() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}

	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return (resultset);
	}

	public ResultSet selectBy(String field, String value) {
		ResultSet resultset = this.dbQuery.select(" " + field + "='" + value + "'");
		return (resultset);
	}

	public ResultSet select(String where) {
		ResultSet resultset = this.dbQuery.select(where);
		return (resultset);
	}

	public String listAllMenu() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>";
				saida += rs.getString("nome");
				saida += "</td>";
				saida += "<td>";
				saida += rs.getString("email");
				saida += "</td>";
				saida += "<td>";
				saida += rs.getString("data");
				saida += "</td>";
				saida += "<td>";
				saida += rs.getString("servico");
				saida += "</td>";
				saida += "<td>";
				saida += "<a href='ExcluirAgendamento.jsp?id=" + rs.getString("idAgendamento")
						+ "'><i class=\"fa fa-trash\" aria-hidden=\"true\"></a>";
				saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return saida;

	}

	public Agendamento() {
		this.tableName = "lojinha.agendamentos";
		this.fieldsName = "idAgendamento, nome, email, cpf, telefone, servico, data";
		this.fieldKey = "idAgendamento";
		this.dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	}

	public int getIdAgendamento() {
		return idAgendamento;
	}

	public void setIdAgendamento(int idAgendamento) {
		this.idAgendamento = idAgendamento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getServico() {
		return servico;
	}

	public void setServico(String servico) {
		this.servico = servico;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}


	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
}
