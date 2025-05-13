<div class="container is-fluid mb-6">
	<h1 class="title">Calendario</h1>
	<h2 class="subtitle"><i class="fas fa-calendar fa-fw"></i> &nbsp; Evento por calendario</h2>
</div>
<style>
  .calendar-frame-wrapper {
    width: 100%;
    height: calc(100vh - 100px); /* Ajusta el 100px al alto de tu header/nav horizontal */
    overflow: hidden;
  }

  .calendar-frame-wrapper iframe {
    width: 100%;
    height: 100%;
    border: none;
  }
</style>

<div class="calendar-frame-wrapper">
  <iframe 
    src="http://localhost/Calendario" 
    allowfullscreen
  ></iframe>
</div>

