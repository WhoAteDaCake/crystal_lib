#include <stdbool.h>

typedef struct LCUI_BackgroundPosition {
	int using_value;
	union {
		struct {
			bool x, y;
		};
		int value;
	};
} LCUI_BackgroundPosition;