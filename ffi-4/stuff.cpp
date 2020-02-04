class Box
{
public:
  Box() {
  }
  ~Box() {
  }
  void setVal(int x) {
    val = x;
  }
  int getVal() {
    return val;
  }
private:
  int val;
};

extern "C" {

typedef void * CBOX;

CBOX makeBox() {
  return (CBOX)(new Box());
}

void destroyBox(CBOX b) {
  delete (Box *) b;
}

void setVal(CBOX b, int x) {
  ((Box *) b)->setVal(x);
}

int getVal(CBOX b) {
  return ((Box *) b)->getVal();
}

}
