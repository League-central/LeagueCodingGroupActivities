class StopWatchTimer {
  int startTime = 0;
  int stopTime = 0;
  boolean running = false;  

  void start() {
    startTime = millis();
    running = true;
  }
  
  void stop() {
    stopTime = millis();
    running = false;
  }
  
  int getElapsedTimeMs() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    } else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  
  int counterSec(){
   return (getElapsedTimeMs() / 1000);
  }
  
  int millisecond(){
    return (getElapsedTimeMs() % 1000);
  }
  
  int second() {
    return (getElapsedTimeMs() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTimeMs() / (1000*60)) % 60;
  }
  int hour() {
    return (getElapsedTimeMs() / (1000*60*60)) % 24;
  }
}
