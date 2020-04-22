package model;

import java.io.Serializable;

public class Umidade implements Serializable {
    private static final long serialVersionUID = 1L;
	private int id;
	private String nivel;

	public Umidade() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}


	@Override
	public String toString() {
		return "Umidade [id=" + id + ", nivel=" + nivel+"]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Umidade other = (Umidade) obj;
		if (id != other.id)
			return false;
		if (nivel == null) {
			if (other.nivel != null)
				return false;
		} else if (!nivel.equals(other.nivel))
			return false;
		return true;
	}
}
