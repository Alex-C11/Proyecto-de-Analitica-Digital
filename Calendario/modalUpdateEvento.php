<style>
  /* Estilos generales para el modal */
  .modal-content {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
    padding: 20px;
  }

  .modal-header {
    border-bottom: 2px solid #f1f1f1;
  }

  .modal-title {
    font-weight: 600;
    color: #333;
  }

  /* Estilos para los inputs */
  .form-control {
    border-radius: 8px;
    border: 1px solid #ddd;
    padding: 12px 15px;
    transition: all 0.3s ease;
  }

  .form-control:focus {
    border-color: #2196F3;
    box-shadow: 0px 0px 10px rgba(33, 150, 243, 0.3);
    outline: none;
  }

  /* Estilos para los radio buttons */
  .circu {
    display: inline-block;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    margin-right: 10px;
    cursor: pointer;
    transition: transform 0.3s ease-in-out;
  }

  input[type="radio"] {
    display: none;
  }

  input[type="radio"]:checked + label {
    transform: scale(1.2);
  }

  input[type="radio"]:checked + label::after {
    content: '\2713';
    color: white;
    position: absolute;
    top: 4px;
    left: 4px;
    font-size: 12px;
  }

  /* Estilos para los botones */
  .btn {
    border-radius: 6px;
    padding: 10px 20px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
  }

  .btn-success {
    background-color: #4CAF50;
    border: none;
  }

  .btn-success:hover {
    background-color: #45a049;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0, 128, 0, 0.2);
  }

  .btn-secondary {
    background-color: #888;
    border: none;
  }

  .btn-secondary:hover {
    background-color: #777;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  }
</style>
<div class="modal" id="modalUpdateEvento"  tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Actualizar mi Evento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
  <form name="formEventoUpdate" id="formEventoUpdate" action="UpdateEvento.php" class="form-horizontal" method="POST">
    <input type="hidden" class="form-control" name="idEvento" id="idEvento">
    <div class="form-group">
      <label for="evento" class="col-sm-12 control-label">Nombre del Evento</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="evento" id="evento" placeholder="Nombre del Evento" required/>
      </div>
    </div>
    <div class="form-group">
      <label for="fecha_inicio" class="col-sm-12 control-label">Fecha Inicio</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="fecha_inicio" id="fecha_inicio" placeholder="Fecha Inicio">
      </div>
    </div>
    <div class="form-group">
      <label for="fecha_fin" class="col-sm-12 control-label">Fecha Final</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="fecha_fin" id="fecha_fin" placeholder="Fecha Final">
      </div>
    </div>

    <div class="col-md-12 activado">
 
      <input type="radio" name="color_evento" id="orangeUpd" value="#FF5722" checked>
      <label for="orangeUpd" class="circu" style="background-color: #FF5722;"> </label>

      <input type="radio" name="color_evento" id="amberUpd" value="#FFC107">  
      <label for="amberUpd" class="circu" style="background-color: #FFC107;"> </label>

      <input type="radio" name="color_evento" id="limeUpd" value="#8BC34A">  
      <label for="limeUpd" class="circu" style="background-color: #8BC34A;"> </label>

      <input type="radio" name="color_evento" id="tealUpd" value="#009688">  
      <label for="tealUpd" class="circu" style="background-color: #009688;"> </label>

      <input type="radio" name="color_evento" id="blueUpd" value="#2196F3">  
      <label for="blueUpd" class="circu" style="background-color: #2196F3;"> </label>

      <input type="radio" name="color_evento" id="indigoUpd" value="#9c27b0">  
      <label for="indigoUpd" class="circu" style="background-color: #9c27b0;"> </label>

    </div>

    
     <div class="modal-footer">
        <button type="submit" class="btn btn-success">Guardar Cambios de mi Evento</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
      </div>
  </form>
      
    </div>
  </div>
</div>