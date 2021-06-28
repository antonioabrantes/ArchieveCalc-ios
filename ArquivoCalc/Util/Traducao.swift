//
//  Traducao.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 19/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import Foundation

class Traducao {
    var idioma:String
    var mensagem: String
    
    init(idioma:String, mensagem: String){
        self.idioma = idioma
        self.mensagem = mensagem
    }
    
    func getTraducao()->String{
        var texto = ""
        let ajudapt = "O ArchiveCalc é um aplicativo que é voltado para documentos textuais. O aplicativo permite calcular diferentes parâmetros de arquivos (metro linear, peso (kg), volume (m3), número de caixas arquivos, número de estantes e área física total) a partir da entrada de um parâmetro dentre quais: caixas arquivo, metro linear, área física, volume ou número de estantes. Os parâmetros número de caixas arquivo por estante, metro linear de cada caixa arquivo, área física de cada estante, volume por metro linear, peso por metro linear são editados de acordo com a necessidade do usuário. \n\n Os valores de referência de 50kg de peso por metro linear e volume de 0.08 m3 por metro linear foram baseados na publicação do Arquivo Nacional 'Manual de identificação de acervos documentais para  transferência e ou recolhimento aos arquivos públicos'. \n\n O app traz também figuras que foram baseadas nos exemplos inseridos na publicação do Arquivo Nacional 'Manual de roteiro para mensuração de documentos textuais' que facilitam o usuário a calcular o metro linear total. Nessa parte do app basta o usuário clicar na figura e inserir os dados de dimensões solicitados que ele trará o resultado final em metros lineares.\n\n O aplicativo possibilita calcular o metro linear total a partir da seleção de diferentes itens de arquivo (deslize a tela para poder selecionar a figura desejada): documentos arquivados em caixas, documentos empilhados, documentos encadernados, documentos fichários ou arquivos, documentos em pacotes ou documentos em montes. Todas as dimensões são dadas em metros. \n\n Os dados inseridos pelo usuário ficam armazenados no aplicativo de modo que da próxima vez que o usuário abrir o app ele irá recuperar os últimos dados cadastrados até o momento que se deseje apagá-los. Para apagar um cálculo feito a partir da tela de figuras basta clicar no cálculo desejado (deslize a tela para poder selecionar o cálculo desejado) e o aplicativo abrirá uma tela onde será possível apagar somente um cálculo ou a todos. \n\n Em qualquer tela basta clicar no ícone “casa” na barra de menu superior para voltar à tela inicial."
        
        let ajudaen = "ArchiveCalc is an app that is aimed towards textual documents. The application allows you to calculate different file parameters (linear meter, weight (kg), volume (m3), number of file boxes, number of shelves and total physical area) from the entry of a parameter, including: file boxes, linear meter, physical area, volume or number of shelves. The parameters number of file boxes per shelf, linear meter of each file box, physical area of ​​each shelf, volume per linear meter, weight per linear meter are edited according to the user's needs. \n\n The reference values ​​of 50 kg of weight per linear meter and a volume of 0.08 m3 per linear meter were based on the publication of the Brazilian National Archive 'Manual of identification of documentary collections for transfer and / or collection to public archives'. \n\n The app also features figures that were based on the examples inserted in the publication 'Manual Archive of script for measuring textual documents' that facilitate the user to calculate the total linear meter. In this part of the app, the user simply clicks on the figure and inserts the requested dimension data, which will bring the final result in linear meters. \n\n The application allows you to calculate the total linear meter from the selection of different file items (slide the screen to be able to select the desired figure): documents filed in boxes, stacked documents, bound documents, binder documents or files, documents in packages or documents in piles. All dimensions are given in meters. \n\n The data entered by the user is stored in the app so that the next time the user opens the app he will retrieve the last registered data until the moment he wants to delete it. To delete a calculation made from the figure screen just click on the desired calculation (slide the screen to be able to select the desired calculation) and the application will open a screen where you can delete only one calculation or all. \n\n On any screen, just click on the “home” icon on the top menu bar to return to the home screen."
        
        let ajudafr = "ArchiveCalc est une application destinée aux documents textuels. L'application vous permet de calculer différents paramètres de fichier (mètre linéaire, poids (kg), volume (m3), nombre de boîtes de fichier, nombre d'étagères et surface physique totale) à partir de l'entrée d'un paramètre, y compris: boîtes de fichier, mètre linéaire , aire physique, volume ou nombre d'étagères. Le nombre de paramètres des boîtes de classement par étagère, le mètre linéaire de chaque boîte de classement, l'aire physique de chaque étagère, le volume par mètre linéaire, le poids par mètre linéaire sont modifiés en fonction des besoins de l'utilisateur. \n\n Les valeurs de référence de 50 kg de poids par mètre linéaire et d'un volume de 0,08 m3 par mètre linéaire étaient basées sur la publication du «manuel d'identification des collections documentaires pour transfert et / ou collecte vers les archives nationales du Brésil archives publiques». \n\n L'application comporte également des chiffres basés sur les exemples insérés dans la publication «Archive manuelle du script pour mesurer les documents textuels» qui facilitent à l'utilisateur le calcul du mètre linéaire total. Dans cette partie de l'application, l'utilisateur clique simplement sur la figure et insère les données de dimension demandées, ce qui apportera le résultat final en mètres linéaires. \n\n L'application vous permet de calculer le mètre linéaire total à partir de la sélection des différents éléments du fichier (faites glisser l'écran pour pouvoir sélectionner la figure souhaitée): documents classés dans des boîtes, documents empilés, documents reliés, documents de reliure ou fichiers , documents en paquets ou documents en piles. Toutes les dimensions sont données en mètres. \n\n Les données saisies par l'utilisateur sont stockées dans l'application afin que la prochaine fois qu'il ouvre l'application, il récupère les dernières données enregistrées jusqu'au moment où il souhaite les supprimer. Pour supprimer un calcul effectué à partir de l'écran des figures, cliquez simplement sur le calcul souhaité (faites glisser l'écran pour pouvoir sélectionner le calcul souhaité) et l'application ouvrira un écran où vous ne pourrez supprimer qu'un seul calcul ou tous. \n\n Sur n'importe quel écran, cliquez simplement sur l'icône «Accueil» dans la barre de menu supérieure pour revenir à l'écran d'accueil."
        
        let ajudade = "ArchiveCalc ist eine App, die auf Textdokumente abzielt. Mit der Anwendung können Sie verschiedene Dateiparameter (Laufmeter, Gewicht (kg), Volumen (m3), Anzahl der Dateikästen, Anzahl der Regale und physische Gesamtfläche) aus der Eingabe eines Parameters berechnen, einschließlich: Dateikästen, Laufmeter , physischer Bereich, Volumen oder Anzahl der Regale. Die Parameter Anzahl der Ordner pro Regal, Laufmeter jedes Ordners, physischer Bereich jedes Regals, Volumen pro Laufmeter, Gewicht pro Laufmeter werden nach den Bedürfnissen des Benutzers bearbeitet. \n\n Die Referenzwerte von 50 kg Gewicht pro Laufmeter und einem Volumen von 0,08 m3 pro Laufmeter beruhten auf der Veröffentlichung des Handbuchs des brasilianischen Nationalarchivs zur 'Identifizierung von Dokumentensammlungen für die Übergabe und / oder Sammlung an öffentliche Archive'. \n\n Die App enthält auch Abbildungen, die auf den Beispielen in der Publikation 'Manual Archive of Script zum Messen von Textdokumenten' basieren und dem Benutzer die Berechnung des gesamten Längenmessers erleichtern. In diesem Teil der App klickt der Benutzer einfach auf die Abbildung und fügt die angeforderten Abmessungsdaten ein, wodurch das Endergebnis in linearen Metern angezeigt wird. \n\n Mit der Anwendung können Sie den gesamten Längenmesser aus der Auswahl verschiedener Dateien berechnen (schieben Sie den Bildschirm, um die gewünschte Abbildung auszuwählen): Dokumente, die in Kartons abgelegt sind, gestapelte Dokumente, gebundene Dokumente, Ordnerdokumente oder Dateien , Dokumente in Paketen oder Dokumente in Stapeln. Alle Maße sind in Metern angegeben. \n\n Die vom Benutzer eingegebenen Daten werden in der App gespeichert, sodass der Benutzer beim nächsten Öffnen der App die zuletzt registrierten Daten abruft, bis er sie löschen möchte. Um eine Berechnung aus dem Zahlenbildschirm zu löschen, klicken Sie einfach auf die gewünschte Berechnung (schieben Sie den Bildschirm, um die gewünschte Berechnung auszuwählen), und die Anwendung öffnet einen Bildschirm, in dem Sie nur eine oder alle Berechnungen löschen können. \n\n Klicken Sie in einem beliebigen Bildschirm einfach auf das Symbol Home in der oberen Menüleiste, um zum Startbildschirm zurückzukehren."
        
        let ajudait = "ArchiveCalc è un'app che si rivolge a documenti testuali. L'applicazione consente di calcolare diversi parametri di file (metro lineare, peso (kg), volume (m3), numero di caselle di file, numero di ripiani e area fisica totale) dall'immissione di un parametro, tra cui: caselle di file, metro lineare, area fisica, volume o numero di ripiani. Il numero di parametri di scatole di file per scaffale, metro lineare di ogni scatola di file, area fisica di ogni scaffale, volume per metro lineare, peso per metro lineare vengono modificati in base alle esigenze dell'utente. \n\n I valori di riferimento di 50 kg di peso per metro lineare e un volume di 0,08 m3 per metro lineare si basavano sulla pubblicazione del Manuale dell'archivio nazionale brasiliano di identificazione delle raccolte documentarie per il trasferimento e / o la raccolta a archivi pubblici.\n\n L'app presenta anche figure basate sugli esempi inseriti nella pubblicazione 'Archivio manuale degli script per la misurazione di documenti testuali' che facilitano l'utente nel calcolare il metro lineare totale. In questa parte dell'app, l'utente fa semplicemente clic sulla figura e inserisce i dati di dimensione richiesti, il che porterà il risultato finale in metri lineari. \n\n L'applicazione consente di calcolare il metro lineare totale dalla selezione di diversi elementi del file (scorrere lo schermo per poter selezionare la figura desiderata): documenti archiviati in caselle, documenti impilati, documenti rilegati, documenti leganti o file, documenti in colli o documenti in pile. Tutte le dimensioni sono espresse in metri. \n\n I dati inseriti dall'utente vengono archiviati nell'app in modo che la prossima volta che l'utente apre l'app, recupera gli ultimi dati registrati fino al momento in cui desidera eliminarlo. Per eliminare un calcolo effettuato dalla schermata della figura, basta fare clic sul calcolo desiderato (scorrere la schermata per poter selezionare il calcolo desiderato) e l'applicazione aprirà una schermata in cui è possibile eliminare solo un calcolo o tutti. \n\n Su qualsiasi schermata, fai clic sull'icona home nella barra dei menu in alto per tornare alla schermata principale."
        
        let ajudaes = "ArchiveCalc es una aplicación dirigida a documentos de texto. La aplicación le permite calcular diferentes parámetros de archivo (medidor lineal, peso (kg), volumen (m3), número de cajas de archivo, número de estantes y área física total) a partir de la entrada de un parámetro, que incluye: cajas de archivo, medidor lineal , área física, volumen o número de estantes. El número de parámetros de cajas de archivo por estante, metro lineal de cada caja de archivo, área física de cada estante, volumen por metro lineal, peso por metro lineal se editan de acuerdo con las necesidades del usuario. \n\n Los valores de referencia de 50 kg de peso por metro lineal y un volumen de 0.08 m3 por metro lineal se basaron en la publicación del Manual del Archivo Nacional Brasileño de 'Identificación de colecciones documentales para su transferencia y / o recolección a archivos públicos'. \n\n La aplicación también presenta cifras basadas en los ejemplos insertados en la publicación 'Manual Archive of script para medir documentos textuales' que facilitan al usuario calcular el medidor lineal total. En esta parte de la aplicación, el usuario simplemente hace clic en la figura e inserta los datos de dimensión solicitados, lo que traerá el resultado final en metros lineales. \n\n La aplicación le permite calcular el medidor lineal total a partir de la selección de diferentes elementos de archivo (deslice la pantalla para poder seleccionar la figura deseada): documentos archivados en cajas, documentos apilados, documentos encuadernados, documentos de carpeta o archivos , documentos en paquetes o documentos en pilas. Todas las dimensiones se dan en metros. \n\n Los datos ingresados ​​por el usuario se almacenan en la aplicación para que la próxima vez que el usuario abra la aplicación recupere los últimos datos registrados hasta el momento en que quiera eliminarlos. Para eliminar un cálculo realizado desde la pantalla de la figura, simplemente haga clic en el cálculo deseado (deslice la pantalla para poder seleccionar el cálculo deseado) y la aplicación abrirá una pantalla donde puede eliminar solo un cálculo o todos. \n\n En cualquier pantalla, simplemente haga clic en el icono de Home en la barra de menú superior para volver a la pantalla de inicio."
        
        let ajudacn = "ArchiveCalc是一款針對文本文檔的應用程序。該應用程序允許您從參數輸入中計算不同的文件參數（線性儀表，重量（kg），體積（m3），文件箱數量，架子數和總物理面積），包括：文件箱，線性儀表，實際面積，體積或貨架數量。每個架子的文件箱數量，每個文件箱的線米，每個架子的物理面積，每線米的體積，每線米的重量的參數可根據用戶需要進行編輯。 \n\n 參考值是每線性米50千克重量， 每線性米0.08立方米的體積是基於巴西國家檔案館的 《識別用於轉移和/或收集的文獻收藏手冊》公共檔案”。\n\n該應用程序還具有基於插入在出版物“用於測量文本文檔的腳本的手動存檔”中的示例的數字，可方便用戶計算總線性表。在應用程序的此部分中，用戶只需單擊圖形並插入所需的尺寸數據，即可將最終結果顯示為線性儀表。 \n\n 該應用程序允許您從不同文件項的選擇中計算總線性表 （滑動屏幕以選擇所需的圖形）： 裝箱的文件，堆疊的文件，裝訂的文件，活頁夾文件或文件，包裝中的文件或成堆的文件。所有尺寸均以米為單位。 \n\n用戶輸入的數據存儲在應用程序中， 以便下次用戶打開應用程序時， 他將檢索最後一次註冊的數據，直到他要刪除該數據為止。要刪除圖形屏幕上的計算，只需單擊所需的計算（滑動屏幕即可選擇所需的計算），應用程序將打開一個屏幕，您只能刪除一個或全部計算。 \n\n 在任何屏幕上，只需單擊頂部菜單欄上的“主屏幕”圖標即可返回主屏幕."
        
        let c = String(UnicodeScalar(170))
        
        if idioma == "pt" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Calcula parâmetros de arquivo"
            } else if mensagem == "Calcula metro linear" {
                texto = "Calcula metro linear"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Digite o parâmetro:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Selecione o tipo de parâmetro:"
            } else if mensagem == "Calcular" {
                texto = "Calcular"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Ajustar parâmetros Arquivo"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Últimos cálculos de metro linear"
            } else if mensagem == "Ajuda" {
                texto = ajudapt
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc Calculadora de Arquivos"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "Esse app foi desenvolvido por"
            } else if mensagem == "Contato:" {
                texto = "Contato:"
            } else if mensagem == "Estante com " {
                texto = "Estante com "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " caixas arquivo e área de "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Cada caixa arquivo com "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " metros lineares \n Cada metro linear com "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " Kg de peso \n Cada metro linear com "
            } else if mensagem == " m3 de volume" {
                texto = " m3 de volume"
            } else if mensagem == "Caixas Arquivo" {
                texto = "Caixas Arquivo"
            } else if mensagem == "Metro Linear Total" {
                texto = "Metro Linear Total"
            } else if mensagem == "Área Física da Estante" {
                texto = "Área Física da Estante"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Volume (m3) Documental"
            } else if mensagem == "Número de Estantes" {
                texto = "Número de Estantes"
            } else if mensagem == "Parâmetros" {
                texto = "Parâmetros"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Peso (kg) Documental"
            } else if mensagem == "Estante" {
                texto = "Estante"
            } else if mensagem == "Idioma" {
                texto = "Idioma"
            } else if mensagem == "Ajustado para o português" {
                texto = "Ajustado para o português"
            } else if mensagem == "Aviso" {
                texto = "Aviso"
            } else if mensagem == "Extensão A vazia" {
                texto = "Extensão A vazia"
            } else if mensagem == "Extensão B vazia" {
                texto = "Extensão B vazia"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Número de Prateleiras A vazia"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Número de Prateleiras B vazia"
            } else if mensagem == "Extensão A (m)" {
                texto = "Extensão A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Número de prateleiras A"
            } else if mensagem == "Extensão B (m)" {
                texto = "Extensão B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Número de prateleiras B"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Altura da 1" + c + " pilha de docs (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Altura da 2" + c + " pilha de docs (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Altura da pilha de docs (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Extensão da pilha de docs (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Profundidade da 1" + c + " gaveta (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Profundidade da 2" + c + " gaveta (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Altura do pacote (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Comprimento do pacote (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Largura do pacote (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Número de pacotes"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Altura do monte (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Comprimento do monte (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Largura do monte (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Documentos arquivados em caixas"
            } else if mensagem == "Documentos empilhados" {
                texto = "Documentos empilhados"
            } else if mensagem == "Documentos encadernados" {
                texto = "Documentos encadernados"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Documentos fichários ou arquivos"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Documentos em pacotes"
            } else if mensagem == "Documentos em montes" {
                texto = "Documentos em montes"
            } else if mensagem == "Metro Linear" {
                texto = "Metro Linear"
            } else if mensagem == "Sim" {
                texto = "Sim"
            } else if mensagem == "Não" {
                texto = "Não"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "confirma apagar o registro"
            } else if mensagem == "Confirmação" {
                texto = "Confirmação"
            } else if mensagem == "Registro apagado !" {
                texto = "Registrado apagado !"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Confirma apagar todos os registros ?"
            } else if mensagem == "Apagar registro" {
                texto = "Apagar registro"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Apagar todos os registros"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Parâmetros salvos com sucesso"
            } else if mensagem == "Erro na base de dados" {
                texto = "Erro na base de dados"
            } else if mensagem == "Gravar" {
                texto = "Gravar"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "Parâmetros de Arquivo"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Metro linear de cada Caixa Arquivo"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Peso (kg) por Metro Linear"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volume (m3) por Metro Linear"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "Caixas Arquivo por estante"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Área (m2) por estante"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Altura 1 vazia"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Altura 2 vazia"
            } else if mensagem == "Altura vazia" {
                texto = "Altura vazia"
            } else if mensagem == "Extensão vazia" {
                texto = "Extensão vazia"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Profundidade da 1" + c + " gaveta vazia"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Profundidade da 2" + c + " gaveta vazia"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Altura do pacote vazia"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Comprimento do pacote vazio"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Largura do pacote vazia"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Número de pacotes vazio"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Altura do monte vazia"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Comprimento do monte vazio"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Largura do monte vazia"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "Registros copiados para a área de transferência"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado"
            } else if mensagem == "Total de registros:" {
                texto = "Total de registros:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "Não há registros em memória !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "Parâmetros copiados para área de transferência"
            }
       }

        if idioma == "en" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Calculate file parameters"
            } else if mensagem == "Calcula metro linear" {
                texto = "Calculate linear meter"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Enter the parameter:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Select the parameter type:"
            } else if mensagem == "Calcular" {
                texto = "Calculate"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Set File Parameters"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Latest linear meter calculations"
            } else if mensagem == "Ajuda" {
                texto = ajudaen
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc File Calculator"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "This app was developed by"
            } else if mensagem == "Contato:" {
                texto = "Contact:"
            } else if mensagem == "Estante com " {
                texto = "File shelf with "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " file boxes and area "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Each file box with "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " linear meters \n Each linear meter with "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " weight kg \n Each linear meter with "
            } else if mensagem == " m3 de volume" {
                texto = " m3 volume"
            } else if mensagem == "Caixas Arquivo" {
                texto = "File Boxes"
            } else if mensagem == "Metro Linear Total" {
                texto = "Total Linear Meter"
            } else if mensagem == "Área Física da Estante" {
                texto = "File shelf Physical Area"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Documentary volume (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "Number of File shelves"
            } else if mensagem == "Parâmetros" {
                texto = "Parameters"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Document weight (kg)"
            } else if mensagem == "Estante" {
                texto = "File shelf"
            } else if mensagem == "Idioma" {
                texto = "Language"
            } else if mensagem == "Ajustado para o português" {
                texto = "Set to English"
            } else if mensagem == "Aviso" {
                texto = "Warning"
            } else if mensagem == "Extensão A vazia" {
                texto = "Empty A extension"
            } else if mensagem == "Extensão B vazia" {
                texto = "Empty B extension"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Number of A Shelves empty"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Number of B Shelves empty"
            } else if mensagem == "Extensão A (m)" {
                texto = "Extension A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Number of A Shelves"
            } else if mensagem == "Extensão B (m)" {
                texto = "Extension B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Number of B Shelves"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Height of 1st doc stack (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Height of 2nd doc stack (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Document stack height (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Document stack extension (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Depth of 1st drawer (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Depth of 2nd drawer (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Package height (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Package length (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Package width (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Number of packages"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Heap height (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Heap length (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Heap width (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Documents filed in boxes"
            } else if mensagem == "Documentos empilhados" {
                texto = "Stacked documents"
            } else if mensagem == "Documentos encadernados" {
                texto = "Bound documents"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Binder documents or files"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Packaged documents"
            } else if mensagem == "Documentos em montes" {
                texto = "Documents in heaps"
            } else if mensagem == "Metro Linear" {
                texto = "Linear Meter"
            } else if mensagem == "Sim" {
                texto = "Yes"
            } else if mensagem == "Não" {
                texto = "No"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "Confirm to delete the record"
            } else if mensagem == "Confirmação" {
                texto = "Confirmation"
            } else if mensagem == "Registro apagado !" {
                texto = "Record deleted!"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Confirm to delete all records?"
            } else if mensagem == "Apagar registro" {
                texto = "Delete record"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Delete all records"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Parameters saved successfully"
            } else if mensagem == "Erro na base de dados" {
                texto = "Database error"
            } else if mensagem == "Gravar" {
                texto = "Save"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "File Parameters"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Linear meter of each file box"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Weight (kg) per Linear Meter"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volume (m3) per Linear Meter"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "File boxes by file shelf"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Area (m2) per file shelf"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Height 1 empty"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Height 2 empty"
            } else if mensagem == "Altura vazia" {
                texto = "Height empty"
            } else if mensagem == "Extensão vazia" {
                texto = "Extension empty"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Depth of 1st drawer empty"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Depth of 2nd drawer empty"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Empty package height"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Empty packet length"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Empty package width"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Empty number of packages"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Heap height empty"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Heap lenght empty"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Heap width empty"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "Records copied to the clipboard"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "To delete a record just select it to be directed to the screen that allows you to delete all or only the selected record"
            } else if mensagem == "Total de registros:" {
                texto = "Total records:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "There are no records in memory !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "Parameters copied to the clipboard"
            }
        }

        if idioma == "fr" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Calculer les paramètres du archive"
            } else if mensagem == "Calcula metro linear" {
                texto = "Calculer le mètre linéaire"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Entrez le paramètre:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Sélectionnez le type de paramètre:"
            } else if mensagem == "Calcular" {
                texto = "Calculer"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Définir les paramètres de archive"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Derniers calculs de mètres linéaires"
            } else if mensagem == "Ajuda" {
                texto = ajudafr
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc Calculatrice de Archives"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "Cette application a été développée par"
            } else if mensagem == "Contato:" {
                texto = "Contact:"
            } else if mensagem == "Estante com " {
                texto = "Tablette avec "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " boîtes d'archive et aire "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Chaque boîte d'archive avec "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " mètres linéaires \n Chaque mètre linéaire avec "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " poids kg \n Chaque mètre linéaire avec "
            } else if mensagem == " m3 de volume" {
                texto = " m3 volume"
            } else if mensagem == "Caixas Arquivo" {
                texto = "Boîtes d'archive"
            } else if mensagem == "Metro Linear Total" {
                texto = "Mètre linéaire total"
            } else if mensagem == "Área Física da Estante" {
                texto = "Espace physique de tablette"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Volume documentaire (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "Nombre de tablettes"
            } else if mensagem == "Parâmetros" {
                texto = "Paramètres"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Poids du document (kg)"
            } else if mensagem == "Estante" {
                texto = "Tablette"
            } else if mensagem == "Idioma" {
                texto = "Langue"
            } else if mensagem == "Ajustado para o português" {
                texto = "Ajusté au français"
            } else if mensagem == "Aviso" {
                texto = "Avertissement"
            } else if mensagem == "Extensão A vazia" {
                texto = "Extension A vide"
            } else if mensagem == "Extensão B vazia" {
                texto = "Extension B vide"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Nombre d'étagères A vides"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Nombre d'étagères B vides"
            } else if mensagem == "Extensão A (m)" {
                texto = "Extension A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Nombre d'étagères A"
            } else if mensagem == "Extensão B (m)" {
                texto = "Extension B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Nombre d'étagères B"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Hauteur de la 1er pile de docs (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Hauteur de la 2ème pile de docs (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Hauteur de pile de docs (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Extension de pile de docs (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Profondeur du 1er tiroir (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Profondeur du 2ème tiroir (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Hauteur du paquet (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Longueur du paquet (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Largeur du paquet (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Nombre de paquet"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Hauteur de la monceau (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Longueur de monceau (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Largeur de la monceau (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Documents déposés dans des boîtes"
            } else if mensagem == "Documentos empilhados" {
                texto = "Documents empilés"
            } else if mensagem == "Documentos encadernados" {
                texto = "Documents liés"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Documents ou fichiers de classeur"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Documents emballés"
            } else if mensagem == "Documentos em montes" {
                texto = "Documents en monceau"
            } else if mensagem == "Metro Linear" {
                texto = "Mètre linéaire"
            } else if mensagem == "Sim" {
                texto = "Oui"
            } else if mensagem == "Não" {
                texto = "Non"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "Confirmez pour supprimer l'enregistrement"
            } else if mensagem == "Confirmação" {
                texto = "Confirmation"
            } else if mensagem == "Registro apagado !" {
                texto = "Enregistrement supprimé!"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Confirmer pour supprimer tous les enregistrements?"
            } else if mensagem == "Apagar registro" {
                texto = "Supprimer l'enregistrement"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Supprimer tous les enregistrements"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Paramètres enregistrés avec succès"
            } else if mensagem == "Erro na base de dados" {
                texto = "Erreur de base de données"
            } else if mensagem == "Gravar" {
                texto = "Enregistrer"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "Paramètres d'archivage"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Mètre linéaire de chaque boîte d'archives"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Poids (kg) par mètre linéaire"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volume (m3) par mètre linéaire"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "Boîtes d'archives par tablette"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Surface (m2) par tablette"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Hauteur 1 vide"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Hauteur 2 vide"
            } else if mensagem == "Altura vazia" {
                texto = "Hauteur vide"
            } else if mensagem == "Extensão vazia" {
                texto = "Extension vide"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Profondeur du 1er tiroir vide"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Profondeur du 2ème tiroir vide"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Hauteur de paquet vide"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Longueur de paquet vide"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Largeur du paquet vide"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Numéro de paquet vide"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Hauteur de monceau vide"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Longueur de monceau vide"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Largeur de monceau vide"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "Enregistrements copiés dans la mémoire"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "Pour supprimer un enregistrement, il suffit de le sélectionner pour être dirigé vers l'écran qui vous permet de supprimer tout ou seulement l'enregistrement sélectionné"
            } else if mensagem == "Total de registros:" {
                texto = "Nombre total d'enregistrements:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "Aucun enregistrement en mémoire !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "Paramètres copiés dans la mémoire"
            }
        }

        if idioma == "de" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Berechnen Sie die Dateiparameter"
            } else if mensagem == "Calcula metro linear" {
                texto = "Laufmeter berechnen"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Geben Sie den Parameter ein:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Wählen Sie den Parametertyp:"
            } else if mensagem == "Calcular" {
                texto = "Berechnung"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Legen Sie die Datei-Parameter fest"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Neueste Laufmeterberechnungen"
            } else if mensagem == "Ajuda" {
                texto = ajudade
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc Aktenrechner"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "Diese App wurde von entwickelt"
            } else if mensagem == "Contato:" {
                texto = "Kontakt:"
            } else if mensagem == "Estante com " {
                texto = "Regalbrett mit "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " Archivboxen und Bereich "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Jede Archivboxen mit "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " laufmeter \n Jeder Laufmeter mit "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " gewicht kg \n Jeder Laufmeter mit "
            } else if mensagem == " m3 de volume" {
                texto = " m3 volumen"
            } else if mensagem == "Caixas Arquivo" {
                texto = "Archivboxen"
            } else if mensagem == "Metro Linear Total" {
                texto = "Gesamtlaufmeter"
            } else if mensagem == "Área Física da Estante" {
                texto = "Physischer Bereich des Regalbrett"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Dokumentationsvolumen (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "Anzahl der Regalbrett"
            } else if mensagem == "Parâmetros" {
                texto = "Parameter"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Dokumentengewicht (kg)"
            } else if mensagem == "Estante" {
                texto = "Regalbrett"
            } else if mensagem == "Idioma" {
                texto = "Sprache"
            } else if mensagem == "Ajustado para o português" {
                texto = "Angepasst and deutsch"
            } else if mensagem == "Aviso" {
                texto = "Warnung"
            } else if mensagem == "Extensão A vazia" {
                texto = "Leere A-Erweiterung"
            } else if mensagem == "Extensão B vazia" {
                texto = "Leere B-Erweiterung"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Anzahl der A-Regale leer"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Anzahl der B-Regale leer"
            } else if mensagem == "Extensão A (m)" {
                texto = "A-Erweiterung (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Anzahl der A-Regale"
            } else if mensagem == "Extensão B (m)" {
                texto = "B-Erweiterung (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Anzahl der B-Regale"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Höhe des 1. Dokumentenstapels (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Höhe des 2. Dokumentenstapels (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Dokumentenstapelhöhe (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Dokumentenstapelerweiterung (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Tiefe der 1. Schublade (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Tiefe der 2. Schublade (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Pakethöhe (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Paket länge (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Paketbreite (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Anzahl der Packstücke"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Hügelhöhe (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Hügellänge (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Hügelbreite (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Dokumente in Kartons abgelegt"
            } else if mensagem == "Documentos empilhados" {
                texto = "Gestapelte Dokumente"
            } else if mensagem == "Documentos encadernados" {
                texto = "Gebundene Dokumente"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Sammelmappe Dokumente oder Dateien"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Gepackte Dokumente"
            } else if mensagem == "Documentos em montes" {
                texto = "Dokumente in Haufen"
            } else if mensagem == "Metro Linear" {
                texto = "Laufmeter"
            } else if mensagem == "Sim" {
                texto = "Ja"
            } else if mensagem == "Não" {
                texto = "Nein"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "Bestätigen Sie, um den Datensatz zu löschen"
            } else if mensagem == "Confirmação" {
                texto = "Bestätigung"
            } else if mensagem == "Registro apagado !" {
                texto = "Datensatz gelöscht!"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Bestätigen, um alle Datensätze zu löschen?"
            } else if mensagem == "Apagar registro" {
                texto = "Datensatz löschen"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Löschen Sie alle Datensätze"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Parameter erfolgreich gespeichert"
            } else if mensagem == "Erro na base de dados" {
                texto = "Datenbankfehler"
            } else if mensagem == "Gravar" {
                texto = "Speichern"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "Archivparameter"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Laufmeter jeder Archivbox"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Gewicht (kg) pro Laufmeter"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volumen (m3) pro Laufmeter"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "Archivboxen nach Regalbrett"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Fläche (m2) pro Regalbrett"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Hügelhöhe 1 leer"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Hügelhöhe 2 leer"
            } else if mensagem == "Altura vazia" {
                texto = "Hügelhöhe leer"
            } else if mensagem == "Extensão vazia" {
                texto = "Erweiterung leer"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Tiefe der 1. Schublade leer"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Tiefe der 2. Schublade leer"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Höhe der leeren Packung"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Länge des leeren Pakets"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Leere Packungsbreite"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Leere Paketnummer"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Haufenhöhe leer"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Haufenlänge leer"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Haufenbreite leer"
            } else if mensagem == "Registros copiados para a área de transferência" {
                texto = "Aufzeichnungen in den Speicher kopiert"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "Um einen Datensatz zu löschen, wählen Sie ihn einfach aus, um zum Bildschirm zu gelangen, auf dem Sie alle oder nur den ausgewählten Datensatz löschen können"
            } else if mensagem == "Total de registros:" {
                texto = "Gesamtzahl der Datensätze:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "Es sind keine Datensätze im Speicher !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "DateiParameter in den Speicher kopiert"
            }
        }

        if idioma == "it" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Calcola i parametri del file"
            } else if mensagem == "Calcula metro linear" {
                texto = "Calcola metro lineare"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Inserisci il parametro:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Seleziona il tipo di parametro:"
            } else if mensagem == "Calcular" {
                texto = "Calcolare"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Imposta i parametri del file"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Ultimi calcoli del metro lineare"
            } else if mensagem == "Ajuda" {
                texto = ajudait
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc Calcolatrice di File"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "Questa app è stata sviluppata da"
            } else if mensagem == "Contato:" {
                texto = "Contatto:"
            } else if mensagem == "Estante com " {
                texto = "Scaffale con "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " caselle di file e area "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Ogni casella di file con "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " metri lineari \n Ogni metro lineare con "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " peso kg \n Ogni metro lineare con "
            } else if mensagem == " m3 de volume" {
                texto = " m3 volume"
            } else if mensagem == "Caixas Arquivo" {
                texto = "Casella di file"
            } else if mensagem == "Metro Linear Total" {
                texto = "Metro lineare totale"
            } else if mensagem == "Área Física da Estante" {
                texto = "Area fisica della scafalle"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Volume documentario (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "Numero di scaffali"
            } else if mensagem == "Parâmetros" {
                texto = "Parametri"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Peso del documento (kg)"
            } else if mensagem == "Estante" {
                texto = "Scaffale"
            } else if mensagem == "Idioma" {
                texto = "Lingua"
            } else if mensagem == "Ajustado para o português" {
                texto = "Adattato all'italiano"
            } else if mensagem == "Aviso" {
                texto = "Avvertimento"
            } else if mensagem == "Extensão A vazia" {
                texto = "Estensione A vuota"
            } else if mensagem == "Extensão B vazia" {
                texto = "Estensione B vuota"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Numero di piani A vuoti"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Numero di piani B vuoti"
            } else if mensagem == "Extensão A (m)" {
                texto = "Estensione A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Numero di piani A"
            } else if mensagem == "Extensão B (m)" {
                texto = "Estensione B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Numero di piani B"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Altezza del 1" + c + " pila documenti (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Altezza del 2" + c + " pila documenti (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Altezza pila documenti (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Estensione pila documenti (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Profondità del 1° cassetto (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Profondità del 2° cassetto (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Altezza del pacchetto (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Lunghezza del pacchetto (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Larghezza del pacchetto (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Numero di pacchetto"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Altezza mucchio (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Lunghezza del mucchio (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Larghezza del mucchio (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Documenti archiviati in scatole"
            } else if mensagem == "Documentos empilhados" {
                texto = "Documenti impilati"
            } else if mensagem == "Documentos encadernados" {
                texto = "Documenti rilegati"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Raccoglitori di documenti o file"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Documenti confezionati"
            } else if mensagem == "Documentos em montes" {
                texto = "Documenti in mucchio"
            } else if mensagem == "Metro Linear" {
                texto = "Metro lineare"
            } else if mensagem == "Sim" {
                texto = "Sì"
            } else if mensagem == "Não" {
                texto = "No"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "Conferma per cancellare il record"
            } else if mensagem == "Confirmação" {
                texto = "Conferma"
            } else if mensagem == "Registro apagado !" {
                texto = "Record cancellato!"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Confermare per eliminare tutti i record?"
            } else if mensagem == "Apagar registro" {
                texto = "Elimina record"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Elimina tutti i record"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Parametri salvati correttamente"
            } else if mensagem == "Erro na base de dados" {
                texto = "Errore del database"
            } else if mensagem == "Gravar" {
                texto = "Salva"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "Parametri di archivio"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Metro lineare di ogni Casella di file"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Peso (kg) per metro lineare"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volume (m3) per metro lineare"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "Scatole per archivio per scaffale"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Area (m2) per scaffale"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Altezza 1 vuota"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Altezza 2 vuota"
            } else if mensagem == "Altura vazia" {
                texto = "Altezza vuota"
            } else if mensagem == "Extensão vazia" {
                texto = "Estensione vuota"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Profondità del 1° cassetto vuota"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Profondità del 2° cassetto vuota"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Altezza del pacchetto vuota"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Lunghezza del pacchetto vuota"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Larghezza del pacchetto vuota"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Numero pacchetto vuoto"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Altezza mucchio vuota"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Lunghezza mucchio vuota"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Larghezza mucchio vuota"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "Record copiati nella memoria"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "Per eliminare un record è sufficiente selezionarlo per essere diretto allo schermo che consente di eliminare tutto o solo il record selezionato"
            } else if mensagem == "Total de registros:" {
                texto = "Record totali:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "Non ci sono record in memoria !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "Parametri copiati nella memoria"
            }
        }

        if idioma == "es" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "Calcular parámetros de archivo"
            } else if mensagem == "Calcula metro linear" {
                texto = "Calcular metro lineal"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "Entrar el parámetro:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "Seleccione el tipo de parámetro:"
            } else if mensagem == "Calcular" {
                texto = "Calcular"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "Ajustar parámetros de archivo"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "Últimos cálculos de metro lineal"
            } else if mensagem == "Ajuda" {
                texto = ajudaes
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "ArchiveCalc Calculadora de Archivos"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "Esta aplicación fue desarrollada por"
            } else if mensagem == "Contato:" {
                texto = "Contacto:"
            } else if mensagem == "Estante com " {
                texto = "Balda con "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " cajas de archivo y área "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n Cada caja de archivo con "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " metros lineales \n Cada metro lineal con "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " peso kg \n Cada metro lineal con "
            } else if mensagem == " m3 de volume" {
                texto = " m3 volumen"
            } else if mensagem == "Caixas Arquivo" {
                texto = "Cajas de archivo"
            } else if mensagem == "Metro Linear Total" {
                texto = "Metro Lineal Total"
            } else if mensagem == "Área Física da Estante" {
                texto = "Área física de balda"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "Volumen documental (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "Número de baldas"
            } else if mensagem == "Parâmetros" {
                texto = "Parámetros"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "Peso del documento (kg)"
            } else if mensagem == "Estante" {
                texto = "Balda"
            } else if mensagem == "Idioma" {
                texto = "Idioma"
            } else if mensagem == "Ajustado para o português" {
                texto = "Ajustado al español"
            } else if mensagem == "Aviso" {
                texto = "Advertencia"
            } else if mensagem == "Extensão A vazia" {
                texto = "Extensión A vacía"
            } else if mensagem == "Extensão B vazia" {
                texto = "Extensión B vacía"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "Número de repisas A vacíos"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "Número de repisas B vacíos"
            } else if mensagem == "Extensão A (m)" {
                texto = "Extensión A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "Número de repisas A"
            } else if mensagem == "Extensão B (m)" {
                texto = "Extensión B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "Número de repisas B"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "Altura de la 1" + c + " pila de docs (m)"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "Altura de la 2" + c + " pila de docs (m)"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "Altura de la pila de docs (m)"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "Extensión de la pila de docs (m)"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "Profundidad del 1er cajón (m)"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "Profundidad del 2do cajón (m)"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "Altura del paquete (m)"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "Longitud del paquete (m)"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "Ancho del paquete (m)"
            } else if mensagem == "Número de pacotes" {
                texto = "Numero de paquetes"
            } else if mensagem == "Altura do monte (m)" {
                texto = "Altura del montón (m)"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "Longitud del montón (m)"
            } else if mensagem == "Largura do monte (m)" {
                texto = "Ancho del montón (m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "Documentos archivados en cajas"
            } else if mensagem == "Documentos empilhados" {
                texto = "Documentos apilados"
            } else if mensagem == "Documentos encadernados" {
                texto = "Documentos encuadernados"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "Carpeta de documentos o archivos"
            } else if mensagem == "Documentos em pacotes" {
                texto = "Documentos empacados"
            } else if mensagem == "Documentos em montes" {
                texto = "Documentos en montones"
            } else if mensagem == "Metro Linear" {
                texto = "Metro lineal"
            } else if mensagem == "Sim" {
                texto = "Si"
            } else if mensagem == "Não" {
                texto = "No"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "Confirme para borrar el registro"
            } else if mensagem == "Confirmação" {
                texto = "Confirmación"
            } else if mensagem == "Registro apagado !" {
                texto = "¡Registro eliminado!"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "Confirmar para borrar todos los registros?"
            } else if mensagem == "Apagar registro" {
                texto = "Borrar registro"
            } else if mensagem == "Apagar todos os registros" {
                texto = "Borrar todos los registros"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "Parámetros guardados exitosamente"
            } else if mensagem == "Erro na base de dados" {
                texto = "Error de la base de datos"
            } else if mensagem == "Gravar" {
                texto = "Guardar"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "Parámetros de archivo"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "Metro lineal de cada caja de archivo"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "Peso (kg) por metro lineal"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "Volumen (m3) por metro lineal"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "Cajas de archivo por balda"
            } else if mensagem == "Área (m2) por estante" {
                texto = "Área (m2) por balda"
            } else if mensagem == "Altura 1 vazia" {
                texto = "Altura 1 vacía"
            } else if mensagem == "Altura 2 vazia" {
                texto = "Altura 2 vacía"
            } else if mensagem == "Altura vazia" {
                texto = "Altura vacía"
            } else if mensagem == "Extensão vazia" {
                texto = "Extensión vacía"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "Profundidad del 1er cajón vacío"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "Profundidad del 2do cajón vacío"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "Altura del paquete vacío"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "Longitud del paquete vacío"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "Ancho de paquete vacío"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "Número de paquete vacío"
            } else if mensagem == "Altura do monte vazia" {
                texto = "Altura del montón vacía"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "Longitud del montón vacía"
            } else if mensagem == "Largura do monte vazia" {
                texto = "Ancho del montón vacío"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "Registros copiados a la memoria"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "Para eliminar un registro simplemente selecciónelo para que se dirija a la pantalla que le permite eliminar todo o solo el registro seleccionado"
            } else if mensagem == "Total de registros:" {
                texto = "Registros totales:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "No hay registros en la memoria !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "Parámetros copiados a la memoria"
            }
        }

        if idioma == "cn" {
            if mensagem == "Calcula parâmetros de arquivo" {
                texto = "計算文件參數"
            } else if mensagem == "Calcula metro linear" {
                texto = "計算線性表"
            } else if mensagem == "Digite o parâmetro:" {
                texto = "輸入參數:"
            } else if mensagem == "Selecione o tipo de parâmetro:" {
                texto = "選擇參數類型:"
            } else if mensagem == "Calcular" {
                texto = "計算"
            } else if mensagem == "Ajustar parâmetros Arquivo" {
                texto = "設置文件參數"
            } else if mensagem == "Últimos cálculos de metro linear" {
                texto = "最新的線性儀表計算"
            } else if mensagem == "Ajuda" {
                texto = ajudacn
            } else if mensagem == "Arquivo Calc Calculadora de Arquivos" {
                texto = "Arquivo Calc 文件計算器"
            } else if mensagem == "Esse app foi desenvolvido por" {
                texto = "這個程序是由開發"
            } else if mensagem == "Contato:" {
                texto = "聯繫："
            } else if mensagem == "Estante com " {
                texto = "書櫃 "
            } else if mensagem == " caixas arquivo e área de " {
                texto = " 文件框和區域 "
            } else if mensagem == " m2 \n Cada caixa arquivo com " {
                texto = " m2 \n每個文件框帶有 "
            } else if mensagem == " metros lineares \n Cada metro linear com " {
                texto = " 線性米\n每個線性米 "
            } else if mensagem == " Kg de peso \n Cada metro linear com " {
                texto = " 重量kg \n每個線性米 "
            } else if mensagem == " m3 de volume" {
                texto = " m3 立方米"
            } else if mensagem == "Caixas Arquivo" {
                texto = "文件框"
            } else if mensagem == "Metro Linear Total" {
                texto = "總線性計"
            } else if mensagem == "Área Física da Estante" {
                texto = "書架物理區域"
            } else if mensagem == "Volume (m3) Documental" {
                texto = "文件量 (m3)"
            } else if mensagem == "Número de Estantes" {
                texto = "書架數"
            } else if mensagem == "Parâmetros" {
                texto = "參量"
            } else if mensagem == "Peso (kg) Documental" {
                texto = "文件重量 (kg)"
            } else if mensagem == "Estante" {
                texto = "書架"
            } else if mensagem == "Idioma" {
                texto = "語言"
            } else if mensagem == "Ajustado para o português" {
                texto = "設為中文"
            } else if mensagem == "Aviso" {
                texto = "警告"
            } else if mensagem == "Extensão A vazia" {
                texto = "擴展名 A 空的"
            } else if mensagem == "Extensão B vazia" {
                texto = "擴展名 B 空的"
            } else if mensagem == "Número de Prateleiras A vazia" {
                texto = "架子數 A 空的"
            } else if mensagem == "Número de Prateleiras B vazia" {
                texto = "架子數 B 空的"
            } else if mensagem == "Extensão A (m)" {
                texto = "擴展名 A (m)"
            } else if mensagem == "Número de prateleiras A" {
                texto = "架子數 A"
            } else if mensagem == "Extensão B (m)" {
                texto = "擴展名 B (m)"
            } else if mensagem == "Número de prateleiras B" {
                texto = "架子數 B"
            } else if mensagem == "Altura da 1a pilha de docs (m)" {
                texto = "第一個文檔堆棧的高度（m）"
            } else if mensagem == "Altura da 2a pilha de docs (m)" {
                texto = "第二個文檔堆棧的高度（m）"
            } else if mensagem == "Altura da pilha de docs (m)" {
                texto = "文件堆疊高度（m）"
            } else if mensagem == "Extensão da pilha de docs (m)" {
                texto = "文件疊擴展名（m）"
            } else if mensagem == "Profundidade da 1a gaveta (m)" {
                texto = "第一抽屜深度（m）"
            } else if mensagem == "Profundidade da 2a gaveta (m)" {
                texto = "第二抽屜深度（m）"
            } else if mensagem == "Altura do pacote (m)" {
                texto = "包裝高度（m）"
            } else if mensagem == "Comprimento do pacote (m)" {
                texto = "包裝長度（m）"
            } else if mensagem == "Largura do pacote (m)" {
                texto = "包裝寬度（m）"
            } else if mensagem == "Número de pacotes" {
                texto = "包裹數量"
            } else if mensagem == "Altura do monte (m)" {
                texto = "坡高（m）"
            } else if mensagem == "Comprimento do monte (m)" {
                texto = "坡長（m）"
            } else if mensagem == "Largura do monte (m)" {
                texto = "坡度（m)"
            } else if mensagem == "Documentos arquivados em caixas" {
                texto = "放在箱子裡的文件"
            } else if mensagem == "Documentos empilhados" {
                texto = "堆疊文件"
            } else if mensagem == "Documentos encadernados" {
                texto = "裝訂文件"
            } else if mensagem == "Documentos fichários ou arquivos" {
                texto = "活頁夾文件或文件"
            } else if mensagem == "Documentos em pacotes" {
                texto = "包裝文件"
            } else if mensagem == "Documentos em montes" {
                texto = "堆文件"
            } else if mensagem == "Metro Linear" {
                texto = "線性儀表"
            } else if mensagem == "Sim" {
                texto = "是"
            } else if mensagem == "Não" {
                texto = "沒有"
            } else if mensagem == "Confirma apagar o registro" {
                texto = "確認刪除記錄"
            } else if mensagem == "Confirmação" {
                texto = "確認書"
            } else if mensagem == "Registro apagado !" {
                texto = "記錄已刪除！"
            } else if mensagem == "Confirma apagar todos os registros ?" {
                texto = "確認刪除所有記錄？"
            } else if mensagem == "Apagar registro" {
                texto = "刪除記錄"
            } else if mensagem == "Apagar todos os registros" {
                texto = "刪除所有記錄"
            } else if mensagem == "Parâmetros salvos com sucesso" {
                texto = "參數保存成功"
            } else if mensagem == "Erro na base de dados" {
                texto = "數據庫錯誤"
            } else if mensagem == "Gravar" {
                texto = "保存到"
            } else if mensagem == "Parâmetros de Arquivo" {
                texto = "存檔參數"
            } else if mensagem == "Metro linear de cada Caixa Arquivo" {
                texto = "每個檔案盒的線性表"
            } else if mensagem == "Peso (kg) por Metro Linear" {
                texto = "重量（kg）/每米"
            } else if mensagem == "Volume (m3) por Metro Linear" {
                texto = "每個線性儀表的體積（m3）"
            } else if mensagem == "Caixas Arquivo por estante" {
                texto = "貨架檔案盒"
            } else if mensagem == "Área (m2) por estante" {
                texto = "每個架子的面積（m2）"
            } else if mensagem == "Altura 1 vazia" {
                texto = "身高1空"
            } else if mensagem == "Altura 2 vazia" {
                texto = "身高2空"
            } else if mensagem == "Altura vazia" {
                texto = "空高度"
            } else if mensagem == "Extensão vazia" {
                texto = "空擴展名"
            } else if mensagem == "Profundidade da primeira gaveta vazia" {
                texto = "第一抽屜深度為空"
            } else if mensagem == "Profundidade da segunda gaveta vazia" {
                texto = "第二抽屜深度為空"
            } else if mensagem == "Altura do pacote vazia" {
                texto = "空包裝高度"
            } else if mensagem == "Comprimento do pacote vazio" {
                texto = "空包長度"
            } else if mensagem == "Largura do pacote vazia" {
                texto = "空包裝寬度"
            } else if mensagem == "Número de pacotes vazio" {
                texto = "空數據包編號"
            } else if mensagem == "Altura do monte vazia" {
                texto = "空堆高度"
            } else if mensagem == "Comprimento do monte vazio" {
                texto = "堆長空"
            } else if mensagem == "Largura do monte vazia" {
                texto = "空堆寬度"
            } else if mensagem == "Registros copiados para área de transferência" {
                texto = "記錄複製到內存"
            } else if mensagem == "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado" {
                texto = "要刪除一條記錄，只需選擇它即可將其定向到允許您刪除全部或僅選中記錄的屏幕。"
            } else if mensagem == "Total de registros:" {
                texto = "總記錄:"
            } else if mensagem == "Não há registros em memória !" {
                texto = "內存中沒有記錄 !"
            } else if mensagem == "Parâmetros copiados para área de transferência"{
                texto = "記錄複製到內存"
            }
        }
        
        return texto
    }
}
