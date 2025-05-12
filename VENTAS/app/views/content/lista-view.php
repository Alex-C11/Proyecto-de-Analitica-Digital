<div class="container is-fluid mb-6">
	<h1 class="title">Ventas</h1>
	<h2 class="subtitle"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Ventas</h2>
</div>
<div class="container pb-6 pt-6">

	<div class="form-rest mb-6 mt-6"></div>

    <?php
use app\controllers\saleController;

$ctrl = new saleController();
$datosVentas = $ctrl->obtenerDatosVentasTotalesPorMes();
?>

<div class="box mt-6">
  <h2 class="title is-4 has-text-centered">Gráfico de Ventas Mensuales</h2>
  <canvas id="ventasChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
const ctx = document.getElementById('ventasChart').getContext('2d');
const ventasChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?= json_encode($datosVentas['meses']) ?>,
        datasets: [{
            label: 'Total vendido (S/.)',
            data: <?= json_encode($datosVentas['totales']) ?>,
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>



</div>