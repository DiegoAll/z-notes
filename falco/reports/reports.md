# Reports



Para hacer que todas las secciones desplegables aparezcan siempre visibles sin necesidad de hacer clic, puedes eliminar los onclick de los elementos .rule-summary y .sub-section, y asegurarte de que los .rule-detail y .sub-detail estén visibles eliminando display: none; o usando display: block; en CSS.



Remover 

    <div class="rule-summary" onclick="toggleDetail('rule1')">
    <div class="rule-summary">

    span class="info-icon" onclick="event.stopPropagation()
    <span class="info-icon">ℹ

    <div class="rule-detail" id="rule1">
    <div class="rule-detail" id="rule1" style="display: block;">

    <div class="sub-section" onclick="toggleSubDetail('desc1')">
    <div class="sub-section">

    <span class="info-icon" onclick="event.stopPropagation()">ℹ
    <span class="info-icon">ℹ

    <div class="sub-detail" id="desc1">
    <div class="sub-detail" id="desc1" style="display: block;">

    <div class="sub-section" onclick="toggleSubDetail('pertinencia1')">
    <div class="sub-section">

    <span class="info-icon" onclick="event.stopPropagation()">ℹ
    <span class="info-icon">ℹ

    <div class="sub-detail" id="pertinencia1">
    <div class="sub-detail" id="pertinencia1" style="display: block;">






