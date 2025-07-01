<div class="container is-fluid mb-6">
  <h1 class="title">Resumen de Cajas por Día</h1>
  <h2 class="subtitle"><i class="fas fa-calendar-alt"></i> Ingresos por caja por día</h2>
</div>

<div class="container pb-6 pt-6">
  <?php
    use app\controllers\cashierController;
    $insCaja = new cashierController();
    echo $insCaja->resumenCajasPorDiaControlador();
  ?>
</div>
