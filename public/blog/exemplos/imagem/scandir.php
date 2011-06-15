<?php
// include da classe m2brimagem
include('m2brimagem.class.php');
// instancia objeto m2brimagem
$oImg = new m2brimagem();
// define diret�rios
$diretorio = 'galeria/';
$dir_thumbs = $diretorio.'thumbs/';
// varre diret�rio com as imagens originais
$arquivos = scandir($diretorio);
// lista arquivos do diret�rio
// e pega somente os de extens�o jpg ou jpeg
foreach($arquivos as $arquivo) {
	if(eregi(".+.[jJ][pP][eE]?[gG]$", $arquivo)) {
		// "carrega" arquivo
		$oImg->carrega($diretorio.$arquivo);
		$valida = $oImg->valida();
		if ($valida == 'OK') {
			// redimensiona
			$oImg->redimensiona(80,80,'crop');
			// salva no diret�rio das miniaturas
			$oImg->grava($dir_thumbs.$arquivo,true);
			echo "Miniatura criada para " . $diretorio.$arquivo . "<hr>";
		} else {
			echo "Erro ao criar miniatura para " . $diretorio.$arquivo . ": " . $valida . "<hr>";
		}
	}
}
exit;
?>