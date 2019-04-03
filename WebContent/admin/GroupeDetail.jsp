<%@page import="DataAccessObjects.Groupe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@page import="java.util.List,DataAccessObjects.Etudiant"%>
<%
 Groupe groupe = (Groupe)request.getAttribute("GroupeDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
			function loadTable(){
				<%
				List<Etudiant> listStudent = (List<Etudiant>)request.getAttribute("listStudent");
				for (Etudiant etudiant:listStudent) {
					
						String id = etudiant.getId();
						String sexe = etudiant.getSexe();
		                String nom = etudiant.getNom();
		                String prenom = etudiant.getPrenom();
	             %>
					var tableau = document.getElementById("tableau");
	                var elts = ['<%=id %> ', '<%=sexe %> ','<%=nom %>','<%=prenom %>']; // Je stocke les éléments dans un tableau pour remplir les colonnes plus simplement ...
	                var ligne = tableau.insertRow(-1);//on a ajouté une ligne
	                for (i=0;i<4;i++){
	                	// On remplit chaque ligne
	                	colonne =ligne.insertCell(i);
	                	colonne.innerHTML += elts[i];
	                	console.log("Insertion de " + elts[i]);
	                }
	                
				<%}%>
			}
			
			function clear(){
				var tableau = document.getElementById("tableau");
				longueur = tableau.rows.length;
				for (i=1;i<longueur;i++){
					tableau.deleteRow(-1);
				}
			}
</script>

<title>Détails du groupe <%= groupe.getNomGroupe() %></title>
</head>
<body onload="loadTable()">
	<p>Détails du groupe <%= groupe.getNomGroupe() %></p>
	<table border="1">
		<tr>
			<th>idGroupe</th>
			<th>nomGroupe</th>
			<th>redacteur</th>
		</tr>
		<% 	String idGroupe = groupe.getIdGroupe();
			String nomGroupe = groupe.getNomGroupe();
            String redacteur = groupe.getRedacteur();
       %>
       <tr onclick="this.style.cursor='default';" >
			<td><%=idGroupe %></td>
			<td><%=nomGroupe %></td>
			<td><%=redacteur %></td>
		</tr>
	</table>
	<form action="GroupeModification" method= "get">
		<input type = "submit" name ="modifier" value = "Modifier le groupe">
	</form>
	<form action = "StudentVisualizationServlet" method = "get">
			<input type = "submit" name ="refresh" value = "Rechargement Niveau Ewok">
	</form>
	<table id="tableau" border="1" >
		<thead>
			<tr>
				<th>id</th>
				<th>Sexe</th>
				<th>nom</th>
				<th>prenom</th>
			</tr>
		</thead>
	</table>
		
	<form action="VisualisationGroupeServlet">
		<input type="submit" name="retour" value = "Annuler et retourner à la visualisation">
	</form>
</body>
</html>