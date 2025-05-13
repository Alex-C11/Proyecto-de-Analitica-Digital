<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Calendario de Eventos</title>
	
	<!-- Fuentes e íconos -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Estilos externos -->
	<link rel="stylesheet" href="css/fullcalendar.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/home.css">

	<!-- Estilo personalizado -->
	<style>
		body {
			background: linear-gradient(to right,rgba(238, 238, 238, 0),rgba(255, 255, 255, 0));
			font-family: 'Roboto', sans-serif;
			margin: 0;
			padding: 0;
		}

		.container {
	max-width: 85%;
	margin: 60px auto;
	background: rgb(184, 243, 250);
	border-radius: 20px;
	padding: 40px 50px;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
	font-size: 1.1rem;
}


		#calendar {
			padding: 15px;
			border-radius: 15px;
			background:rgb(184, 243, 250);
			box-shadow: inset 0 0 5px rgb(110, 24, 24);
		}

		.fc-event {
			border: none;
			border-radius: 8px;
			font-weight: 600;
			font-size: 0.9rem;
			padding: 2px 6px;
		}

		.fc-toolbar h2 {
			font-weight: 700;
			color: #333;
		}

		.fc-button {
    background: linear-gradient(145deg, #0288d1, #03a9f4) !important;
    border: none !important;
    color: white !important;
    border-radius: 8px !important;
    padding: 6px 14px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
    font-weight: 600;
    transition: all 0.3s ease-in-out;
  }

  .fc-button:hover,
  .fc-button:focus {
    background: linear-gradient(145deg, #039be5, #00bcd4) !important;
    transform: scale(1.05);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
    color: #fff !important;
    outline: none !important;
  }

  .fc-button:active {
    transform: scale(0.97);
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
  }

		.closeon {
			float: right;
			cursor: pointer;
			color: #d32f2f;
			font-size: 20px;
			padding-left: 8px;
		}

		.alert-danger {
			background-color: #ffebee;
			color: #c62828;
			border: 1px solid #ef9a9a;
			padding: 10px;
			border-radius: 5px;
			margin-top: 15px;
		}
   .event-list {
  background: #ffffff;
  padding: 15px;
  border-radius: 12px;
  max-height: 550px;
  overflow-y: auto;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  font-size: 15px;
}

.event-list h4 {
  font-size: 18px;
  text-align: center;
  margin-bottom: 15px;
}

.event-list ul {
	padding-left: 0;
}
.event-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 6px 0;
  border-bottom: 1px dashed #ccc;
}
.event-list li {
	border: none;
	border-bottom: 1px solid #eee;
	padding: 10px 5px;
	font-size: 0.95rem;
}

.fc-event {
  display: flex !important;
  justify-content: space-between;
  align-items: center;
  padding-right: 10px;
}

.fc-event .fc-content {
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.fc-event .closeon {
  font-size: 18px;
  color: #ff4d4d;
  background: #fff;
  border-radius: 50%;
  width: 22px;
  height: 22px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.2s ease-in-out;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
  margin-left: 8px;
}

.fc-event .closeon:hover {
  background-color: #ff4d4d;
  color: #fff;
  transform: scale(1.1);
  cursor: pointer;
}

.event-color {
  width: 15px;
  height: 15px;
  border-radius: 50%;
  flex-shrink: 0;
}

.closeon {
  position: absolute;
  top: 4px;
  right: 4px;
  font-size: 16px;
  background-color: white;
  color: #d32f2f;
  border-radius: 50%;
  padding: 2px 5px;
  cursor: pointer;
  box-shadow: 0 1px 4px rgba(0,0,0,0.2);
  transition: background-color 0.2s ease;
}

.closeon:hover {
  background-color: #f44336;
  color: white;
}


	</style>
</head>
<body>

<?php
include('config.php');
$SqlEventos   = ("SELECT * FROM eventoscalendar");
$resulEventos = mysqli_query($con, $SqlEventos);
?>

<div class="container">
  <div class="row">
    <!-- Calendario -->
    <div class="col-md-8">
      <div id="calendar"></div>
    </div>

    <!-- Contenedor de Eventos (a la derecha del calendario) -->
    <div class="col-md-4">
      <div class="event-list">
        <h3>Eventos Creados</h3>
        <ul id="eventosList" class="list-group">
          <?php
        $SqlLista = ("SELECT * FROM eventoscalendar ORDER BY fecha_inicio ASC");
        $resulLista = mysqli_query($con, $SqlLista);
        while ($evento = mysqli_fetch_array($resulLista)) {
      ?>
        <li class="list-group-item d-flex align-items-center">
          <span class="badge rounded-circle me-2" style="background-color: <?= $evento['color_evento'] ?>; width: 15px; height: 15px; display: inline-block;"></span>
          <div>
            <strong><?= $evento['evento'] ?></strong><br>
            <small><?= date("d/m/Y", strtotime($evento['fecha_inicio'])) ?> - <?= date("d/m/Y", strtotime($evento['fecha_fin'])) ?></small>
          </div>
        </li>
      <?php } ?>
        </ul>
      </div>
    </div>
  </div>
</div>

          


<?php  
	include('modalNuevoEvento.php');
	include('modalUpdateEvento.php');
?>

<!-- Scripts -->
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="locales/es.js"></script>

<script>
$(document).ready(function() {
	$("#calendar").fullCalendar({
		header: {
			left: "prev,next today",
			center: "title",
			right: "month,agendaWeek,agendaDay"
		},
		locale: 'es',
		defaultView: "month",
		navLinks: true,
		editable: true,
		eventLimit: true,
		selectable: true,
		selectHelper: false,

		select: function(start, end) {
			$("#exampleModal").modal();
			$("input[name=fecha_inicio]").val(start.format('DD-MM-YYYY'));
			var valorFechaFin = end.format("DD-MM-YYYY");
			var F_final = moment(valorFechaFin, "DD-MM-YYYY").subtract(1, 'days').format('DD-MM-YYYY');
			$('input[name=fecha_fin]').val(F_final);  
		},

		events: [
			<?php while($dataEvento = mysqli_fetch_array($resulEventos)){ ?>
				{
					_id: '<?php echo $dataEvento['id']; ?>',
					title: '<?php echo $dataEvento['evento']; ?>',
					start: '<?php echo $dataEvento['fecha_inicio']; ?>',
					end: '<?php echo $dataEvento['fecha_fin']; ?>',
					color: '<?php echo $dataEvento['color_evento']; ?>'
				},
			<?php } ?>
		],

		eventRender: function(event, element) {
			element.find(".fc-content").prepend("<span class='closeon material-icons'>&#xe5cd;</span>");
			element.find(".closeon").on("click", function() {
				if (confirm("¿Deseas borrar este evento?")) {
					$("#calendar").fullCalendar("removeEvents", event._id);
					$.ajax({
						type: "POST",
						url: 'deleteEvento.php',
						data: {id: event._id},
						success: function() {
							$(".alert-danger").show();
							setTimeout(function () {
								$(".alert-danger").slideUp(500);
							}, 3000);
						}
					});
				}
			});
		},

		eventDrop: function(event) {
			var idEvento = event._id;
			var start = event.start.format('DD-MM-YYYY');
			var end = event.end ? event.end.format("DD-MM-YYYY") : start;

			$.ajax({
				url: 'drag_drop_evento.php',
				data: 'start=' + start + '&end=' + end + '&idEvento=' + idEvento,
				type: "POST"
			});
		},

		eventClick: function(event) {
			var idEvento = event._id;
			$('input[name=idEvento]').val(idEvento);
			$('input[name=evento]').val(event.title);
			$('input[name=fecha_inicio]').val(event.start.format('DD-MM-YYYY'));
			$('input[name=fecha_fin]').val(event.end ? event.end.format("DD-MM-YYYY") : event.start.format("DD-MM-YYYY"));
			$("#modalUpdateEvento").modal();
		}
	});

	setTimeout(function () {
		$(".alert").slideUp(300);
	}, 3000);
});
</script>

</body>
</html>
