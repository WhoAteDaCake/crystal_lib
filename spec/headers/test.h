// typedef signed int int32_t;
// typedef unsigned char uchar_t;

// typedef struct RGBA_ {
//   uchar_t b;
//   uchar_t g;
//   uchar_t r;
//   uchar_t a;
// } RGBA;

// typedef union LCUI_ARGB8888_ {
//     int32_t value;
//     struct {
//         uchar_t blue;
//         uchar_t green;
//         uchar_t red;
//         uchar_t alpha;
//     };
//     struct {
//       uchar_t b;
//       uchar_t g;
//       uchar_t r;
//       uchar_t h;
//     };
//     RGBA rgba;
// } LCUI_ARGB, LCUI_ARGB8888, LCUI_Color;

// LCUI_Color rgb(uchar_t r, uchar_t g, uchar_t b);

struct point {struct { int x; int y; } nested; };

void test(struct point use);

#define LCUI_BOOL int

typedef struct LCUI_BackgroundPosition {
	LCUI_BOOL using_value;
	union {
		struct {
			float x, y;
		};
		int value;
	};
} LCUI_BackgroundPosition;

void test2(LCUI_BackgroundPosition pos);