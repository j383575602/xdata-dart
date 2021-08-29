
import 'dart:math';
import 'dart:typed_data';

class LinkedBuffer {
  int size;
  Buffer head;
  Buffer tail;
  Buffer current;
  int bufferCount;

  void reset() {
    this.current = this.head;
    this.tail = this.current;
    bufferCount = 1;
  }

  LinkedBuffer(this.size) {
    this.current = Buffer(size);
    this.head = this.current;
    this.tail = this.current;
    bufferCount = 1;
  }

  void writeByte(int b) {
    int space = current.space();
    if (space > 0) {
      current.writeByte(b);
    } else if (current.next == null) {
      increaseBuffer();
      current.writeByte(b);
    } else {
      current = current.next;
      current.position = 0;
      current.writeByte(b);
    }
  }

  void writeBytes(Int8List bytes) {
    var wrote = 0;
    var remain;
    while((remain = bytes.length - wrote) > 0) {
      var space = this.current.space();
      var count = min<int>(space,remain);
      this.current.writeBytes(bytes,wrote,count);
      if (space < remain) {
        if (this.current.next == null) {
          this.increaseBuffer();
        } else {
          this.current = this.current.next;
          this.current.position = 0;
        }
      }
      wrote += count;
    }
  }

  void writeUBytes(Uint8List bytes) {
    var wrote = 0;
    var remain;
    while((remain = bytes.length - wrote) > 0) {
      var space = this.current.space();
      var count = min<int>(space,remain);
      this.current.writeUBytes(bytes,wrote,count);
      if (space < remain) {
        if (this.current.next == null) {
          this.increaseBuffer();
        } else {
          this.current = this.current.next;
          this.current.position = 0;
        }
      }
      wrote += count;
    }
  }

  void increaseBuffer() {
    bufferCount ++;
    current.next = new Buffer(size);
    current.next.index = current.index+1;
    current = current.next;
    tail = current;
  }

  void jump(count) {
    var currentLeft = this.current.space();
    if (count <= currentLeft) {
      this.current.position += count;
      return;
    }
    var bufferNeed = ((count - currentLeft + size -1) ~/ size);
    var left = (count - currentLeft) % size;
    this.current.position = size;
    for(var i=0;i<bufferNeed;i++) {
      if (this.current.next == null) {
        this.increaseBuffer();
      } else {
        this.current.position = size;
        this.current = this.current.next;
      }
    }
    this.current.position = left;
  }

  void seek(position) {
    var index = (position ~/ size);
    var left = position % size;
    var b = this.head;
    for(var i=0;i<index;i++) {
      b.position = size;
      b = b.next;
      if (b != null) {
        this.current = b;
      }
    }
    if (b != null) {
      b.position = left;
      this.current = b;
    }
  }

  int getPosition() {
    return this.current.index * this.size + this.current.position;
  }

  int getTotalSize() {
    var full = (this.bufferCount-1) * this.size;
    var size =full + this.current.position;
    print("getTotalSize:$size");
    return size;
  }

  Int8List toBytes() {
    var totalSize = this.getTotalSize();
    var resultBuffer = new Int8List(totalSize);
    var resultDataView = ByteData.view(resultBuffer.buffer,0,totalSize);

    var h = this.head;
    var index = 0;
    var count = (totalSize ~/ size);
    var left = totalSize % size;
    for(var i=0;i<count;i++) {
      for(var j=0;j<h.position;j++) {
        resultDataView.setInt8(index,h.data.getInt8(j));
        index++;
      }
      h = h.next;
    }
    if (h != null && left > 0) {
      print("has remaing:${h.position}");
      for(var j=0;j<h.position;j++) {
        resultDataView.setInt8(index,h.data.getInt8(j));
        index++;
      }
    }
    return resultBuffer;
  }
}

class Buffer {
  int size;
  Int8List buffer;
  ByteData data;
  int position = 0;
  int index = 0;
  Buffer next = null;

  Buffer(this.size) {
    buffer = Int8List(this.size);
    data = ByteData.view(buffer.buffer,0,size);
  }

  void writeByte(int b) {
    data.setInt8(position++, b);
  }

  void writeBytes(Int8List bytes, int start, int count) {
    for(int i=start;i<start+count;i++) {
      writeByte(bytes[i]);
    }
  }

  void writeUBytes(Uint8List bytes, int start, int count) {
    for(int i=start;i<start+count;i++) {
      writeByte(bytes[i]);
    }
  }

  int space() {
    return buffer.length - position;
  }
}
