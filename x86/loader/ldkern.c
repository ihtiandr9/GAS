#include <include/bios.h>
#include <include/fat/fat12.h>

typedef unsigned char uint8;

BOOT_SECTOR bootsect;
char FAT[9 * 512];
DirElem ROOTDIR[255];
extern short loadkernel(char *buf) asm("loadkernel");
void read_bpb();
void read_fat();
void read_root();

//char *mag_symbol = "literal test";

short make_test(char *buf)
{
  write(buf);
  writeln("");
  put_str("size of char  is ");
  write(sizeof(char));
  writeln("");
  put_str("size of short is ");
  write(sizeof(short));
  writeln("");
  put_str("size of int   is ");
  write(sizeof(int));
  writeln("");
  put_str("size of long  is ");
  write(sizeof(long));
  put_str("size of char*  is ");
  write(sizeof(char *));
  writeln("");
  return 0;
};

/*void invoke_wrapper(){
    invoke8086();
};
*/

short loadkernel(char *buf)
{
  int i;
  long readed;
  uint8 filedesc;
  static const char aLoadingKernel[] = "Loading kernel...";
  make_test(buf);

  readed = 0;
  put_str(aLoadingKernel);
  put_str(" into ");
  write(buf);
  writeln("");
  put_str("Read BPB...");
  read_bpb();
  writeln("Done");
  put_str("Read fat...Address = ");
  write(FAT);
  read_fat();
  writeln(" Done");
  put_str("Read root...Address = ");
  write(ROOTDIR);
  read_root();
  writeln(" Done");
  {
    /* code */
  }

  filedesc = find_file("KERN    BIN");
  if (filedesc >= 0)
  {
    readed = read_file(filedesc, buf);
    if (readed)
    {
      writeln("done");
      write(readed);
      writeln(" bytes readed");
    };
  }
  else
    writeln("Not Found");
  return readed;
}

long read_file(uint8 filedesc, unsigned char *dst)
{
  unsigned char buf[512];
  FileAttribs attr;
  unsigned int i = 0, tmp, cnt, strt, size;
  get_file_attr(filedesc, &attr);
  strt = attr.start;
  size = attr.size;

  while (strt != 0xfff)
  {
    tmp = strt;
    read_abs_sectors(0, tmp + 31, buf, 1);
    if (size >= 512)
    {
      i += 512;
      size -= 512;
      cnt = 512;
    }
    else
    {
      //     memcopy(buf, dst + i, size);
      i += size;
      cnt = size;
    };
    memcopy(buf, dst, cnt);
    dst += cnt;
    //��� �������� ������� �� ��������� �������;
    tmp = tmp * 3 / 2;
    tmp = *(unsigned int *)(FAT + tmp);
    if (strt & 1)
    {
      strt = (tmp / 16) & 4095;
    }
    else
    {
      strt = tmp & 4095;
    };
#ifdef _DD__
    write(strt);
    writeln(" start cluster");
    write(size);
    writeln("bytes remains");
#endif
    if (strt == 0)
      break;
  };
  return i;
};

short find_file(const char *Filename)
{
  int i = 244; // must be 255
#ifdef _DD__
  put_str("finding file");
  writeln(Filename);
#endif
  while (i >= 0)
  {
    if (0 == strcmpex(Filename, ROOTDIR[i].FileName, 11))
      break;
#ifdef _DD__
    else
      put_str("File at descriptor ");
    write(i);
    put_str(" ");
    writeln(ROOTDIR[i].FileName);
#endif
    i--;
  };
  if (i >= 0)
  {
#ifdef _DD__
    put_str("File ");
    put_str(Filename);
    writeln("Found at:");
    put_str("Descriptor=");
    write(i);
    put_str("size = ");
    write(ROOTDIR[i].Size);
    put_str("startsector = ");
    write(ROOTDIR[i].FatNum);
    writeln("");
#endif
  };
  return i;
};

void read_bpb()
{
  //  bios_disk_read(0, 0, 0, 1, &bootsect, 1);
  read_abs_sectors(0, 0, &bootsect, 1);
  put_str("Fat allocated in ");
  write(bootsect.bpb.BPB_FATSz16);
  writeln(" sectors");
};

void read_fat()
{
  //bios_disk_read(0, 0, 0, 2, &FAT, bootsect.bpb.BPB_FATSz16);
  read_abs_sectors(0, 1, FAT, bootsect.bpb.BPB_FATSz16);
  put_str("first chain entry ");
  write((int)FAT[0]);
};

void read_root()
{
  read_abs_sectors(0, 19, ROOTDIR, 2);
  put_str("first root entry ");
  writeln(ROOTDIR[0].FileName);
};

void get_file_attr(
    uint8 filedesc,
    FileAttribs *attribs)
{
  attribs->size = ROOTDIR[filedesc].Size;
  attribs->start = ROOTDIR[filedesc].FatNum;
  attribs->filedesc = filedesc;
}
