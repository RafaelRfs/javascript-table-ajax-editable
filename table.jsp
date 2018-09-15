<html>
<header>
<title>Tabela Editavel</title>
</header>

<body>

<style>
table,td{ border:1px solid #000; width:100%;}
.editForm{
	border:1px solid #000;
	background:#CCC;
	display: none;
}
</style>


<script type="text/javascript">
var camposTabeladb = ['valor1', 'valor2','valor3']; // Mapear os nomes dos campos da tabela
var page_post = "posts.jsp";
var nome_tabela = "tabela_teste";

function EditMeAll(idcampo){
	var checked = document.getElementById("EditME_Checkbox_"+idcampo).checked;
	for( i in camposTabeladb){
		if(checked) {EditMe(camposTabeladb[i], idcampo)} else{EditMeReverse(camposTabeladb[i], idcampo)} ;	
    } 
}


function EditMe(campo, idcampo){
	var nomeCampo = campo+"_"+idcampo;
	var nomeCampoEdit = campo+"Edit_"+idcampo;
	document.getElementById(nomeCampoEdit).style.display = "block";
	document.getElementById(nomeCampo).style.display = "none";
} //Exibe os 


function EditMeReverse(campo, idcampo){
	var nomeCampo = campo+"_"+idcampo;
	var nomeCampoEdit = campo+"Edit_"+idcampo;
	var textoExibe = document.getElementById(nomeCampo);
	var form = document.getElementById(nomeCampoEdit);
	textoExibe.innerHTML = form.value;
	textoExibe.style.display = "";
	form.style.display = "none";
} //Exibe os 


function enviaDataServer(idcampo){
	document.getElementById("EditME_Checkbox_"+idcampo).checked = false;
	EditMeAll(idcampo);
	sendData(idcampo);
}

function sendData(idcampo){
	var xhttp = new XMLHttpRequest();
	var data_send = formUrlSend(idcampo);
	xhttp.open("POST", page_post, true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(data_send);
}

function formUrlSend(idcampo){
	var strdata = "";
	for(i in camposTabeladb){
		var campo=camposTabeladb[i];
		var value=document.getElementById(campo+'Edit_'+idcampo).value;
		strdata += campo+'='+value+'&';
	}
	console.log("Data Send"+strdata);
	return strdata;
}


function saveFormAll(){
	var contagem =  document.getElementById(nome_tabela).getElementsByTagName("tr").length;
	var campos = [];
	for(i = 1; i < contagem; i++){  // comeca depois do cBECALHO
	 var indice = parseInt(i);
		var idcampo = parseInt(document.getElementById(nome_tabela).getElementsByTagName("tr")[indice].id.replace("linha_",""));
		campos.push(idcampo);
	}
	for(i in campos){
		enviaDataServer(campos[i]);
	}
}
</script>




<table id="tabela_teste">
<tr style="border:1px solid ">
<td>SELECIONA</td>
<td>Cabecalho 1</td>
<td>Cabecalho 2</td>
<td>Cabecalho 3</td>
</tr>

<tbody>
    <!-- substituir pelo id -->
<tr id="linha_1">
                                         <!--  IdTabela -->
<td colspan="1"><input type="checkbox" onclick="EditMeAll(1)" id="EditME_Checkbox_1"/></td>
     <!--   nomeCampo _id tabela    -->                      <!--   nomeCampoEdit _id tabela    -->                                                                         <!-- iddocampo -->
<td> <p id="valor1_1" onclick="EditMe('valor1',1)"> Valor 1 </p>  <input id="valor1Edit_1" type="text" value="Campo1 valor 1"  name="campoTabela1" class="editForm" onchange="enviaDataServer(1)"/>   </td>
<td> <p id="valor2_1" onclick="EditMe('valor2',1)"> Valor 2 </p>  <input id="valor2Edit_1" type="text" value="Campo2 valor 2"  name="campoTabela2" class="editForm" onchange="enviaDataServer(1)"/>   </td>
<td> <p id="valor3_1" onclick="EditMe('valor3',1)"> Valor 3 </p>  <input id="valor3Edit_1" type="text" value="Campo3 valor 3"  name="campoTabela3" class="editForm" onchange="enviaDataServer(1)"/>   </td>

</tr>



<tr id="linha_2">
                                    <!--  IdTabela -->
<td colspan="1"><input type="checkbox" onclick="EditMeAll(2)"  id="EditME_Checkbox_2"/></td>
     <!--   nomeCampo _id tabela    -->                      <!--   nomeCampoEdit _id tabela    -->                                                                         <!-- iddocampo -->
<td> <p id="valor1_2" onclick="EditMe('valor1',2)"> Valor 1 </p>  <input id="valor1Edit_2" type="text" value="Campo1 valor 1"  name="campoTabela1" class="editForm" onchange="enviaDataServer(2)"/>   </td>
<td> <p id="valor2_2" onclick="EditMe('valor2',2)"> Valor 2 </p>  <input id="valor2Edit_2" type="text" value="Campo2 valor 2"  name="campoTabela2" class="editForm" onchange="enviaDataServer(2)"/>   </td>
<td> <p id="valor3_2" onclick="EditMe('valor3',2)"> Valor 3 </p>  <input id="valor3Edit_2" type="text" value="Campo3 valor 3"  name="campoTabela3" class="editForm" onchange="enviaDataServer(2)"/>   </td>
</tr>
</tbody>

</table>
<input type="button" onclick="saveFormAll()" value="form">
</body>

</html>
