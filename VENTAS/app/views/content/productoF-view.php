<div class="container is-fluid mb-6">
  <h1 class="title">Inventario crítico</h1>
  <h2 class="subtitle"><i class="fas fa-exclamation-circle"></i>&nbsp; Productos Faltantes y sin productos</h2>
</div>

<div class="container pb-6 pt-6">
  <div class="form-rest mb-6 mt-6"></div>

  <?php
    use app\controllers\productController;
    $insProducto = new productController();

    $pagina = isset($_GET['page']) ? $_GET['page'] : 1;
    echo $insProducto->listarProductoStockMinimoControlador($pagina,7,"productStockMinimo");
  ?>
</div>


