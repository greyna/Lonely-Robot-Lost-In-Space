part of actionman;

class ActionOverTime {
  final Stopwatch _elapsedTime = new Stopwatch();
  final Duration _step;
  Function _stepF;
  Timer _periodicTimer;
  bool get isRunning => _elapsedTime.isRunning;
  Duration get timeElapsed => _elapsedTime.elapsed;
  
  // if duration set to null, will run until stop called
  ActionOverTime(final Duration duration, final Duration step, final Function actionStep):
    _step = step {
    // closure with constructor parameters
    _stepF = (Timer timer) {
      if (duration != null && timeElapsed >= duration) stop();
      if (!isRunning) timer.cancel();
      else actionStep();
    };
  }
  
  // call start() while already running does nothing
  void start() {
    if (!isRunning) {
      _elapsedTime.start();
      _periodicTimer = new Timer.periodic(_step, _stepF);
    }
  }
  
  // call stop() will reset the ActionOverTime object to his creation state
  void stop() {
    if (isRunning) {
      _elapsedTime.stop();
      _elapsedTime.reset();
    }
  }
  
}