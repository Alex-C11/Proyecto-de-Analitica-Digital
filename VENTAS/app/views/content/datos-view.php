<div class="container is-fluid mb-6">
  <h1 class="title">Dashboard</h1>
  <h2 class="subtitle"><i class="fas fa-chart-line"></i> &nbsp; Resumen de ventas</h2>
</div>

<?php
use app\controllers\saleController;
$ctrl         = new saleController();

/* Datos */
$kpis         = $ctrl->obtenerKPIs();
$ventasMes    = $ctrl->obtenerDatosVentasTotalesPorMes();
$ventasDia    = $ctrl->obtenerVentasPorDia();
$ventasUsu    = $ctrl->obtenerVentasPorUsuario();
$topProductos = $ctrl->obtenerTopProductos();

?>

<style>
  .box {
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  }
  .kpi-box {
    background: linear-gradient(135deg, #d0f0ff, #a0d8ef);
    color: #0d1b2a;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
  }
  .kpi-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
  }
  .kpi-icon {
    font-size: 2.2rem;
    margin-bottom: 0.5rem;
    display: block;
    color: #0077b6;
  }
  .kpi-value {
    font-size: 2.4rem;
    font-weight: bold;
    color: #023e8a;
  }
  .kpi-label {
    font-size: 0.9rem;
    font-weight: 600;
    color: #023047;
  }
</style>

<!-- Tarjetas KPI ------------------------------------------------------>
<div class="columns is-multiline">
  <?php
  $icons = ['fas fa-coins', 'fas fa-calendar-alt', 'fas fa-bolt', 'fas fa-boxes', 'fas fa-warehouse'];
  $tarjetas = [
    ['Total facturado',  $kpis['total_ventas'],      $icons[0]],
    ['Ventas este mes',  $kpis['total_mes'],         $icons[1]],
    ['Ventas hoy',       $kpis['total_hoy'],         $icons[2]],
    ['Productos activos',$kpis['productos_activos'], $icons[3]],
    ['Stock total',      $kpis['stock_total'],       $icons[4]]
  ];
  foreach($tarjetas as [$label,$valor,$icon]): ?>
    <div class="column is-one-fifth">
      <div class="box kpi-box has-text-centered">
        <span class="kpi-icon"><i class="<?= $icon ?>"></i></span>
        <p class="kpi-label"><?= $label ?></p>
        <p class="kpi-value">
          <?php
            if (in_array($label, ['Productos activos', 'Stock total'])) {
                echo number_format((int)$valor, 0, ',', '.');
            } else {
                echo is_numeric($valor)
                    ? number_format($valor, 2, ',', '.')
                    : $valor;
            }
          ?>
        </p>
      </div>
    </div>
  <?php endforeach; ?>
</div>

<!-- Gráficos ---------------------------------------------------------->
<div class="columns is-multiline">
  <div class="column is-half">
    <div class="box"><canvas id="ventasMesChart"></canvas></div>
  </div>
  <div class="column is-half">
    <div class="box"><canvas id="ventasDiaChart"></canvas></div>
  </div>
  <div class="column is-half">
    <div class="box"><canvas id="ventasUsuChart"></canvas></div>
  </div>
  <div class="column is-half">
    <div class="box"><canvas id="topProdChart"></canvas></div>
  </div>
</div>

<!-- Chart.js ---------------------------------------------------------->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
const colores = {
  azulClaro: (ctx) => {
    const gradient = ctx.chart.ctx.createLinearGradient(0, 0, 0, ctx.chart.height);
    gradient.addColorStop(0, 'rgba(0, 119, 182, 0.5)');
    gradient.addColorStop(1, 'rgba(173, 216, 230, 0.1)');
    return gradient;
  },
  azulFuerte: 'rgba(0, 102, 204, 1)',
  borde: 'rgba(0, 102, 204, 1)'
};

const animacion = {
  duration: 1000,
  easing: 'easeOutQuart'
};

const efectoHover = {
  mode: 'index',
  intersect: false,
  animation: animacion
};

/* 1. Ventas por mes */
(() => {
  const lbl = <?= json_encode($ventasMes['meses']) ?>.filter(Boolean);
  const dat = <?= json_encode($ventasMes['totales']) ?>.slice(0, lbl.length);

  const ctx = document.getElementById('ventasMesChart');
  new Chart(ctx, {
    type: 'line',
    data: {
      labels: lbl,
      datasets: [{
        label: 'Total vendido (S/.)',
        data: dat,
        fill: true,
        backgroundColor: (ctx) => colores.azulClaro(ctx),
        borderColor: colores.borde,
        borderWidth: 2,
        tension: 0.3,
        pointRadius: 3,
        pointHoverRadius: 6
      }]
    },
    options: {
      plugins: {
        title: { display: true, text: 'Ventas por mes' },
        legend: { display: true }
      },
      hover: efectoHover,
      animation: animacion
    }
  });
})();

/* 2. Ventas por día */
(() => {
  const raw = <?= json_encode($ventasDia) ?>;
  const d = raw.filter(r => r.fecha && r.cantidad != null);

  new Chart(document.getElementById('ventasDiaChart'), {
    type: 'bar',
    data: {
      labels: d.map(r => r.fecha),
      datasets: [{
        label: 'Número de ventas',
        data: d.map(r => r.cantidad),
        backgroundColor: (ctx) => colores.azulClaro(ctx),
        borderColor: colores.borde,
        borderWidth: 1,
        borderRadius: 6
      }]
    },
    options: {
      plugins: {
        title: { display: true, text: 'Cantidad de ventas (30 días)' }
      },
      hover: efectoHover,
      animation: animacion
    }
  });
})();

/* 3. Ventas por usuario */
(() => {
  const raw = <?= json_encode($ventasUsu) ?>;
  const d = raw.filter(r => r.usuario && r.total != null);

  new Chart(document.getElementById('ventasUsuChart'), {
    type: 'bar',
    data: {
      labels: d.map(r => r.usuario),
      datasets: [{
        label: 'Total vendido (S/.)',
        data: d.map(r => r.total),
        backgroundColor: (ctx) => colores.azulClaro(ctx),
        borderColor: colores.borde,
        borderWidth: 1,
        borderRadius: 6
      }]
    },
    options: {
      indexAxis: 'y',
      plugins: {
        title: { display: true, text: 'Ventas por usuario' },
        legend: { display: true },
        tooltip: {
          callbacks: {
            label: ctx => 'S/ ' + (+ctx.raw).toLocaleString('es-PE', { minimumFractionDigits: 2 })
          }
        }
      },
      scales: {
        x: {
          beginAtZero: true,
          ticks: {
            callback: v => 'S/ ' + (+v).toLocaleString('es-PE')
          }
        }
      },
      hover: efectoHover,
      animation: animacion
    }
  });
})();

/* 4. Top‑5 productos más vendidos */
(() => {
  const raw = <?= json_encode($topProductos) ?>;
  const d = raw.filter(r => r.producto && r.cantidad != null);

  new Chart(document.getElementById('topProdChart'), {
    type: 'bar',
    data: {
      labels: d.map(r => r.producto),
      datasets: [{
        label: 'Cantidad Vendida',
        data: d.map(r => r.cantidad),
        backgroundColor: (ctx) => colores.azulClaro(ctx),
        borderColor: colores.borde,
        borderWidth: 1,
        borderRadius: 6
      }]
    },
    options: {
      indexAxis: 'y',
      plugins: {
        title: { display: true, text: 'Top‑5 productos vendidos' }
      },
      hover: efectoHover,
      animation: animacion
    }
  });
})();
</script>
</div>
