class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);
}

class LinkedList<T> {
  Node<T>? head;
  int _length = 0;

  int get length => _length;

  void add(T value) {
    Node<T> newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node<T> current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
    _length++;
  }

  void insert(int index, T value) {
    if (index < 0 || index > _length) {
      throw "Index out of range";
    }

    Node<T> newNode = Node(value);

    if (index == 0) {
      newNode.next = head;
      head = newNode;
    } else {
      Node<T>? current = head;
      for (int i = 0; i < index - 1; i++) {
        if (current == null) throw "Index out of range";
        current = current.next;
      }

      newNode.next = current!.next;
      current.next = newNode;
    }
    _length++;
  }

  T removeAt(int index) {
    if (index < 0 || index >= _length || head == null) {
      throw "Index out of range";
    }

    if (index == 0) {
      T data = head!.data;
      head = head!.next;
      _length--;
      return data;
    }

    Node<T>? current = head;
    for (int i = 0; i < index - 1; i++) {
      if (current == null) throw "Index out of range";
      current = current.next;
    }

    Node<T>? removedNode = current!.next;
    if (removedNode == null) throw "Index out of range";

    current.next = removedNode.next;
    _length--;

    return removedNode.data;
  }

  bool contains(T value) {
    Node<T>? current = head;
    while (current != null) {
      if (current.data == value) return true;
      current = current.next;
    }
    return false;
  }

  int indexOf(T value) {
    Node<T>? current = head;
    int index = 0;
    while (current != null) {
      if (current.data == value) return index;
      current = current.next;
      index++;
    }
    return -1;
  }

  void clear() {
    head = null;
    _length = 0;
  }

  T operator [](int index) {
    if (index < 0 || index >= _length) {
      throw "Index out of range";
    }

    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    return current!.data;
  }

  void operator []=(int index, T value) {
    if (index < 0 || index >= _length) {
      throw "Index out of range";
    }

    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    current!.data = value;
  }

  LinkedList<T> operator +(LinkedList<T> other) {
    LinkedList<T> newLinkedList = LinkedList<T>();
    Node<T>? current = head;

    while (current != null) {
      newLinkedList.add(current.data);
      current = current.next;
    }

    current = other.head;
    while (current != null) {
      newLinkedList.add(current.data);
      current = current.next;
    }

    return newLinkedList;
  }

  LinkedList<T> operator -(T value) {
    LinkedList<T> newLinkedList = LinkedList<T>();
    Node<T>? current = head;
    bool removed = false;

    while (current != null) {
      if (current.data == value && !removed) {
        removed = true;
      } else {
        newLinkedList.add(current.data);
      }
      current = current.next;
    }

    return newLinkedList;
  }

  void forEach(void Function(T) action) {
    Node<T>? current = head;
    while (current != null) {
      action(current.data);
      current = current.next;
    }
  }

  LinkedList<S> map<S>(S Function(T) transform) {
    LinkedList<S> newLinkedList = LinkedList<S>();
    Node<T>? current = head;
    while (current != null) {
      newLinkedList.add(transform(current.data));
      current = current.next;
    }
    return newLinkedList;
  }

  LinkedList<T> where(bool Function(T) test) {
    LinkedList<T> newLinkedList = LinkedList<T>();
    Node<T>? current = head;
    while (current != null) {
      if (test(current.data)) {
        newLinkedList.add(current.data);
      }
      current = current.next;
    }
    return newLinkedList;
  }

  @override
  String toString() {
    List<T> listOfString = [];
    Node<T>? current = head;
    while (current != null) {
      listOfString.add(current.data);
      current = current.next;
    }
    return 'LinkedList: ${listOfString.toString()}';
  }
}