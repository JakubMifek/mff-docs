#include <Queue.h>
#include <Servo.h>

// Written by Jaroslav Moravec & Jakub Mifek

class RotateCounter {
  private:
  int lines = -1;
  
  public:
  bool wasDark = false;
  
  void update(bool midSensor) {
    bool isDark = midSensor;
    if(wasDark && !isDark) {
      lines++;
    }

    wasDark = isDark;
  }

  void reset() {
    wasDark = false;
    lines = -1;
  }

  int seenLines() {
    return lines;
  }
};

class LineCounter {
  private:
  int lines = 0;
  
  public:
  bool wasDark = false;
  
  void update(bool endLeftSensor, bool endRightSensor) {
    bool isDark = endLeftSensor || endRightSensor;
    if(wasDark && !isDark) {
      lines++;
    }

    wasDark = isDark;
  }

  void reset() {
    wasDark = false;
    lines = 0;
  }

  int seenLines() {
    return lines;
  }
};

class Motor : public Servo {
  public:
    void go(int percentage) {
      writeMicroseconds(1500+2*percentage);
    }
};

enum Direction { NORTH, WEST, SOUTH, EAST };
enum Task { ROTATE, VERTICAL, HORIZONTAL, HOLD, WAIT };

Motor leftMotor, rightMotor;
bool doCircuit = false;

const float spd = 0.25f;
const int holdTime = 100;
const float leftAdd = 0.01;
const float rightAdd = 0.01;
const float turnWheel = 0;

float leftWheel = 0.0f;
float rightWheel = 0.0f;

int positionHorizontal = 'A' - 'A' + 1;
int positionVertical = 1;
Direction dir = NORTH;

Task task = WAIT;
int param = 0;

Queue<Task> tasks;
Queue<int> params;

unsigned long startTime;

LineCounter lineCounter;
RotateCounter rotateCounter;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  leftMotor.attach(12, 500, 2500);
  rightMotor.attach(13, 500, 2500);

  pinMode(2, INPUT_PULLUP);
    
  pinMode(11, OUTPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  
  digitalWrite(11, LOW);
}

void stop() {
  leftWheel = 0;
  rightWheel = 0;
}

void updateProperties() {
  int endLeftSensor = digitalRead(3) == 0;
  int endRightSensor = digitalRead(7) == 0;

  lineCounter.update(endLeftSensor, endRightSensor);
}

void finalizeTask() {
  task = tasks.dequeue();
  param = params.dequeue();
  lineCounter.reset();
  rotateCounter.reset();
}

void holdLine() {
  leftWheel = min(100, leftWheel + leftAdd);
  rightWheel = max(-100, rightWheel - rightAdd);
}

void turnLeft() {
  leftWheel = leftWheel < -turnWheel ? min(-turnWheel, leftWheel + leftAdd) : max(-turnWheel, leftWheel - leftAdd);
  rightWheel = max(-100, rightWheel - rightAdd);
}

void turnRight() {
  leftWheel = min(100, leftWheel + leftAdd);
  rightWheel = rightWheel < turnWheel ? min(turnWheel, rightWheel + rightAdd) : max(turnWheel, rightWheel - rightAdd);
}

void verifyTask() {
  switch(task) {
    case ROTATE:
      if(param - rotateCounter.seenLines() <= 0 || param == 0) {
        finalizeTask();
      }
      break;
    case VERTICAL:
      if(positionVertical == param) {
        finalizeTask();
      } else {
        if(abs(param - positionVertical) == lineCounter.seenLines()) {
          lineCounter.reset();
          rotateCounter.reset();
          positionVertical = param;
          task = HOLD;
          param = millis() - startTime + holdTime;
        }
      }
      break;
    case HORIZONTAL:
      if(positionHorizontal == param) {
        finalizeTask();
      } else {
        if(abs(param - positionHorizontal) == lineCounter.seenLines()) {
          lineCounter.reset();
          rotateCounter.reset();
          positionHorizontal = param;
          task = HOLD;
          param = millis() - startTime + holdTime;
        }
      }
      break;
    case HOLD:
      if(millis() - startTime - param >= 0) {
        finalizeTask();
      }
      break;
    case WAIT:
      if(millis() - startTime - param >= 0) {
        Task nextTask = tasks.front();
        int nextParam = params.front();

        task = ROTATE;
        lineCounter.reset();
        rotateCounter.reset();

        switch(nextTask) {
          HORIZONTAL:
            switch(dir){
              case NORTH:
                param = nextParam - positionHorizontal > 0 ? 1 : -1;
                break;
              case SOUTH:
                param = nextParam - positionHorizontal > 0 ? -1 : 1;
                break;
              case WEST:
                param = nextParam - positionHorizontal > 0 ? 2 : 0;
                break;
              case EAST:
                param = nextParam - positionHorizontal > 0 ? 0 : 2;
                break;
            }
            break;
          VERTICAL:
            switch(dir) {
              case NORTH:
                param = nextParam - positionVertical > 0 ? 0 : 2;
                break;
              case SOUTH:
                param = nextParam - positionVertical > 0 ? 2 : 0;
                break;
              case WEST:
                param = nextParam - positionVertical > 0 ? 1 : -1;
                break;
              case EAST:
                param = nextParam - positionVertical > 0 ? -1 : 1;
                break;
              }
            break;
          default:
            break;
        }
      }
      break;
  }
}

void handleTask() {
  
}

/*
  int endLeftSensor = digitalRead(3) == 0;
  int leftSensor = digitalRead(4) == 0;
  int midSensor = digitalRead(5) == 0;
  int rightSensor = digitalRead(6) == 0;
  int endRightSensor = digitalRead(7) == 0;
 */
void runMotors() {
  updateProperties();
  verifyTask();
  handleTask();
}

void loop() {
  if(doCircuit) {
    startTime = millis();
    runMotors();
  }
  else{
    stop();
    int buttonVal = digitalRead(2);
    if(buttonVal == LOW) {
      while(!tasks.isEmpty())
        tasks.dequeue();
      while(!params.isEmpty())
        params.dequeue();
      tasks.enqueue(HORIZONTAL);
      params.enqueue('B' - 'A' + 1);
      tasks.enqueue(VERTICAL);
      params.enqueue('2');
      doCircuit = true;
    }
  }
}
