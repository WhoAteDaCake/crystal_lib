@[Link("gtk+-3.0")]
@[Link(ldflags: "-I/home/ubuntu/projects/sciter-tests/api/include -I/usr/include/glib-2.0")]
lib LibScitter
  TIMER_ABSTIME = 1
  SCITER_API_VERSION = 9
  struct SciterRequestApi
    request_use : (Hrequest -> RequestResult)
    request_un_use : (Hrequest -> RequestResult)
    request_url : (Hrequest, (Lpcstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_content_url : (Hrequest, (Lpcstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_request_type : (Hrequest, RequestRqType* -> RequestResult)
    request_get_requested_data_type : (Hrequest, SciterResourceType* -> RequestResult)
    request_get_received_data_type : (Hrequest, (Lpcstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_number_of_parameters : (Hrequest, Uint* -> RequestResult)
    request_get_nth_parameter_name : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_nth_parameter_value : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_times : (Hrequest, Uint*, Uint* -> RequestResult)
    request_get_number_of_rq_headers : (Hrequest, Uint* -> RequestResult)
    request_get_nth_rq_header_name : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_nth_rq_header_value : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_number_of_rsp_headers : (Hrequest, Uint* -> RequestResult)
    request_get_nth_rsp_header_name : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_nth_rsp_header_value : (Hrequest, Uint, (Lpcwstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_completion_status : (Hrequest, RequestState*, Uint* -> RequestResult)
    request_get_proxy_host : (Hrequest, (Lpcstr, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
    request_get_proxy_port : (Hrequest, Uint* -> RequestResult)
    request_set_succeeded : (Hrequest, Uint, Lpcbyte, Uint -> RequestResult)
    request_set_failed : (Hrequest, Uint, Lpcbyte, Uint -> RequestResult)
    request_append_data_chunk : (Hrequest, Lpcbyte, Uint -> RequestResult)
    request_set_rq_header : (Hrequest, Lpcwstr, Lpcwstr -> RequestResult)
    request_set_rsp_header : (Hrequest, Lpcwstr, Lpcwstr -> RequestResult)
    request_set_received_data_type : (Hrequest, Lpcstr -> RequestResult)
    request_set_received_data_encoding : (Hrequest, Lpcstr -> RequestResult)
    request_get_data : (Hrequest, (Lpcbyte, Uint, Lpvoid -> Void), Lpvoid -> RequestResult)
  end
  alias Hrequest = Void*
  enum RequestResult
    RequestPanic = -1
    RequestOk = 0
    RequestBadParam = 1
    RequestFailure = 2
    RequestNotsupported = 3
  end
  alias Char = LibC::Char
  alias Lpcstr = Char*
  alias Uint = LibC::UInt
  alias Lpvoid = Void*
  alias Void = Void
  enum RequestRqType
    RrtGet = 1
    RrtPost = 2
    RrtPut = 3
    RrtDelete = 4
    RrtForceDword = -1
  end
  enum SciterResourceType
    RtDataHtml = 0
    RtDataImage = 1
    RtDataStyle = 2
    RtDataCursor = 3
    RtDataScript = 4
    RtDataRaw = 5
    RtDataFont = 6
    RtDataSound = 7
    RtDataForceDword = -1
  end
  alias X__Uint16T = LibC::UShort
  alias X__UintLeast16T = X__Uint16T
  alias Char16T = X__UintLeast16T
  alias Wchar = Char16T
  alias Lpcwstr = Wchar*
  enum RequestState
    RsPending = 0
    RsSuccess = 1
    RsFailure = 2
    RsForceDword = -1
  end
  alias Byte = UInt8
  alias Lpcbyte = Byte*
    # ValueInit - initialize VALUE storage
  # This call has to be made before passing VALUE* to any other functions
fun value_init = ValueInit(pval : Value*) : Uint
  struct Value
    t : Uint
    u : Uint
    d : Uint64
  end
  alias Uint64 = LibC::ULongLong
    # ValueClear - clears the VALUE and deallocates all assosiated structures that are not used anywhere else.
fun value_clear = ValueClear(pval : Value*) : Uint
    # ValueCompare - compares two values, returns HV_OK_TRUE if val1 == val2.
fun value_compare = ValueCompare(pval1 : Value*, pval2 : Value*) : Uint
    # ValueCopy - copies src VALUE to dst VALUE. dst VALUE must be in ValueInit state.
fun value_copy = ValueCopy(pdst : Value*, psrc : Value*) : Uint
    # ValueIsolate - converts T_OBJECT value types to T_MAP or T_ARRAY.
  # use this method if you need to pass values between different threads.
  # The fanction is applicable for the Sciter
fun value_isolate = ValueIsolate(pdst : Value*) : Uint
    # ValueType - returns VALUE_TYPE and VALUE_UNIT_TYPE flags of the VALUE
fun value_type = ValueType(pval : Value*, p_type : Uint*, p_units : Uint*) : Uint
    # ValueStringData - returns string data for T_STRING type
  # For T_FUNCTION returns name of the fuction.
fun value_string_data = ValueStringData(pval : Value*, p_chars : Lpcwstr*, p_num_chars : Uint*) : Uint
    # ValueStringDataSet - sets VALUE to T_STRING type and copies chars/numChars to
  # internal refcounted buffer assosiated with the value.
fun value_string_data_set = ValueStringDataSet(pval : Value*, chars : Lpcwstr, num_chars : Uint, units : Uint) : Uint
    # ValueIntData - retreive integer data of T_INT, T_LENGTH and T_BOOL types
fun value_int_data = ValueIntData(pval : Value*, p_data : Int*) : Uint
  alias Int = LibC::Int
    # ValueIntDataSet - sets VALUE integer data of T_INT and T_BOOL types 
  # Optionally sets units field too.
fun value_int_data_set = ValueIntDataSet(pval : Value*, data : Int, type : Uint, units : Uint) : Uint
    # ValueInt64Data - retreive 64bit integer data of T_CURRENCY and T_DATE values.
fun value_int64_data = ValueInt64Data(pval : Value*, p_data : Int64*) : Uint
  alias Int64 = LibC::LongLong
    # ValueInt64DataSet - sets 64bit integer data of T_CURRENCY and T_DATE values.
fun value_int64_data_set = ValueInt64DataSet(pval : Value*, data : Int64, type : Uint, units : Uint) : Uint
    # ValueFloatData - retreive FLOAT_VALUE (double) data of T_FLOAT and T_LENGTH values.
fun value_float_data = ValueFloatData(pval : Value*, p_data : LibC::Double*) : Uint
    # ValueFloatDataSet - sets FLOAT_VALUE data of T_FLOAT and T_LENGTH values.
fun value_float_data_set = ValueFloatDataSet(pval : Value*, data : LibC::Double, type : Uint, units : Uint) : Uint
    # ValueBinaryData - retreive integer data of T_BYTES type
fun value_binary_data = ValueBinaryData(pval : Value*, p_bytes : Lpcbyte*, pn_bytes : Uint*) : Uint
    # ValueBinaryDataSet - sets VALUE to sequence of bytes of type T_BYTES 
  # 'type' here must be set to T_BYTES. Optionally sets units field too.
  # The function creates local copy of bytes in its own storage.
fun value_binary_data_set = ValueBinaryDataSet(pval : Value*, p_bytes : Lpcbyte, n_bytes : Uint, type : Uint, units : Uint) : Uint
    # ValueElementsCount - retreive number of sub-elements for:
  # - T_ARRAY - number of elements in the array; 
  # - T_MAP - number of key/value pairs in the map;
  # - T_FUNCTION - number of arguments in the function;
fun value_elements_count = ValueElementsCount(pval : Value*, pn : Int*) : Uint
    # ValueNthElementValue - retreive value of sub-element at index n for:
  # - T_ARRAY - nth element of the array; 
  # - T_MAP - value of nth key/value pair in the map;
  # - T_FUNCTION - value of nth argument of the function;
fun value_nth_element_value = ValueNthElementValue(pval : Value*, n : Int, pretval : Value*) : Uint
    # ValueNthElementValueSet - sets value of sub-element at index n for:
  # - T_ARRAY - nth element of the array; 
  # - T_MAP - value of nth key/value pair in the map;
  # - T_FUNCTION - value of nth argument of the function;
  # If the VALUE is not of one of types above then it makes it of type T_ARRAY with 
  # single element - 'val_to_set'.
fun value_nth_element_value_set = ValueNthElementValueSet(pval : Value*, n : Int, pval_to_set : Value*) : Uint
    # ValueEnumElements - enumeartes key/value pairs of T_MAP, T_FUNCTION and T_OBJECT values
  # - T_MAP - key of nth key/value pair in the map;
  # - T_FUNCTION - name of nth argument of the function (if any);
fun value_nth_element_key = ValueNthElementKey(pval : Value*, n : Int, pretval : Value*) : Uint
  fun value_enum_elements = ValueEnumElements(pval : Value*, penum : (Lpvoid, Value*, Value* -> Sbool), param : Lpvoid) : Uint
  alias Sbool = LibC::Int
    # ValueSetValueToKey - sets value of sub-element by key:
  # - T_MAP - value of key/value pair with the key;
  # - T_FUNCTION - value of argument with the name key;
  # - T_OBJECT (tiscript) - value of property of the object
  # If the VALUE is not of one of types above then it makes it of type T_MAP with 
  # single pair - 'key'/'val_to_set'.
  # 
  # key usually is a value of type T_STRING
fun value_set_value_to_key = ValueSetValueToKey(pval : Value*, pkey : Value*, pval_to_set : Value*) : Uint
    # ValueGetValueOfKey - retrieves value of sub-element by key:
  # - T_MAP - value of key/value pair with the key;
  # - T_FUNCTION - value of argument with the name key;
  # - T_OBJECT (tiscript) - value of property of the object
  # Otherwise *pretval will have T_UNDEFINED value.
fun value_get_value_of_key = ValueGetValueOfKey(pval : Value*, pkey : Value*, pretval : Value*) : Uint
    # ValueToString - converts value to T_STRING inplace:
  # - CVT_SIMPLE - parse/emit terminal values (T_INT, T_FLOAT, T_LENGTH, T_STRING)
  # - CVT_JSON_LITERAL - parse/emit value using JSON literal rules: {}, [], "string", true, false, null 
  # - CVT_JSON_MAP - parse/emit MAP value without enclosing '{' and '}' brackets.
fun value_to_string = ValueToString(pval : Value*, how : Uint) : Uint
    # ValueFromString - parses string into value:
  # - CVT_SIMPLE - parse/emit terminal values (T_INT, T_FLOAT, T_LENGTH, T_STRING), "guess" non-strict parsing
  # - CVT_JSON_LITERAL - parse/emit value using JSON literal rules: {}, [], "string", true, false, null 
  # - CVT_JSON_MAP - parse/emit MAP value without enclosing '{' and '}' brackets.
  # Returns:
  # Number of non-parsed characters in case of errors. Thus if string was parsed in full it returns 0 (success)
fun value_from_string = ValueFromString(pval : Value*, str : Lpcwstr, str_length : Uint, how : Uint) : Uint
    # ValueInvoke - function invocation (Sciter/TIScript).
  # - VALUE* pval is a value of type T_OBJECT/UT_OBJECT_FUNCTION
  # - VALUE* pthis - object that will be known as 'this' inside that function.
  # - UINT argc, const VALUE* argv - vector of arguments to pass to the function. 
  # - VALUE* pretval - parse/emit MAP value without enclosing '{' and '}' brackets.
  # - LPCWSTR url - url or name of the script - used for error reporting in the script.
  # Returns:
  # HV_OK, HV_BAD_PARAMETER or HV_INCOMPATIBLE_TYPE
fun value_invoke = ValueInvoke(pval : Value*, pthis : Value*, argc : Uint, argv : Value*, pretval : Value*, url : Lpcwstr) : Uint
    # ValueNativeFunctorSet - set reference to native function
  # - VALUE* pval - value to be initialized 
  # - NATIVE_FUNCTOR_INVOKE* pinvoke - reference to native functor implementation.
  # - NATIVE_FUNCTOR_RELEASE* prelease - reference to native functor dtor implementation.
  # - VOID* tag - optional tag, passed as it is to pinvoke and prelease
  # Returns:
  # HV_OK, HV_BAD_PARAMETER
fun value_native_functor_set = ValueNativeFunctorSet(pval : Value*, pinvoke : (Void*, Uint, Value*, Value* -> Void), prelease : (Void* -> Void), tag : Void*) : Uint
  fun value_is_native_functor = ValueIsNativeFunctor(pval : Value*) : Sbool
  struct BehaviorEventParams
    cmd : Uint
    he_target : Helement
    he : Helement
    reason : UintPtr
    data : SciterValue
    name : Lpcwstr
  end
  alias Helement = Void*
  alias UintPtr = LibC::SizeT
  alias SciterValue = Value
  struct MethodParams
    method_id : Uint
  end
  fun sciter_use_element = Sciter_UseElement(he : Helement) : Int
    # Marks DOM object as unused (a.k.a. Release).
  # Get handle of every element's child element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # Application should call this function when it does not need element's
  # handle anymore.
  # \sa #Sciter_UseElement()
fun sciter_unuse_element = Sciter_UnuseElement(he : Helement) : Int
    # Get root DOM element of HTML document.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to get root
  # element
  # \param[out ] phe \b #HELEMENT*, variable to receive root element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # Root DOM object is always a 'HTML' element of the document.
fun sciter_get_root_element = SciterGetRootElement(hwnd : GtkWidget*, phe : Helement*) : Int
  struct X_GtkWidget
    parent_instance : GInitiallyUnowned
    priv : GtkWidgetPrivate
  end
  alias GtkWidget = X_GtkWidget
  struct X_GObject
    g_type_instance : GTypeInstance
    ref_count : Guint
    qdata : GData
  end
  alias GInitiallyUnowned = X_GObject
  struct X_GTypeInstance
    g_class : GTypeClass*
  end
  alias GTypeInstance = X_GTypeInstance
  struct X_GTypeClass
    g_type : GType
  end
  alias GTypeClass = X_GTypeClass
  alias Gsize = LibC::ULong
  alias GType = Gsize
  alias Guint = LibC::UInt
  type GData = Void*
  type GtkWidgetPrivate = Void*
    # Get focused DOM element of HTML document.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to get focus
  # element
  # \param[out ] phe \b #HELEMENT*, variable to receive focus element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # phe can have null value (0).
  # 
  # COMMENT: To set focus on element use SciterSetElementState(STATE_FOCUS,0)
fun sciter_get_focus_element = SciterGetFocusElement(hwnd : GtkWidget*, phe : Helement*) : Int
    # Find DOM element by coordinate.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to find
  # elementz
  # \param[in] pt \b POINT, coordinates, window client area relative.
  # \param[out ] phe \b #HELEMENT*, variable to receive found element handle.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # If element was not found then *phe will be set to zero.
fun sciter_find_element = SciterFindElement(hwnd : GtkWidget*, pt : Point, phe : Helement*) : Int
  struct TagPoint
    x : Int
    y : Int
  end
  alias Point = TagPoint
    # Get number of child elements.
  # \param[in] he \b #HELEMENT, element which child elements you need to count
  # \param[out] count \b UINT*, variable to receive number of child elements
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # for paragraph defined as
  # \verbatim <p>Hello <b>wonderfull</b> world!</p> \endverbatim
  # count will be set to 1 as the paragraph has only one sub element:
  # \verbatim <b>wonderfull</b> \endverbatim
fun sciter_get_children_count = SciterGetChildrenCount(he : Helement, count : Uint*) : Int
    # Get handle of every element's child element.
  # \param[in] he \b #HELEMENT
  # \param[in] n \b UINT, number of the child element
  # \param[out] phe \b #HELEMENT*, variable to receive handle of the child
  # element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # for paragraph defined as
  # \verbatim <p>Hello <b>wonderfull</b> world!</p> \endverbatim
  # *phe will be equal to handle of &lt;b&gt; element:
  # \verbatim <b>wonderfull</b> \endverbatim
fun sciter_get_nth_child = SciterGetNthChild(he : Helement, n : Uint, phe : Helement*) : Int
    # Get parent element.
  # \param[in] he \b #HELEMENT, element which parent you need
  # \param[out] p_parent_he \b #HELEMENT*, variable to recieve handle of the
  # parent element
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_parent_element = SciterGetParentElement(he : Helement, p_parent_he : Helement*) : Int
    # Get html representation of the element.
  # \param[in] he \b #HELEMENT
  # \param[in] outer \b SBOOL, if TRUE will return outer HTML otherwise inner.
  # \param[in] rcv \b pointer to function receiving UTF8 encoded HTML.
  # \param[in] rcv_param \b parameter that passed to rcv as it is.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_html_cb = SciterGetElementHtmlCB(he : Helement, outer : Sbool, rcv : (Lpcbyte, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get inner text of the element as LPCWSTR (utf16 words).
  # \param[in] he \b #HELEMENT
  # \param[in] rcv \b pointer to the function receiving UTF16 encoded plain text
  # \param[in] rcv_param \b param passed that passed to LPCWSTR_RECEIVER "as is"
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_text_cb = SciterGetElementTextCB(he : Helement, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Set inner text of the element from LPCWSTR buffer (utf16 words).
  # \param[in] he \b #HELEMENT
  # \param[in] utf16words \b pointer, UTF16 encoded plain text
  # \param[in] length \b UINT, number of words in utf16words sequence
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_set_element_text = SciterSetElementText(he : Helement, utf16 : Lpcwstr, length : Uint) : Int
    # Get number of element's attributes.
  # \param[in] he \b #HELEMENT
  # \param[out] p_count \b LPUINT, variable to receive number of element
  # attributes.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_attribute_count = SciterGetAttributeCount(he : Helement, p_count : Lpuint) : Int
  alias Lpuint = Uint*
    # Get value of any element's attribute by attribute's number.
  # \param[in] he \b #HELEMENT
  # \param[in] n \b UINT, number of desired attribute
  # \param[out] p_name \b LPCSTR*, will be set to address of the string
  # containing attribute name
  # \param[out] p_value \b LPCWSTR*, will be set to address of the string
  # containing attribute value
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_nth_attribute_name_cb = SciterGetNthAttributeNameCB(he : Helement, n : Uint, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_get_nth_attribute_value_cb = SciterGetNthAttributeValueCB(he : Helement, n : Uint, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_get_attribute_by_name_cb = SciterGetAttributeByNameCB(he : Helement, name : Lpcstr, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Set attribute's value.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, attribute name
  # \param[in] value \b LPCWSTR, new attribute value or 0 if you want to remove attribute.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_set_attribute_by_name = SciterSetAttributeByName(he : Helement, name : Lpcstr, value : Lpcwstr) : Int
    # Remove all attributes from the element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_clear_attributes = SciterClearAttributes(he : Helement) : Int
    # Get element index.
  # \param[in] he \b #HELEMENT
  # \param[out] p_index \b LPUINT, variable to receive number of the element
  # among parent element's subelements.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_index = SciterGetElementIndex(he : Helement, p_index : Lpuint) : Int
    # Get element's type.
  # \param[in] he \b #HELEMENT
  # \param[out] p_type \b LPCSTR*, receives name of the element type.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # For &lt;div&gt; tag p_type will be set to "div".
fun sciter_get_element_type = SciterGetElementType(he : Helement, p_type : Lpcstr*) : Int
    # Get element's type.
  # \param[in] he \b #HELEMENT
  # \param[out] rcv \b LPCSTR_RECEIVER, receives name of the element type.
  # \param[out] rcv_param \b LPVOID, parameter passed as it is to the receiver.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_type_cb = SciterGetElementTypeCB(he : Helement, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get element's style attribute.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, name of the style attribute
  # \param[in] rcv \b pointer to the function receiving UTF16 encoded plain text
  # \param[in] rcv_param \b param passed that passed to LPCWSTR_RECEIVER "as is"
  # 
  # Style attributes are those that are set using css. E.g. "font-face: arial" or "display: block".
  # 
  # \sa #SciterSetStyleAttribute()
fun sciter_get_style_attribute_cb = SciterGetStyleAttributeCB(he : Helement, name : Lpcstr, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get element's style attribute.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, name of the style attribute
  # \param[out] value \b LPCWSTR, value of the style attribute.
  # 
  # Style attributes are those that are set using css. E.g. "font-face: arial" or "display: block".
  # 
  # \sa #SciterGetStyleAttribute()
fun sciter_set_style_attribute = SciterSetStyleAttribute(he : Helement, name : Lpcstr, value : Lpcwstr) : Int
  fun sciter_get_element_location = SciterGetElementLocation(he : Helement, p_location : Lprect, areas : Uint) : Int
  struct TagRect
    left : Int
    top : Int
    right : Int
    bottom : Int
  end
  alias Lprect = TagRect*
  fun sciter_scroll_to_view = SciterScrollToView(he : Helement, sciter_scroll_flags : Uint) : Int
    # Apply changes and refresh element area in its window.
  # \param[in] he \b #HELEMENT
  # \param[in] andForceRender \b SBOOL, TRUE to force UpdateWindow() call.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_update_element = SciterUpdateElement(he : Helement, and_force_render : Sbool) : Int
    # refresh element area in its window.
  # \param[in] he \b #HELEMENT
  # \param[in] rc \b RECT, rect to refresh.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_refresh_element_area = SciterRefreshElementArea(he : Helement, rc : Rect) : Int
  alias Rect = TagRect
    # Set the mouse capture to the specified element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # After call to this function all mouse events will be targeted to the element.
  # To remove mouse capture call ReleaseCapture() function.
fun sciter_set_capture = SciterSetCapture(he : Helement) : Int
  fun sciter_release_capture = SciterReleaseCapture(he : Helement) : Int
    # Get HWINDOW of containing window.
  # \param[in] he \b #HELEMENT
  # \param[out] p_hwnd \b HWINDOW*, variable to receive window handle
  # \param[in] rootWindow \b SBOOL, handle of which window to get:
  # - TRUE - Sciter window
  # - FALSE - nearest parent element having overflow:auto or :scroll
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_hwnd = SciterGetElementHwnd(he : Helement, p_hwnd : GtkWidget**, root_window : Sbool) : Int
    # Combine given URL with URL of the document element belongs to.
  # \param[in] he \b #HELEMENT
  # \param[in, out] szUrlBuffer \b LPWSTR, at input this buffer contains
  # zero-terminated URL to be combined, after function call it contains
  # zero-terminated combined URL
  # \param[in] UrlBufferSize \b UINT, size of the buffer pointed by
  # \c szUrlBuffer
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function is used for resolving relative references.
fun sciter_combine_url = SciterCombineURL(he : Helement, sz_url_buffer : Lpwstr, url_buffer_size : Uint) : Int
  alias Lpwstr = Wchar*
    # Call specified function for every element in a DOM that meets specified
  # CSS selectors.
  # See list of supported selectors: http://www.terrainformatica.com/sciter/css/selectors.htm
  # \param[in] he \b #HELEMENT
  # \param[in] selector \b LPCSTR, comma separated list of CSS selectors, e.g.: div, #id, div[align="right"].
  # \param[in] callback \b #SciterElementCallback*, address of callback
  # function being called on each element found.
  # \param[in] param \b LPVOID, additional parameter to be passed to callback
  # function.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_select_elements = SciterSelectElements(he : Helement, css_selectors : Lpcstr, callback : (Helement, Lpvoid -> Sbool), param : Lpvoid) : Int
  fun sciter_select_elements_w = SciterSelectElementsW(he : Helement, css_selectors : Lpcwstr, callback : (Helement, Lpvoid -> Sbool), param : Lpvoid) : Int
    # Find parent of the element by CSS selector.
  # ATTN: function will test first element itself.
  # See list of supported selectors: http://www.terrainformatica.com/sciter/css/selectors.htm
  # \param[in] he \b #HELEMENT
  # \param[in] selector \b LPCSTR, comma separated list of CSS selectors, e.g.: div, #id, div[align="right"].
  # \param[out] heFound \b #HELEMENT*, address of result HELEMENT
  # \param[in] depth \b LPVOID, depth of search, if depth == 1 then it will test only element itself.
  # Use depth = 1 if you just want to test he element for matching given CSS selector(s).
  # depth = 0 will scan the whole child parent chain up to the root.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_select_parent = SciterSelectParent(he : Helement, selector : Lpcstr, depth : Uint, he_found : Helement*) : Int
  fun sciter_select_parent_w = SciterSelectParentW(he : Helement, selector : Lpcwstr, depth : Uint, he_found : Helement*) : Int
    # Set inner or outer html of the element.
  # \param[in] he \b #HELEMENT
  # \param[in] html \b LPCBYTE, UTF-8 encoded string containing html text
  # \param[in] htmlLength \b UINT, length in bytes of \c html.
  # \param[in] where \b UINT, possible values are:
  # - SIH_REPLACE_CONTENT - replace content of the element
  # - SIH_INSERT_AT_START - insert html before first child of the element
  # - SIH_APPEND_AFTER_LAST - insert html after last child of the element
  # 
  # - SOH_REPLACE - replace element by html, a.k.a. element.outerHtml = "something"
  # - SOH_INSERT_BEFORE - insert html before the element
  # - SOH_INSERT_AFTER - insert html after the element
  # ATTN: SOH_*** operations do not work for inline elements like <SPAN>
  # 
  # \return /b #SCDOM_RESULT SCAPI
fun sciter_set_element_html = SciterSetElementHtml(he : Helement, html : Byte*, html_length : Uint, where : Uint) : Int
    # Get Element UID.
  # \param[in] he \b #HELEMENT
  # \param[out] puid \b UINT*, variable to receive UID of the element.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function retrieves element UID by its handle.
fun sciter_get_element_uid = SciterGetElementUID(he : Helement, puid : Uint*) : Int
    # Get Element handle by its UID.
  # \param[in] hwnd \b HWINDOW, HWINDOW of Sciter window
  # \param[in] uid \b UINT
  # \param[out] phe \b #HELEMENT*, variable to receive HELEMENT handle
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function retrieves element UID by its handle.
fun sciter_get_element_by_uid = SciterGetElementByUID(hwnd : GtkWidget*, uid : Uint, phe : Helement*) : Int
    # Shows block element (DIV) in popup window.
  # \param[in] hePopup \b HELEMENT, element to show as popup
  # \param[in] heAnchor \b HELEMENT, anchor element - hePopup will be shown near this element
  # \param[in] placement \b UINT, values:
  # 2 - popup element below of anchor
  # 8 - popup element above of anchor
  # 4 - popup element on left side of anchor
  # 6 - popup element on right side of anchor
  # ( see numpad on keyboard to get an idea of the numbers)
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_show_popup = SciterShowPopup(he_popup : Helement, he_anchor : Helement, placement : Uint) : Int
    # Shows block element (DIV) in popup window at given position.
  # \param[in] hePopup \b HELEMENT, element to show as popup
  # \param[in] pos \b POINT, popup element position, relative to origin of Sciter window.
  # \param[in] placement \b UINT, meaning of pos - number in 1..9 range. When 7 - pos is top/left corner of the popup
fun sciter_show_popup_at = SciterShowPopupAt(he_popup : Helement, pos : Point, placement : Uint) : Int
    # Removes popup window.
  # \param[in] he \b HELEMENT, element which belongs to popup window or popup element itself
fun sciter_hide_popup = SciterHidePopup(he : Helement) : Int
    # Get/set state bits, stateBits*** accept or'ed values above
fun sciter_get_element_state = SciterGetElementState(he : Helement, pstate_bits : Uint*) : Int
  fun sciter_set_element_state = SciterSetElementState(he : Helement, state_bits_to_set : Uint, state_bits_to_clear : Uint, update_view : Sbool) : Int
    # Create new element, the element is disconnected initially from the DOM.
  #     Element created with ref_count = 1 thus you \b must call Sciter_UnuseElement on returned handler.
  # \param[in] tagname \b LPCSTR, html tag of the element e.g. "div", "option", etc.
  # \param[in] textOrNull \b LPCWSTR, initial text of the element or NULL. text here is a plain text - method does no parsing.
  # \param[out ] phe \b #HELEMENT*, variable to receive handle of the element
fun sciter_create_element = SciterCreateElement(tagname : Lpcstr, text_or_null : Lpcwstr, phe : Helement*) : Int
    # Create new element as copy of existing element, new element is a full (deep) copy of the element and
  #     is disconnected initially from the DOM.
  #     Element created with ref_count = 1 thus you \b must call Sciter_UnuseElement on returned handler.
  # \param[in] he \b #HELEMENT, source element.
  # \param[out ] phe \b #HELEMENT*, variable to receive handle of the new element.
fun sciter_clone_element = SciterCloneElement(he : Helement, phe : Helement*) : Int
    # Insert element at \i index position of parent.
  #     It is not an error to insert element which already has parent - it will be disconnected first, but
  #     you need to update elements parent in this case.
  # \param index \b UINT, position of the element in parent collection.
  #    It is not an error to provide index greater than elements count in parent -
  #    it will be appended.
fun sciter_insert_element = SciterInsertElement(he : Helement, hparent : Helement, index : Uint) : Int
    # Take element out of its container (and DOM tree).
  #     Element will be destroyed when its reference counter will become zero
fun sciter_detach_element = SciterDetachElement(he : Helement) : Int
    # Take element out of its container (and DOM tree) and force destruction of all behaviors.
  #     Element will be destroyed when its reference counter will become zero
fun sciter_delete_element = SciterDeleteElement(he : Helement) : Int
    # Start Timer for the element.
  #     Element will receive on_timer event
  #     To stop timer call SciterSetTimer( he, 0 );
fun sciter_set_timer = SciterSetTimer(he : Helement, milliseconds : Uint, timer_id : UintPtr) : Int
    # Attach/Detach ElementEventProc to the element
  #     See sciter::event_handler.
fun sciter_detach_event_handler = SciterDetachEventHandler(he : Helement, pep : LpelementEventProc, tag : Lpvoid) : Int
  alias LpelementEventProc = (Lpvoid, Helement, Uint, Lpvoid -> Sbool)
    # Attach ElementEventProc to the element and subscribe it to events providede by subscription parameter
  #     See Sciter::attach_event_handler.
fun sciter_attach_event_handler = SciterAttachEventHandler(he : Helement, pep : LpelementEventProc, tag : Lpvoid) : Int
    # Attach/Detach ElementEventProc to the Sciter window.
  #     All events will start first here (in SINKING phase) and if not consumed will end up here.
  #     You can install Window EventHandler only once - it will survive all document reloads.
fun sciter_window_attach_event_handler = SciterWindowAttachEventHandler(hwnd_layout : GtkWidget*, pep : LpelementEventProc, tag : Lpvoid, subscription : Uint) : Int
  fun sciter_window_detach_event_handler = SciterWindowDetachEventHandler(hwnd_layout : GtkWidget*, pep : LpelementEventProc, tag : Lpvoid) : Int
    # SciterSendEvent - sends sinking/bubbling event to the child/parent chain of he element.
  #     First event will be send in SINKING mode (with SINKING flag) - from root to he element itself.
  #     Then from he element to its root on parents chain without SINKING flag (bubbling phase).
  # \param[in] he \b HELEMENT, element to send this event to.
  # \param[in] appEventCode \b UINT, event ID, see: #BEHAVIOR_EVENTS
  # \param[in] heSource \b HELEMENT, optional handle of the source element, e.g. some list item
  # \param[in] reason \b UINT, notification specific event reason code
  # \param[out] handled \b SBOOL*, variable to receive TRUE if any handler handled it, FALSE otherwise.
fun sciter_send_event = SciterSendEvent(he : Helement, app_event_code : Uint, he_source : Helement, reason : UintPtr, handled : Sbool*) : Int
    # SciterPostEvent - post sinking/bubbling event to the child/parent chain of he element.
  # Function will return immediately posting event into input queue of the application.
  # 
  # \param[in] he \b HELEMENT, element to send this event to.
  # \param[in] appEventCode \b UINT, event ID, see: #BEHAVIOR_EVENTS
  # \param[in] heSource \b HELEMENT, optional handle of the source element, e.g. some list item
  # \param[in] reason \b UINT, notification specific event reason code
fun sciter_post_event = SciterPostEvent(he : Helement, app_event_code : Uint, he_source : Helement, reason : UintPtr) : Int
    # SciterFireEvent - sends or posts sinking/bubbling event to the child/parent chain of specified element.
  #     First event will be send in SINKING mode (with SINKING flag) - from root to element itself.
  #     Then from element to its root on parents chain without SINKING flag (bubbling phase).
  # \param[in] evt \b BEHAVIOR_EVENT_PARAMS, pointer to event param block
  # \param[in] post \b SBOOL, \c TRUE to post event asynchronously, \c FALSE otherwise
  # \param[out] handled \b SBOOL*, variable to receive TRUE if any handler handled it, FALSE otherwise.
fun sciter_fire_event = SciterFireEvent(evt : BehaviorEventParams*, post : Sbool, handled : Sbool*) : Int
    # SciterCallMethod - calls behavior specific method.
  # \param[in] he \b HELEMENT, element - source of the event.
  # \param[in] params \b METHOD_PARAMS, pointer to method param block
fun sciter_call_behavior_method = SciterCallBehaviorMethod(he : Helement, params : MethodParams*) : Int
    # SciterRequestElementData  - request data download for the element.
  # \param[in] he \b HELEMENT, element to deleiver data to.
  # \param[in] url \b LPCWSTR, url to download data from.
  # \param[in] dataType \b UINT, data type, see SciterResourceType.
  # \param[in] hInitiator \b HELEMENT, element - initiator, can be NULL.
  # 
  #   event handler on the he element (if any) will be notified
  #   when data will be ready by receiving HANDLE_DATA_DELIVERY event.
fun sciter_request_element_data = SciterRequestElementData(he : Helement, url : Lpcwstr, data_type : Uint, initiator : Helement) : Int
  fun sciter_http_request = SciterHttpRequest(he : Helement, url : Lpcwstr, data_type : Uint, request_type : Uint, request_params : RequestParam*, n_params : Uint) : Int
  struct RequestParam
    name : Lpcwstr
    value : Lpcwstr
  end
    # SciterGetScrollInfo  - get scroll info of element with overflow:scroll or auto.
  # \param[in] he \b HELEMENT, element.
  # \param[out] scrollPos \b LPPOINT, scroll position.
  # \param[out] viewRect \b LPRECT, position of element scrollable area, content box minus scrollbars.
  # \param[out] contentSize \b LPSIZE, size of scrollable element content.
fun sciter_get_scroll_info = SciterGetScrollInfo(he : Helement, scroll_pos : Lppoint, view_rect : Lprect, content_size : Lpsize) : Int
  alias Lppoint = TagPoint*
  struct TagSize
    cx : Int
    cy : Int
  end
  alias Lpsize = TagSize*
    # SciterSetScrollPos  - set scroll position of element with overflow:scroll or auto.
  # \param[in] he \b HELEMENT, element.
  # \param[in] scrollPos \b POINT, new scroll position.
  # \param[in] smooth \b SBOOL, TRUE - do smooth scroll.
fun sciter_set_scroll_pos = SciterSetScrollPos(he : Helement, scroll_pos : Point, smooth : Sbool) : Int
    # SciterGetElementIntrinsicWidths  - get min-intrinsic and max-intrinsic widths of the element.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pMinWidth \b INT*, calculated min-intrinsic width.
  # \param[out] pMaxWidth \b INT*, calculated max-intrinsic width.
fun sciter_get_element_intrinsic_widths = SciterGetElementIntrinsicWidths(he : Helement, p_min_width : Int*, p_max_width : Int*) : Int
    # SciterGetElementIntrinsicHeight  - get min-intrinsic height of the element calculated for forWidth.
  # \param[in] he \b HELEMENT, element.
  # \param[in] forWidth \b INT*, width to calculate intrinsic height for.
  # \param[out] pHeight \b INT*, calculated min-intrinsic height.
fun sciter_get_element_intrinsic_height = SciterGetElementIntrinsicHeight(he : Helement, for_width : Int, p_height : Int*) : Int
    # SciterIsElementVisible - deep visibility, determines if element visible - has no visiblity:hidden and no display:none defined
  #     for itself or for any its parents.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pVisible \b LPBOOL, visibility state.
fun sciter_is_element_visible = SciterIsElementVisible(he : Helement, p_visible : Sbool*) : Int
    # SciterIsElementEnabled - deep enable state, determines if element enabled - is not disabled by itself or no one
  #     of its parents is disabled.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pEnabled \b LPBOOL, enabled state.
fun sciter_is_element_enabled = SciterIsElementEnabled(he : Helement, p_enabled : Sbool*) : Int
    # SciterSortElements - sort children of the element.
  # \param[in] he \b HELEMENT, element which children to be sorted.
  # \param[in] firstIndex \b UINT, first child index to start sorting from.
  # \param[in] lastIndex \b UINT, last index of the sorting range, element with this index will not be included in the sorting.
  # \param[in] cmpFunc \b ELEMENT_COMPARATOR, comparator function.
  # \param[in] cmpFuncParam \b LPVOID, parameter to be passed in comparator function.
fun sciter_sort_elements = SciterSortElements(he : Helement, first_index : Uint, last_index : Uint, cmp_func : (Helement, Helement, Lpvoid -> Int), cmp_func_param : Lpvoid) : Int
    # SciterSwapElements - swap element positions.
  # Function changes "insertion points" of two elements. So it swops indexes and parents of two elements.
  # \param[in] he1 \b HELEMENT, first element.
  # \param[in] he2 \b HELEMENT, second element.
fun sciter_swap_elements = SciterSwapElements(he1 : Helement, he2 : Helement) : Int
    # SciterTraverseUIEvent - traverse (sink-and-bubble) MOUSE or KEY event.
  # \param[in] evt \b EVENT_GROUPS, either HANDLE_MOUSE or HANDLE_KEY code.
  # \param[in] eventCtlStruct \b LPVOID, pointer on either MOUSE_PARAMS or KEY_PARAMS structure.
  # \param[out] bOutProcessed \b LPBOOL, pointer to SBOOL receiving TRUE if event was processed by some element and FALSE otherwise.
fun sciter_traverse_ui_event = SciterTraverseUIEvent(evt : Uint, event_ctl_struct : Lpvoid, b_out_processed : Sbool*) : Int
    # CallScriptingMethod - calls scripting method defined for the element.
  # \param[in] he \b HELEMENT, element which method will be callled.
  # \param[in] name \b LPCSTR, name of the method to call.
  # \param[in] argv \b SCITER_VALUE[], vector of arguments.
  # \param[in] argc \b UINT, number of arguments.
  # \param[out] retval \b SCITER_VALUE*, pointer to SCITER_VALUE receiving returning value of the function.
fun sciter_call_scripting_method = SciterCallScriptingMethod(he : Helement, name : Lpcstr, argv : Value*, argc : Uint, retval : Value*) : Int
    # CallScriptingFunction - calls scripting function defined in the namespace of the element (a.k.a. global function).
  # \param[in] he \b HELEMENT, element which namespace will be used.
  # \param[in] name \b LPCSTR, name of the method to call.
  # \param[in] argv \b SCITER_VALUE[], vector of arguments.
  # \param[in] argc \b UINT, number of arguments.
  # \param[out] retval \b SCITER_VALUE*, pointer to SCITER_VALUE receiving returning value of the function.
  # 
  # SciterCallScriptingFunction allows to call functions defined on global level of main document or frame loaded in it.
fun sciter_call_scripting_function = SciterCallScriptingFunction(he : Helement, name : Lpcstr, argv : Value*, argc : Uint, retval : Value*) : Int
  fun sciter_eval_element_script = SciterEvalElementScript(he : Helement, script : Lpcwstr, script_length : Uint, retval : Value*) : Int
    # Attach HWINDOW to the element.
  # \param[in] he \b #HELEMENT
  # \param[in] hwnd \b HWINDOW, window handle to attach
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_attach_hwnd_to_element = SciterAttachHwndToElement(he : Helement, hwnd : GtkWidget*) : Int
    # SciterControlGetType - get type of control - type of behavior assigned to the element.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pType \b UINT*, pointer to variable receiving control type,
  # for list of values see CTL_TYPE.
fun sciter_control_get_type = SciterControlGetType(he : Helement, p_type : Uint*) : Int
    # SciterGetValue - get value of the element. 'value' is value of correspondent behavior attached to the element or its text.
  # \param[in] he \b HELEMENT, element which value will be retrieved.
  # \param[out] pval \b VALUE*, pointer to VALUE that will get elements value.
  # ATTN: if you are not using json::value wrapper then you shall call ValueClear aginst the returned value
  # otherwise memory will leak.
fun sciter_get_value = SciterGetValue(he : Helement, pval : Value*) : Int
    # SciterSetValue - set value of the element.
  # \param[in] he \b HELEMENT, element which value will be changed.
  # \param[in] pval \b VALUE*, pointer to the VALUE to set.
fun sciter_set_value = SciterSetValue(he : Helement, pval : Value*) : Int
    # SciterGetExpando - get 'expando' of the element. 'expando' is a scripting object (of class Element)
  # that is assigned to the DOM element. 'expando' could be null as they are created on demand by script.
  # \param[in] he \b HELEMENT, element which expando will be retrieved.
  # \param[out] pval \b VALUE*, pointer to VALUE that will get value of type T_OBJECT/UT_OBJECT_NATIVE or null.
  # \param[in] forceCreation \b SBOOL, if there is no expando then when forceCreation==TRUE the function will create it.
  # ATTN: if you are not using json::value wrapper then you shall call ValueClear aginst the returned value
  # otherwise it will leak memory.
fun sciter_get_expando = SciterGetExpando(he : Helement, pval : Value*, force_creation : Sbool) : Int
    # SciterGetObject - get 'expando' object of the element. 'expando' is a scripting object (of class Element)
  # that is assigned to the DOM element. 'expando' could be null as they are created on demand by script.
  # \param[in] he \b HELEMENT, element which expando will be retrieved.
  # \param[out] pval \b tiscript::value*, pointer to tiscript::value that will get reference to the scripting object associated wuth the element or null.
  # \param[in] forceCreation \b SBOOL, if there is no expando then when forceCreation==TRUE the function will create it.
  # 
  # ATTN!: if you plan to store the reference or use it inside code that calls script VM functions
  # then you should use tiscript::pinned holder for the value.
fun sciter_get_object = SciterGetObject(he : Helement, pval : Void*, force_creation : Sbool) : Int
    # SciterGetElementNamespace - get namespace of document of the DOM element.
  # \param[in] he \b HELEMENT, element which expando will be retrieved.
  # \param[out] pval \b tiscript::value*, pointer to tiscript::value that will get reference to the namespace scripting object.
  # 
  # ATTN!: if you plan to store the reference or use it inside code that calls script VM functions
  # then you should use tiscript::pinned holder for the value.
fun sciter_get_element_namespace = SciterGetElementNamespace(he : Helement, pval : Void*) : Int
  fun sciter_get_highlighted_element = SciterGetHighlightedElement(hwnd : GtkWidget*, phe : Helement*) : Int
  fun sciter_set_highlighted_element = SciterSetHighlightedElement(hwnd : GtkWidget*, he : Helement) : Int
  fun sciter_node_add_ref = SciterNodeAddRef(hn : Hnode) : Int
  alias Hnode = Void*
  fun sciter_node_release = SciterNodeRelease(hn : Hnode) : Int
  fun sciter_node_cast_from_element = SciterNodeCastFromElement(he : Helement, phn : Hnode*) : Int
  fun sciter_node_cast_to_element = SciterNodeCastToElement(hn : Hnode, he : Helement*) : Int
  fun sciter_node_first_child = SciterNodeFirstChild(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_last_child = SciterNodeLastChild(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_next_sibling = SciterNodeNextSibling(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_prev_sibling = SciterNodePrevSibling(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_parent = SciterNodeParent(hnode : Hnode, phe_parent : Helement*) : Int
  fun sciter_node_nth_child = SciterNodeNthChild(hnode : Hnode, n : Uint, phn : Hnode*) : Int
  fun sciter_node_children_count = SciterNodeChildrenCount(hnode : Hnode, pn : Uint*) : Int
  fun sciter_node_type = SciterNodeType(hnode : Hnode, p_node_type : Uint*) : Int
  fun sciter_node_get_text = SciterNodeGetText(hnode : Hnode, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_node_set_text = SciterNodeSetText(hnode : Hnode, text : Lpcwstr, text_length : Uint) : Int
  fun sciter_node_insert = SciterNodeInsert(hnode : Hnode, where : Uint, what : Hnode) : Int
  fun sciter_node_remove = SciterNodeRemove(hnode : Hnode, finalize : Sbool) : Int
  fun sciter_create_text_node = SciterCreateTextNode(text : Lpcwstr, text_length : Uint, phnode : Hnode*) : Int
  fun sciter_create_comment_node = SciterCreateCommentNode(text : Lpcwstr, text_length : Uint, phnode : Hnode*) : Int
  struct SciterGraphicsApi
    image_create : (Himg*, Uint, Uint, Sbool -> GraphinResult)
    image_create_from_pixmap : (Himg*, Uint, Uint, Sbool, Byte* -> GraphinResult)
    image_add_ref : (Himg -> GraphinResult)
    image_release : (Himg -> GraphinResult)
    image_get_info : (Himg*, Uint, Uint, Sbool -> GraphinResult)
    image_clear : (Himg, ScColor -> GraphinResult)
    image_load : (Byte*, Uint, Himg* -> GraphinResult)
    image_save : (Himg, (Lpvoid, Byte*, Uint -> Sbool), Void*, Uint, Uint -> GraphinResult)
    rgba : (Uint, Uint, Uint, Uint -> ScColor)
    g_create : (Himg, Hgfx* -> GraphinResult)
    g_add_ref : (Hgfx -> GraphinResult)
    g_release : (Hgfx -> GraphinResult)
    g_line : (Hgfx, ScPos, ScPos, ScPos, ScPos -> GraphinResult)
    g_rectangle : (Hgfx, ScPos, ScPos, ScPos, ScPos -> GraphinResult)
    g_rounded_rectangle : (Hgfx, ScPos, ScPos, ScPos, ScPos, ScDim* -> GraphinResult)
    g_ellipse : (Hgfx, ScPos, ScPos, ScDim, ScDim -> GraphinResult)
    g_arc : (Hgfx, ScPos, ScPos, ScPos, ScPos, ScAngle, ScAngle -> GraphinResult)
    g_star : (Hgfx, ScPos, ScPos, ScDim, ScDim, ScAngle, Uint -> GraphinResult)
    g_polygon : (Hgfx, ScPos*, Uint -> GraphinResult)
    g_polyline : (Hgfx, ScPos*, Uint -> GraphinResult)
    path_create : (Hpath* -> GraphinResult)
    path_add_ref : (Hpath* -> GraphinResult)
    path_release : (Hpath* -> GraphinResult)
    path_move_to : (Hpath, ScPos, ScPos, Sbool -> GraphinResult)
    path_line_to : (Hpath, ScPos, ScPos, Sbool -> GraphinResult)
    path_arc_to : (Hpath, ScPos, ScPos, ScAngle, ScDim, ScDim, Sbool, Sbool, Sbool -> GraphinResult)
    path_quadratic_curve_to : (Hpath, ScPos, ScPos, ScPos, ScPos, Sbool -> GraphinResult)
    path_bezier_curve_to : (Hpath, ScPos, ScPos, ScPos, ScPos, ScPos, ScPos, Sbool -> GraphinResult)
    path_close_path : (Hpath* -> GraphinResult)
    g_draw_path : (Hgfx, Hpath, DrawPathMode -> GraphinResult)
    g_rotate : (Hgfx, ScAngle, ScPos*, ScPos* -> GraphinResult)
    g_translate : (Hgfx, ScPos, ScPos -> GraphinResult)
    g_scale : (Hgfx, ScDim, ScDim -> GraphinResult)
    g_skew : (Hgfx, ScDim, ScDim -> GraphinResult)
    g_transform : (Hgfx, ScPos, ScPos, ScPos, ScPos, ScPos, ScPos -> GraphinResult)
    g_state_save : (Hgfx -> GraphinResult)
    g_state_restore : (Hgfx -> GraphinResult)
    g_line_width : (Hgfx, ScDim -> GraphinResult)
    g_line_join : (Hgfx, SciterLineJoinType -> GraphinResult)
    g_line_cap : (Hgfx, SciterLineCapType -> GraphinResult)
    g_line_color : (Hgfx, ScColor -> GraphinResult)
    g_fill_color : (Hgfx, ScColor -> GraphinResult)
    g_line_gradient_linear : (Hgfx, ScPos, ScPos, ScPos, ScPos, ScColorStop*, Uint -> GraphinResult)
    g_fill_gradient_linear : (Hgfx, ScPos, ScPos, ScPos, ScPos, ScColorStop*, Uint -> GraphinResult)
    g_line_gradient_radial : (Hgfx, ScPos, ScPos, ScDim, ScDim, ScColorStop*, Uint -> GraphinResult)
    g_fill_gradient_radial : (Hgfx, ScPos, ScPos, ScDim, ScDim, ScColorStop*, Uint -> GraphinResult)
    g_fill_mode : (Hgfx, Sbool -> GraphinResult)
    text_create_for_element : (Htext*, Lpcwstr, Uint, Helement, Lpcwstr -> GraphinResult)
    text_create_for_element_and_style : (Htext*, Lpcwstr, Uint, Helement, Lpcwstr, Uint -> GraphinResult)
    text_add_ref : (Htext -> GraphinResult)
    text_release : (Htext -> GraphinResult)
    text_get_metrics : (Htext, ScDim*, ScDim*, ScDim*, ScDim*, ScDim*, Uint* -> GraphinResult)
    text_set_box : (Htext, ScDim, ScDim -> GraphinResult)
    g_draw_text : (Hgfx, Htext, ScPos, ScPos, Uint -> GraphinResult)
    g_draw_image : (Hgfx, Himg, ScPos, ScPos, ScDim*, ScDim*, Uint*, Uint*, Uint*, Uint*, LibC::Float* -> GraphinResult)
    g_world_to_screen : (Hgfx, ScPos, ScPos -> GraphinResult)
    g_screen_to_world : (Hgfx, ScPos, ScPos -> GraphinResult)
    g_push_clip_box : (Hgfx, ScPos, ScPos, ScPos, ScPos, LibC::Float -> GraphinResult)
    g_push_clip_path : (Hgfx, Hpath, LibC::Float -> GraphinResult)
    g_pop_clip : (Hgfx -> GraphinResult)
    image_paint : (Himg, (Lpvoid, Hgfx, Uint, Uint -> Void), Void* -> GraphinResult)
    v_wrap_gfx : (Hgfx, Value* -> GraphinResult)
    v_wrap_image : (Himg, Value* -> GraphinResult)
    v_wrap_path : (Hpath, Value* -> GraphinResult)
    v_wrap_text : (Htext, Value* -> GraphinResult)
    v_un_wrap_gfx : (Value*, Hgfx* -> GraphinResult)
    v_un_wrap_image : (Value*, Himg* -> GraphinResult)
    v_un_wrap_path : (Value*, Hpath* -> GraphinResult)
    v_un_wrap_text : (Value*, Htext* -> GraphinResult)
    g_flush : (Hgfx -> GraphinResult)
  end
  alias Himg = Void*
  enum GraphinResult
    GraphinPanic = -1
    GraphinOk = 0
    GraphinBadParam = 1
    GraphinFailure = 2
    GraphinNotsupported = 3
  end
  alias ScColor = LibC::UInt
  alias Hgfx = Void*
  alias ScReal = LibC::Float
  alias ScPos = ScReal
  alias ScDim = ScReal
  alias ScAngle = ScReal
  alias Hpath = Void*
  enum DrawPathMode
    DrawFillOnly = 1
    DrawStrokeOnly = 2
    DrawFillAndStroke = 3
  end
  enum SciterLineJoinType
    SciterJoinMiter = 0
    SciterJoinRound = 1
    SciterJoinBevel = 2
    SciterJoinMiterOrBevel = 3
  end
  enum SciterLineCapType
    SciterLineCapButt = 0
    SciterLineCapSquare = 1
    SciterLineCapRound = 2
  end
  struct ScColorStop
    color : ScColor
    offset : LibC::Float
  end
  alias Htext = Void*
  fun sciter_atom_value = SciterAtomValue(name : LibC::Char*) : SomAtomT
  alias SomAtomT = Uint64
  fun sciter_atom_value = SciterAtomValue(name : LibC::Char*) : SomAtomT
  fun sciter_atom_name_cb = SciterAtomNameCB(atomv : Uint64, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Uint64
  struct SomParams
    cmd : Uint
    data : SomParamsData
  end
  union SomParamsData
    passport : SomPassportT*
    asset : SomAssetT*
  end
  struct SomPassportT
    flags : Uint64
    name : SomAtomT
    properties : SomPropertyDefT*
    n_properties : LibC::SizeT
    methods : SomMethodDefT*
    n_methods : LibC::SizeT
    item_getter : SomItemGetterT
    item_setter : SomItemSetterT
    item_next : SomItemNextT
    prop_getter : SomAnyPropGetterT
    prop_setter : SomAnyPropSetterT
  end
  struct SomPropertyDefT
    reserved : Void*
    name : SomAtomT
    getter : SomPropGetterT
    setter : SomPropSetterT
  end
  struct SomAssetT
    isa : SomAssetClassT*
  end
  alias SomPropGetterT = (SomAssetT*, SciterValue* -> Sbool)
  struct SomAssetClassT
    asset_add_ref : (SomAssetT* -> LibC::Long)
    asset_release : (SomAssetT* -> LibC::Long)
    asset_get_interface : (SomAssetT*, LibC::Char*, Void** -> LibC::Long)
    asset_get_passport : (SomAssetT* -> SomPassportT*)
  end
  alias SomPropSetterT = (SomAssetT*, SciterValue* -> Sbool)
  struct SomMethodDefT
    reserved : Void*
    name : SomAtomT
    params : LibC::SizeT
    func : SomMethodT
  end
  alias SomMethodT = (SomAssetT*, Uint, SciterValue*, SciterValue* -> Sbool)
  alias SomItemGetterT = (SomAssetT*, SciterValue*, SciterValue* -> Sbool)
  alias SomItemSetterT = (SomAssetT*, SciterValue*, SciterValue* -> Sbool)
  alias SomItemNextT = (SomAssetT*, SciterValue*, SciterValue* -> Sbool)
  alias SomAnyPropGetterT = (SomAssetT*, Uint64, SciterValue* -> Sbool)
  alias SomAnyPropSetterT = (SomAssetT*, Uint64, SciterValue* -> Sbool)
  struct MouseParams
    cmd : Uint
    target : Helement
    pos : Point
    pos_view : Point
    button_state : Uint
    alt_state : Uint
    cursor_type : Uint
    is_on_icon : Sbool
    dragging : Helement
    dragging_mode : Uint
  end
  struct KeyParams
    cmd : Uint
    target : Helement
    key_code : Uint
    alt_state : Uint
  end
  struct FocusParams
        # < #FOCUS_EVENTS
cmd : Uint
        # < target element, for #FOCUS_LOST it is a handle of new focus element
    #                                      and for #FOCUS_GOT it is a handle of old focus element, can be NULL
target : Helement
        # < focus cause params or FOCUS_CMD_TYPE for FOCUS_ADVANCE_REQUEST
cause : Uint
        # < in #FOCUS_REQUEST and #FOCUS_LOST phase setting this field to true will cancel transfer focus from old element to the new one.
cancel : Sbool
  end
  struct ScrollParams
    cmd : Uint
    target : Helement
    pos : Int
    vertical : Sbool
    source : Uint
    reason : Uint
  end
  alias SciterGraphics = Void
  struct DrawParams
    cmd : Uint
    gfx : Hgfx
    area : Rect
    reserved : Uint
  end
  struct TimerParams
    timer_id : UintPtr
  end
  struct DataArrivedParams
    initiator : Helement
    data : Lpcbyte
    data_size : Uint
    data_type : Uint
    status : Uint
    uri : Lpcwstr
  end
    # Get name of Sciter window class.
  # 
  # \return \b LPCWSTR, name of Sciter window class.
  # \b NULL if initialization of the engine failed, Direct2D or DirectWrite are not supported on the OS.
  # 
  # Use this function if you wish to create unicode version of Sciter.
  # The returned name can be used in CreateWindow(Ex)W function.
  # You can use #SciterClassNameT macro.
fun sciter_class_name = SciterClassName : Lpcwstr
    # Returns major and minor version of Sciter engine.
  # \return UINT, hiword (16-bit) contains major number and loword contains minor number;
fun sciter_version = SciterVersion(major : Sbool) : Uint
  struct SciterCallbackNotification
        # < [in] one of the codes above.
code : Uint
        # < [in] HWINDOW of the window this callback was attached to.
hwnd : GtkWidget*
  end
    # This function is used in response to SCN_LOAD_DATA request.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
  # \param[in] uri \b LPCWSTR, URI of the data requested by Sciter.
  # \param[in] data \b LPBYTE, pointer to data buffer.
  # \param[in] dataLength \b UINT, length of the data in bytes.
  # \return \b SBOOL, TRUE if Sciter accepts the data or \c FALSE if error occured
  # (for example this function was called outside of #SCN_LOAD_DATA request).
  # 
  # \warning If used, call of this function MUST be done ONLY while handling
  # SCN_LOAD_DATA request and in the same thread. For asynchronous resource loading
  # use SciterDataReadyAsync
fun sciter_data_ready = SciterDataReady(hwnd : GtkWidget*, uri : Lpcwstr, data : Lpcbyte, data_length : Uint) : Sbool
    # Use this function outside of SCN_LOAD_DATA request. This function is needed when you
  # you have your own http client implemented in your application.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
  # \param[in] uri \b LPCWSTR, URI of the data requested by Sciter.
  # \param[in] data \b LPBYTE, pointer to data buffer.
  # \param[in] dataLength \b UINT, length of the data in bytes.
  # \param[in] requestId \b LPVOID, SCN_LOAD_DATA requestId, can be NULL.
  # \return \b SBOOL, TRUE if Sciter accepts the data or \c FALSE if error occured
fun sciter_data_ready_async = SciterDataReadyAsync(hwnd : GtkWidget*, uri : Lpcwstr, data : Lpcbyte, data_length : Uint, request_id : Lpvoid) : Sbool
    # Load HTML file.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] url \b LPCWSTR, either absolute URL of HTML file to load. "file://...", "http://...", "res:...", "this://app/..." or absolute file path.
  # \return \b SBOOL, \c TRUE if the text was parsed and loaded successfully, \c FALSE otherwise.
fun sciter_load_file = SciterLoadFile(h_wnd_sciter : GtkWidget*, url : Lpcwstr) : Sbool
    # Load HTML from in memory buffer with base.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] html \b LPCBYTE, Address of HTML to load.
  # \param[in] htmlSize \b UINT, Length of the array pointed by html parameter.
  # \param[in] baseUrl \b LPCWSTR, base URL. All relative links will be resolved against
  # this URL.
  # \return \b SBOOL, \c TRUE if the text was parsed and loaded successfully, FALSE otherwise.
fun sciter_load_html = SciterLoadHtml(h_wnd_sciter : GtkWidget*, html : Lpcbyte, html_size : Uint, base_url : Lpcwstr) : Sbool
    # Set \link #SCITER_NOTIFY() notification callback function \endlink.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] cb \b SCITER_NOTIFY*, \link #SCITER_NOTIFY() callback function \endlink.
  # \param[in] cbParam \b LPVOID, parameter that will be passed to \link #SCITER_NOTIFY() callback function \endlink as vParam paramter.
fun sciter_set_callback = SciterSetCallback(h_wnd_sciter : GtkWidget*, cb : LpSciterHostCallback, cb_param : Lpvoid)
  alias LpsciterCallbackNotification = SciterCallbackNotification*
  alias LpSciterHostCallback = (LpsciterCallbackNotification, Lpvoid -> Uint)
    # Set Master style sheet.
  # 
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_set_master_css = SciterSetMasterCSS(utf8 : Lpcbyte, num_bytes : Uint) : Sbool
    # Append Master style sheet.
  # 
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_append_master_css = SciterAppendMasterCSS(utf8 : Lpcbyte, num_bytes : Uint) : Sbool
    # Set (reset) style sheet of current document.
  #  Will reset styles for all elements according to given CSS (utf8)
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_set_css = SciterSetCSS(h_wnd_sciter : GtkWidget*, utf8 : Lpcbyte, num_bytes : Uint, base_url : Lpcwstr, media_type : Lpcwstr) : Sbool
    # Set media type of this sciter instance.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] mediaType \b LPCWSTR, media type name.
  # 
  # For example media type can be "handheld", "projection", "screen", "screen-hires", etc.
  # By default sciter window has "screen" media type.
  # 
  # Media type name is used while loading and parsing style sheets in the engine so
  # you should call this function *before* loading document in it.
fun sciter_set_media_type = SciterSetMediaType(h_wnd_sciter : GtkWidget*, media_type : Lpcwstr) : Sbool
    # Set media variables of this sciter instance.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] mediaVars \b SCITER_VALUE, map that contains name/value pairs - media variables to be set.
  # 
  # For example media type can be "handheld:true", "projection:true", "screen:true", etc.
  # By default sciter window has "screen:true" and "desktop:true"/"handheld:true" media variables.
  # 
  # Media variables can be changed in runtime. This will cause styles of the document to be reset.
fun sciter_set_media_vars = SciterSetMediaVars(h_wnd_sciter : GtkWidget*, media_vars : SciterValue*) : Sbool
  fun sciter_get_min_width = SciterGetMinWidth(h_wnd_sciter : GtkWidget*) : Uint
  fun sciter_get_min_height = SciterGetMinHeight(h_wnd_sciter : GtkWidget*, width : Uint) : Uint
  fun sciter_call = SciterCall(h_wnd : GtkWidget*, function_name : Lpcstr, argc : Uint, argv : SciterValue*, retval : SciterValue*) : Sbool
  fun sciter_eval = SciterEval(hwnd : GtkWidget*, script : Lpcwstr, script_length : Uint, pretval : SciterValue*) : Sbool
    # Update pending changes in Sciter window.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
fun sciter_update_window = SciterUpdateWindow(hwnd : GtkWidget*)
  fun sciter_set_option = SciterSetOption(h_wnd : GtkWidget*, option : Uint, value : UintPtr) : Sbool
    # Get current pixels-per-inch metrics of the Sciter window
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[out] px \b PUINT, get ppi in horizontal direction.
  # \param[out] py \b PUINT, get ppi in vertical direction.
fun sciter_get_ppi = SciterGetPPI(h_wnd_sciter : GtkWidget*, px : Uint*, py : Uint*)
    # Get "expando" of the view object
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[out] pval \b VALUE*, expando as sciter::value.
fun sciter_get_view_expando = SciterGetViewExpando(hwnd : GtkWidget*, pval : Value*) : Sbool
    # Get url resource data received by the engine
  # Note: this function really works only if the engine is set to debug mode.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] receiver \b URL_DATA_RECEIVER, address of reciver callback.
  # \param[in] param \b LPVOID, param passed to callback as it is.
  # \param[in] url \b LPCSTR, optional, url of the data. If not provided the engine will list all loaded resources
  # \return \b SBOOL, \c TRUE if receiver is called at least once, FALSE otherwise.
fun sciter_enum_url_data = SciterEnumUrlData(h_wnd_sciter : GtkWidget*, receiver : (UrlData*, Lpvoid -> Void), param : Lpvoid, url : Lpcstr) : Sbool
  struct UrlData
    requested_url : Lpcstr
    real_url : Lpcstr
    requested_type : SciterResourceType
    http_headers : Lpcstr
    mime_type : Lpcstr
    encoding : Lpcstr
    data : Lpcbyte
    data_length : Uint
  end
    # Get graphics capabilities of the system
  # 
  # \pcaps[in] LPUINT \b pcaps, address of variable receiving:
  # 0 - no compatible graphics found;
  # 1 - compatible graphics found but Direct2D will use WARP driver (software emulation);
  # 2 - Direct2D will use hardware backend (best performance);
  # \return \b SBOOL, \c TRUE if pcaps is valid pointer.
fun sciter_graphics_caps = SciterGraphicsCaps(pcaps : Lpuint) : Sbool
    # Set sciter home url.
  # home url is used for resolving sciter: urls
  # If you will set it like SciterSetHomeURL(hwnd,"http://sciter.com/modules/")
  # then <script src="sciter:lib/root-extender.tis"> will load
  # root-extender.tis from http://sciter.com/modules/lib/root-extender.tis
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] baseUrl \b LPCWSTR, URL of sciter home.
fun sciter_set_home_url = SciterSetHomeURL(h_wnd_sciter : GtkWidget*, base_url : Lpcwstr) : Sbool
    # Create sciter window.
  # On Windows returns HWND of either top-level or child window created.
  # On OS X returns NSView* of either top-level window or child view .
  # 
  # \param[in] creationFlags \b SCITER_CREATE_WINDOW_FLAGS, creation flags.
  # \param[in] frame \b LPRECT, window frame position and size.
  # \param[in] delegate \b SciterWindowDelegate, either partial WinProc implementation or thing implementing NSWindowDelegate protocol.
  # \param[in] delegateParam \b LPVOID, optional param passed to SciterWindowDelegate.
  # \param[in] parent \b HWINDOW, optional parent window.
fun sciter_create_window = SciterCreateWindow(creation_flags : Uint, frame : Lprect, delegate : SciterWindowDelegate*, delegate_param : Lpvoid, parent : GtkWidget*) : GtkWidget*
  alias SciterWindowDelegate = Lpvoid
  fun sciter_setup_debug_output = SciterSetupDebugOutput(hwnd_or_null : GtkWidget*, param : Lpvoid, pf_output : DebugOutputProc)
  alias DebugOutputProc = (Lpvoid, Uint, Uint, Lpcwstr, Uint -> Void)
  struct SciterXMsg
        # < [in]  one of the codes of #SCITER_X_MSG_CODE.
msg : Uint
  end
  struct SciterXMsgCreate
    header : SciterXMsg
    backend : Uint
    transparent : Sbool
  end
  struct SciterXMsgDestroy
    header : SciterXMsg
  end
  struct SciterXMsgSize
    header : SciterXMsg
    width : Uint
    height : Uint
  end
  struct SciterXMsgResolution
    header : SciterXMsg
    pixels_per_inch : Uint
  end
  struct SciterXMsgMouse
    header : SciterXMsg
    event : MouseEvents
    button : MouseButtons
    modifiers : KeyboardStates
    pos : Point
  end
  enum MouseEvents
    MouseEnter = 0
    MouseLeave = 1
    MouseMove = 2
    MouseUp = 3
    MouseDown = 4
    MouseDclick = 5
    MouseWheel = 6
    MouseTick = 7
    MouseIdle = 8
    Drop = 9
    DragEnter = 10
    DragLeave = 11
    DragRequest = 12
    MouseTclick = 15
    MouseTouchStart = 252
    MouseTouchEnd = 253
    MouseDragRequest = 254
    MouseClick = 255
    Dragging = 256
    MouseHitTest = 4094
  end
  enum MouseButtons
    MainMouseButton = 1
    PropMouseButton = 2
    MiddleMouseButton = 4
  end
  enum KeyboardStates
    ControlKeyPressed = 1
    ShiftKeyPressed = 2
    AltKeyPressed = 4
  end
  struct SciterXMsgKey
    header : SciterXMsg
    event : KeyEvents
    code : Uint
    modifiers : KeyboardStates
  end
  enum KeyEvents
    KeyDown = 0
    KeyUp = 1
    KeyChar = 2
  end
  struct SciterXMsgFocus
    header : SciterXMsg
    got : Sbool
  end
  struct SciterXMsgHeartbit
    header : SciterXMsg
    time : Uint
  end
  struct SciterXMsgPaint
    header : SciterXMsg
        # < [in] layer #HELEMENT, can be NULL if whole tree (document) needs to be rendered.
element : Helement
        # < [in] if element is not null tells if that element is fore-layer.
is_fore : Sbool
        # < [in] one of #SCITER_PAINT_TARGET_TYPE values
target_type : Uint
    target : SciterXMsgPaintTarget
  end
  union SciterXMsgPaintTarget
        # < [in] must be IDXGISurface*
p_surface : Lpvoid
    receiver : SciterXMsgPaintTargetReceiver
  end
  struct SciterXMsgPaintTargetReceiver
    param : Void*
    callback : (Lpcbyte, Int, Int, Uint, Uint, Lpvoid -> Void)
  end
    # Get name of Sciter window class.
  # 
  # \return \b LPCWSTR, name of Sciter window class.
  # \b NULL if initialization of the engine failed, Direct2D or DirectWrite are not supported on the OS.
  # 
  # Use this function if you wish to create unicode version of Sciter.
  # The returned name can be used in CreateWindow(Ex)W function.
  # You can use #SciterClassNameT macro.
fun sciter_class_name = SciterClassName : Lpcwstr
    # Returns major and minor version of Sciter engine.
  # \return UINT, hiword (16-bit) contains major number and loword contains minor number;
fun sciter_version = SciterVersion(major : Sbool) : Uint
    # This function is used in response to SCN_LOAD_DATA request.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
  # \param[in] uri \b LPCWSTR, URI of the data requested by Sciter.
  # \param[in] data \b LPBYTE, pointer to data buffer.
  # \param[in] dataLength \b UINT, length of the data in bytes.
  # \return \b SBOOL, TRUE if Sciter accepts the data or \c FALSE if error occured
  # (for example this function was called outside of #SCN_LOAD_DATA request).
  # 
  # \warning If used, call of this function MUST be done ONLY while handling
  # SCN_LOAD_DATA request and in the same thread. For asynchronous resource loading
  # use SciterDataReadyAsync
fun sciter_data_ready = SciterDataReady(hwnd : GtkWidget*, uri : Lpcwstr, data : Lpcbyte, data_length : Uint) : Sbool
    # Use this function outside of SCN_LOAD_DATA request. This function is needed when you
  # you have your own http client implemented in your application.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
  # \param[in] uri \b LPCWSTR, URI of the data requested by Sciter.
  # \param[in] data \b LPBYTE, pointer to data buffer.
  # \param[in] dataLength \b UINT, length of the data in bytes.
  # \param[in] requestId \b LPVOID, SCN_LOAD_DATA requestId, can be NULL.
  # \return \b SBOOL, TRUE if Sciter accepts the data or \c FALSE if error occured
fun sciter_data_ready_async = SciterDataReadyAsync(hwnd : GtkWidget*, uri : Lpcwstr, data : Lpcbyte, data_length : Uint, request_id : Lpvoid) : Sbool
    # Load HTML file.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] url \b LPCWSTR, either absolute URL of HTML file to load. "file://...", "http://...", "res:...", "this://app/..." or absolute file path.
  # \return \b SBOOL, \c TRUE if the text was parsed and loaded successfully, \c FALSE otherwise.
fun sciter_load_file = SciterLoadFile(h_wnd_sciter : GtkWidget*, filename : Lpcwstr) : Sbool
    # Load HTML from in memory buffer with base.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] html \b LPCBYTE, Address of HTML to load.
  # \param[in] htmlSize \b UINT, Length of the array pointed by html parameter.
  # \param[in] baseUrl \b LPCWSTR, base URL. All relative links will be resolved against
  # this URL.
  # \return \b SBOOL, \c TRUE if the text was parsed and loaded successfully, FALSE otherwise.
fun sciter_load_html = SciterLoadHtml(h_wnd_sciter : GtkWidget*, html : Lpcbyte, html_size : Uint, base_url : Lpcwstr) : Sbool
    # Set \link #SCITER_NOTIFY() notification callback function \endlink.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] cb \b SCITER_NOTIFY*, \link #SCITER_NOTIFY() callback function \endlink.
  # \param[in] cbParam \b LPVOID, parameter that will be passed to \link #SCITER_NOTIFY() callback function \endlink as vParam paramter.
fun sciter_set_callback = SciterSetCallback(h_wnd_sciter : GtkWidget*, cb : LpSciterHostCallback, cb_param : Lpvoid)
    # Set Master style sheet.
  # 
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_set_master_css = SciterSetMasterCSS(utf8 : Lpcbyte, num_bytes : Uint) : Sbool
    # Append Master style sheet.
  # 
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_append_master_css = SciterAppendMasterCSS(utf8 : Lpcbyte, num_bytes : Uint) : Sbool
    # Set (reset) style sheet of current document.
  #  Will reset styles for all elements according to given CSS (utf8)
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] utf8 \b LPCBYTE, start of CSS buffer.
  # \param[in] numBytes \b UINT, number of bytes in utf8.
fun sciter_set_css = SciterSetCSS(h_wnd_sciter : GtkWidget*, utf8 : Lpcbyte, num_bytes : Uint, base_url : Lpcwstr, media_type : Lpcwstr) : Sbool
    # Set media type of this sciter instance.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] mediaType \b LPCWSTR, media type name.
  # 
  # For example media type can be "handheld", "projection", "screen", "screen-hires", etc.
  # By default sciter window has "screen" media type.
  # 
  # Media type name is used while loading and parsing style sheets in the engine so
  # you should call this function *before* loading document in it.
fun sciter_set_media_type = SciterSetMediaType(h_wnd_sciter : GtkWidget*, media_type : Lpcwstr) : Sbool
    # Set media variables of this sciter instance.
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] mediaVars \b SCITER_VALUE, map that contains name/value pairs - media variables to be set.
  # 
  # For example media type can be "handheld:true", "projection:true", "screen:true", etc.
  # By default sciter window has "screen:true" and "desktop:true"/"handheld:true" media variables.
  # 
  # Media variables can be changed in runtime. This will cause styles of the document to be reset.
fun sciter_set_media_vars = SciterSetMediaVars(h_wnd_sciter : GtkWidget*, media_vars : SciterValue*) : Sbool
  fun sciter_get_min_width = SciterGetMinWidth(h_wnd_sciter : GtkWidget*) : Uint
  fun sciter_get_min_height = SciterGetMinHeight(h_wnd_sciter : GtkWidget*, width : Uint) : Uint
  fun sciter_call = SciterCall(h_wnd : GtkWidget*, function_name : Lpcstr, argc : Uint, argv : SciterValue*, retval : SciterValue*) : Sbool
  fun sciter_eval = SciterEval(hwnd : GtkWidget*, script : Lpcwstr, script_length : Uint, pretval : SciterValue*) : Sbool
    # Update pending changes in Sciter window.
  # 
  # \param[in] hwnd \b HWINDOW, Sciter window handle.
fun sciter_update_window = SciterUpdateWindow(hwnd : GtkWidget*)
  fun sciter_set_option = SciterSetOption(h_wnd : GtkWidget*, option : Uint, value : UintPtr) : Sbool
    # Get current pixels-per-inch metrics of the Sciter window
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[out] px \b PUINT, get ppi in horizontal direction.
  # \param[out] py \b PUINT, get ppi in vertical direction.
fun sciter_get_ppi = SciterGetPPI(h_wnd_sciter : GtkWidget*, px : Uint*, py : Uint*)
    # Get "expando" of the view object
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[out] pval \b VALUE*, expando as sciter::value.
fun sciter_get_view_expando = SciterGetViewExpando(hwnd : GtkWidget*, pval : Value*) : Sbool
    # Get graphics capabilities of the system
  # 
  # \pcaps[in] LPUINT \b pcaps, address of variable receiving:
  # 0 - no compatible graphics found;
  # 1 - compatible graphics found but Direct2D will use WARP driver (software emulation);
  # 2 - Direct2D will use hardware backend (best performance);
  # \return \b SBOOL, \c TRUE if pcaps is valid pointer.
fun sciter_graphics_caps = SciterGraphicsCaps(pcaps : Lpuint) : Sbool
    # Set sciter home url.
  # home url is used for resolving sciter: urls
  # If you will set it like SciterSetHomeURL(hwnd,"http://sciter.com/modules/")
  # then <script src="sciter:lib/root-extender.tis"> will load
  # root-extender.tis from http://sciter.com/modules/lib/root-extender.tis
  # 
  # \param[in] hWndSciter \b HWINDOW, Sciter window handle.
  # \param[in] baseUrl \b LPCWSTR, URL of sciter home.
fun sciter_set_home_url = SciterSetHomeURL(h_wnd_sciter : GtkWidget*, base_url : Lpcwstr) : Sbool
    # Create sciter window.
  # On Windows returns HWND of either top-level or child window created.
  # On OS X returns NSView* of either top-level window or child view .
  # 
  # \param[in] creationFlags \b SCITER_CREATE_WINDOW_FLAGS, creation flags.
  # \param[in] frame \b LPRECT, window frame position and size.
  # \param[in] delegate \b SciterWindowDelegate, either partial WinProc implementation or thing implementing NSWindowDelegate protocol.
  # \param[in] delegateParam \b LPVOID, optional param passed to SciterWindowDelegate.
  # \param[in] parent \b HWINDOW, optional parent window.
fun sciter_create_window = SciterCreateWindow(creation_flags : Uint, frame : Lprect, delegate : SciterWindowDelegate*, delegate_param : Lpvoid, parent : GtkWidget*) : GtkWidget*
  fun sciter_use_element = Sciter_UseElement(he : Helement) : Int
    # Marks DOM object as unused (a.k.a. Release).
  # Get handle of every element's child element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # Application should call this function when it does not need element's
  # handle anymore.
  # \sa #Sciter_UseElement()
fun sciter_unuse_element = Sciter_UnuseElement(he : Helement) : Int
    # Get root DOM element of HTML document.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to get root
  # element
  # \param[out ] phe \b #HELEMENT*, variable to receive root element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # Root DOM object is always a 'HTML' element of the document.
fun sciter_get_root_element = SciterGetRootElement(hwnd : GtkWidget*, phe : Helement*) : Int
    # Get focused DOM element of HTML document.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to get focus
  # element
  # \param[out ] phe \b #HELEMENT*, variable to receive focus element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # phe can have null value (0).
  # 
  # COMMENT: To set focus on element use SciterSetElementState(STATE_FOCUS,0)
fun sciter_get_focus_element = SciterGetFocusElement(hwnd : GtkWidget*, phe : Helement*) : Int
    # Find DOM element by coordinate.
  # \param[in] hwnd \b HWINDOW, Sciter window for which you need to find
  # elementz
  # \param[in] pt \b POINT, coordinates, window client area relative.
  # \param[out ] phe \b #HELEMENT*, variable to receive found element handle.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # If element was not found then *phe will be set to zero.
fun sciter_find_element = SciterFindElement(hwnd : GtkWidget*, pt : Point, phe : Helement*) : Int
    # Get number of child elements.
  # \param[in] he \b #HELEMENT, element which child elements you need to count
  # \param[out] count \b UINT*, variable to receive number of child elements
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # for paragraph defined as
  # \verbatim <p>Hello <b>wonderfull</b> world!</p> \endverbatim
  # count will be set to 1 as the paragraph has only one sub element:
  # \verbatim <b>wonderfull</b> \endverbatim
fun sciter_get_children_count = SciterGetChildrenCount(he : Helement, count : Uint*) : Int
    # Get handle of every element's child element.
  # \param[in] he \b #HELEMENT
  # \param[in] n \b UINT, number of the child element
  # \param[out] phe \b #HELEMENT*, variable to receive handle of the child
  # element
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # for paragraph defined as
  # \verbatim <p>Hello <b>wonderfull</b> world!</p> \endverbatim
  # *phe will be equal to handle of &lt;b&gt; element:
  # \verbatim <b>wonderfull</b> \endverbatim
fun sciter_get_nth_child = SciterGetNthChild(he : Helement, n : Uint, phe : Helement*) : Int
    # Get parent element.
  # \param[in] he \b #HELEMENT, element which parent you need
  # \param[out] p_parent_he \b #HELEMENT*, variable to recieve handle of the
  # parent element
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_parent_element = SciterGetParentElement(he : Helement, p_parent_he : Helement*) : Int
    # Get html representation of the element.
  # \param[in] he \b #HELEMENT
  # \param[in] outer \b SBOOL, if TRUE will return outer HTML otherwise inner.
  # \param[in] rcv \b pointer to function receiving UTF8 encoded HTML.
  # \param[in] rcv_param \b parameter that passed to rcv as it is.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_html_cb = SciterGetElementHtmlCB(he : Helement, outer : Sbool, rcv : (Lpcbyte, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get inner text of the element as LPCWSTR (utf16 words).
  # \param[in] he \b #HELEMENT
  # \param[in] rcv \b pointer to the function receiving UTF16 encoded plain text
  # \param[in] rcv_param \b param passed that passed to LPCWSTR_RECEIVER "as is"
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_text_cb = SciterGetElementTextCB(he : Helement, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Set inner text of the element from LPCWSTR buffer (utf16 words).
  # \param[in] he \b #HELEMENT
  # \param[in] utf16words \b pointer, UTF16 encoded plain text
  # \param[in] length \b UINT, number of words in utf16words sequence
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_set_element_text = SciterSetElementText(he : Helement, utf16 : Lpcwstr, length : Uint) : Int
    # Get number of element's attributes.
  # \param[in] he \b #HELEMENT
  # \param[out] p_count \b LPUINT, variable to receive number of element
  # attributes.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_attribute_count = SciterGetAttributeCount(he : Helement, p_count : Lpuint) : Int
    # Get value of any element's attribute by attribute's number.
  # \param[in] he \b #HELEMENT
  # \param[in] n \b UINT, number of desired attribute
  # \param[out] p_name \b LPCSTR*, will be set to address of the string
  # containing attribute name
  # \param[out] p_value \b LPCWSTR*, will be set to address of the string
  # containing attribute value
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_nth_attribute_name_cb = SciterGetNthAttributeNameCB(he : Helement, n : Uint, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_get_nth_attribute_value_cb = SciterGetNthAttributeValueCB(he : Helement, n : Uint, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_get_attribute_by_name_cb = SciterGetAttributeByNameCB(he : Helement, name : Lpcstr, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Set attribute's value.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, attribute name
  # \param[in] value \b LPCWSTR, new attribute value or 0 if you want to remove attribute.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_set_attribute_by_name = SciterSetAttributeByName(he : Helement, name : Lpcstr, value : Lpcwstr) : Int
    # Remove all attributes from the element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_clear_attributes = SciterClearAttributes(he : Helement) : Int
    # Get element index.
  # \param[in] he \b #HELEMENT
  # \param[out] p_index \b LPUINT, variable to receive number of the element
  # among parent element's subelements.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_index = SciterGetElementIndex(he : Helement, p_index : Lpuint) : Int
    # Get element's type.
  # \param[in] he \b #HELEMENT
  # \param[out] p_type \b LPCSTR*, receives name of the element type.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # \par Example:
  # For &lt;div&gt; tag p_type will be set to "div".
fun sciter_get_element_type = SciterGetElementType(he : Helement, p_type : Lpcstr*) : Int
    # Get element's type.
  # \param[in] he \b #HELEMENT
  # \param[out] rcv \b LPCSTR_RECEIVER, receives name of the element type.
  # \param[out] rcv_param \b LPVOID, parameter passed as it is to the receiver.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_type_cb = SciterGetElementTypeCB(he : Helement, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get element's style attribute.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, name of the style attribute
  # \param[in] rcv \b pointer to the function receiving UTF16 encoded plain text
  # \param[in] rcv_param \b param passed that passed to LPCWSTR_RECEIVER "as is"
  # 
  # Style attributes are those that are set using css. E.g. "font-face: arial" or "display: block".
  # 
  # \sa #SciterSetStyleAttribute()
fun sciter_get_style_attribute_cb = SciterGetStyleAttributeCB(he : Helement, name : Lpcstr, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
    # Get element's style attribute.
  # \param[in] he \b #HELEMENT
  # \param[in] name \b LPCSTR, name of the style attribute
  # \param[out] value \b LPCWSTR, value of the style attribute.
  # 
  # Style attributes are those that are set using css. E.g. "font-face: arial" or "display: block".
  # 
  # \sa #SciterGetStyleAttribute()
fun sciter_set_style_attribute = SciterSetStyleAttribute(he : Helement, name : Lpcstr, value : Lpcwstr) : Int
  fun sciter_get_element_location = SciterGetElementLocation(he : Helement, p_location : Lprect, areas : Uint) : Int
  fun sciter_scroll_to_view = SciterScrollToView(he : Helement, sciter_scroll_flags : Uint) : Int
    # Apply changes and refresh element area in its window.
  # \param[in] he \b #HELEMENT
  # \param[in] andForceRender \b SBOOL, TRUE to force UpdateWindow() call.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_update_element = SciterUpdateElement(he : Helement, and_force_render : Sbool) : Int
    # refresh element area in its window.
  # \param[in] he \b #HELEMENT
  # \param[in] rc \b RECT, rect to refresh.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_refresh_element_area = SciterRefreshElementArea(he : Helement, rc : Rect) : Int
    # Set the mouse capture to the specified element.
  # \param[in] he \b #HELEMENT
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # After call to this function all mouse events will be targeted to the element.
  # To remove mouse capture call ReleaseCapture() function.
fun sciter_set_capture = SciterSetCapture(he : Helement) : Int
  fun sciter_release_capture = SciterReleaseCapture(he : Helement) : Int
    # Get HWINDOW of containing window.
  # \param[in] he \b #HELEMENT
  # \param[out] p_hwnd \b HWINDOW*, variable to receive window handle
  # \param[in] rootWindow \b SBOOL, handle of which window to get:
  # - TRUE - Sciter window
  # - FALSE - nearest parent element having overflow:auto or :scroll
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_get_element_hwnd = SciterGetElementHwnd(he : Helement, p_hwnd : GtkWidget**, root_window : Sbool) : Int
    # Combine given URL with URL of the document element belongs to.
  # \param[in] he \b #HELEMENT
  # \param[in, out] szUrlBuffer \b LPWSTR, at input this buffer contains
  # zero-terminated URL to be combined, after function call it contains
  # zero-terminated combined URL
  # \param[in] UrlBufferSize \b UINT, size of the buffer pointed by
  # \c szUrlBuffer
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function is used for resolving relative references.
fun sciter_combine_url = SciterCombineURL(he : Helement, sz_url_buffer : Lpwstr, url_buffer_size : Uint) : Int
    # Call specified function for every element in a DOM that meets specified
  # CSS selectors.
  # See list of supported selectors: http://www.terrainformatica.com/sciter/css/selectors.htm
  # \param[in] he \b #HELEMENT
  # \param[in] selector \b LPCSTR, comma separated list of CSS selectors, e.g.: div, #id, div[align="right"].
  # \param[in] callback \b #SciterElementCallback*, address of callback
  # function being called on each element found.
  # \param[in] param \b LPVOID, additional parameter to be passed to callback
  # function.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_select_elements = SciterSelectElements(he : Helement, css_selectors : Lpcstr, callback : (Helement, Lpvoid -> Sbool), param : Lpvoid) : Int
  fun sciter_select_elements_w = SciterSelectElementsW(he : Helement, css_selectors : Lpcwstr, callback : (Helement, Lpvoid -> Sbool), param : Lpvoid) : Int
    # Find parent of the element by CSS selector.
  # ATTN: function will test first element itself.
  # See list of supported selectors: http://www.terrainformatica.com/sciter/css/selectors.htm
  # \param[in] he \b #HELEMENT
  # \param[in] selector \b LPCSTR, comma separated list of CSS selectors, e.g.: div, #id, div[align="right"].
  # \param[out] heFound \b #HELEMENT*, address of result HELEMENT
  # \param[in] depth \b LPVOID, depth of search, if depth == 1 then it will test only element itself.
  # Use depth = 1 if you just want to test he element for matching given CSS selector(s).
  # depth = 0 will scan the whole child parent chain up to the root.
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_select_parent = SciterSelectParent(he : Helement, selector : Lpcstr, depth : Uint, he_found : Helement*) : Int
  fun sciter_select_parent_w = SciterSelectParentW(he : Helement, selector : Lpcwstr, depth : Uint, he_found : Helement*) : Int
    # Set inner or outer html of the element.
  # \param[in] he \b #HELEMENT
  # \param[in] html \b LPCBYTE, UTF-8 encoded string containing html text
  # \param[in] htmlLength \b UINT, length in bytes of \c html.
  # \param[in] where \b UINT, possible values are:
  # - SIH_REPLACE_CONTENT - replace content of the element
  # - SIH_INSERT_AT_START - insert html before first child of the element
  # - SIH_APPEND_AFTER_LAST - insert html after last child of the element
  # 
  # - SOH_REPLACE - replace element by html, a.k.a. element.outerHtml = "something"
  # - SOH_INSERT_BEFORE - insert html before the element
  # - SOH_INSERT_AFTER - insert html after the element
  # ATTN: SOH_*** operations do not work for inline elements like <SPAN>
  # 
  # \return /b #SCDOM_RESULT SCAPI
fun sciter_set_element_html = SciterSetElementHtml(he : Helement, html : Byte*, html_length : Uint, where : Uint) : Int
    # Get Element UID.
  # \param[in] he \b #HELEMENT
  # \param[out] puid \b UINT*, variable to receive UID of the element.
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function retrieves element UID by its handle.
fun sciter_get_element_uid = SciterGetElementUID(he : Helement, puid : Uint*) : Int
    # Get Element handle by its UID.
  # \param[in] hwnd \b HWINDOW, HWINDOW of Sciter window
  # \param[in] uid \b UINT
  # \param[out] phe \b #HELEMENT*, variable to receive HELEMENT handle
  # \return \b #SCDOM_RESULT SCAPI
  # 
  # This function retrieves element UID by its handle.
fun sciter_get_element_by_uid = SciterGetElementByUID(hwnd : GtkWidget*, uid : Uint, phe : Helement*) : Int
    # Shows block element (DIV) in popup window.
  # \param[in] hePopup \b HELEMENT, element to show as popup
  # \param[in] heAnchor \b HELEMENT, anchor element - hePopup will be shown near this element
  # \param[in] placement \b UINT, values:
  # 2 - popup element below of anchor
  # 8 - popup element above of anchor
  # 4 - popup element on left side of anchor
  # 6 - popup element on right side of anchor
  # ( see numpad on keyboard to get an idea of the numbers)
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_show_popup = SciterShowPopup(he_popup : Helement, he_anchor : Helement, placement : Uint) : Int
    # Shows block element (DIV) in popup window at given position.
  # \param[in] hePopup \b HELEMENT, element to show as popup
  # \param[in] pos \b POINT, popup element position, relative to origin of Sciter window.
  # \param[in] placement \b UINT, meaning of pos - number in 1..9 range. When 7 - pos is top/left corner of the popup
fun sciter_show_popup_at = SciterShowPopupAt(he_popup : Helement, pos : Point, placement : Uint) : Int
    # Removes popup window.
  # \param[in] he \b HELEMENT, element which belongs to popup window or popup element itself
fun sciter_hide_popup = SciterHidePopup(he : Helement) : Int
    # Get/set state bits, stateBits*** accept or'ed values above
fun sciter_get_element_state = SciterGetElementState(he : Helement, pstate_bits : Uint*) : Int
  fun sciter_set_element_state = SciterSetElementState(he : Helement, state_bits_to_set : Uint, state_bits_to_clear : Uint, update_view : Sbool) : Int
    # Create new element, the element is disconnected initially from the DOM.
  #     Element created with ref_count = 1 thus you \b must call Sciter_UnuseElement on returned handler.
  # \param[in] tagname \b LPCSTR, html tag of the element e.g. "div", "option", etc.
  # \param[in] textOrNull \b LPCWSTR, initial text of the element or NULL. text here is a plain text - method does no parsing.
  # \param[out ] phe \b #HELEMENT*, variable to receive handle of the element
fun sciter_create_element = SciterCreateElement(tagname : Lpcstr, text_or_null : Lpcwstr, phe : Helement*) : Int
    # Create new element as copy of existing element, new element is a full (deep) copy of the element and
  #     is disconnected initially from the DOM.
  #     Element created with ref_count = 1 thus you \b must call Sciter_UnuseElement on returned handler.
  # \param[in] he \b #HELEMENT, source element.
  # \param[out ] phe \b #HELEMENT*, variable to receive handle of the new element.
fun sciter_clone_element = SciterCloneElement(he : Helement, phe : Helement*) : Int
    # Insert element at \i index position of parent.
  #     It is not an error to insert element which already has parent - it will be disconnected first, but
  #     you need to update elements parent in this case.
  # \param index \b UINT, position of the element in parent collection.
  #    It is not an error to provide index greater than elements count in parent -
  #    it will be appended.
fun sciter_insert_element = SciterInsertElement(he : Helement, hparent : Helement, index : Uint) : Int
    # Take element out of its container (and DOM tree).
  #     Element will be destroyed when its reference counter will become zero
fun sciter_detach_element = SciterDetachElement(he : Helement) : Int
    # Take element out of its container (and DOM tree) and force destruction of all behaviors.
  #     Element will be destroyed when its reference counter will become zero
fun sciter_delete_element = SciterDeleteElement(he : Helement) : Int
    # Start Timer for the element.
  #     Element will receive on_timer event
  #     To stop timer call SciterSetTimer( he, 0 );
fun sciter_set_timer = SciterSetTimer(he : Helement, milliseconds : Uint, timer_id : UintPtr) : Int
    # Attach/Detach ElementEventProc to the element
  #     See sciter::event_handler.
fun sciter_detach_event_handler = SciterDetachEventHandler(he : Helement, pep : LpelementEventProc, tag : Lpvoid) : Int
    # Attach ElementEventProc to the element and subscribe it to events providede by subscription parameter
  #     See Sciter::attach_event_handler.
fun sciter_attach_event_handler = SciterAttachEventHandler(he : Helement, pep : LpelementEventProc, tag : Lpvoid) : Int
    # Attach/Detach ElementEventProc to the Sciter window.
  #     All events will start first here (in SINKING phase) and if not consumed will end up here.
  #     You can install Window EventHandler only once - it will survive all document reloads.
fun sciter_window_attach_event_handler = SciterWindowAttachEventHandler(hwnd_layout : GtkWidget*, pep : LpelementEventProc, tag : Lpvoid, subscription : Uint) : Int
  fun sciter_window_detach_event_handler = SciterWindowDetachEventHandler(hwnd_layout : GtkWidget*, pep : LpelementEventProc, tag : Lpvoid) : Int
    # SciterSendEvent - sends sinking/bubbling event to the child/parent chain of he element.
  #     First event will be send in SINKING mode (with SINKING flag) - from root to he element itself.
  #     Then from he element to its root on parents chain without SINKING flag (bubbling phase).
  # \param[in] he \b HELEMENT, element to send this event to.
  # \param[in] appEventCode \b UINT, event ID, see: #BEHAVIOR_EVENTS
  # \param[in] heSource \b HELEMENT, optional handle of the source element, e.g. some list item
  # \param[in] reason \b UINT, notification specific event reason code
  # \param[out] handled \b SBOOL*, variable to receive TRUE if any handler handled it, FALSE otherwise.
fun sciter_send_event = SciterSendEvent(he : Helement, app_event_code : Uint, he_source : Helement, reason : UintPtr, handled : Sbool*) : Int
    # SciterPostEvent - post sinking/bubbling event to the child/parent chain of he element.
  # Function will return immediately posting event into input queue of the application.
  # 
  # \param[in] he \b HELEMENT, element to send this event to.
  # \param[in] appEventCode \b UINT, event ID, see: #BEHAVIOR_EVENTS
  # \param[in] heSource \b HELEMENT, optional handle of the source element, e.g. some list item
  # \param[in] reason \b UINT, notification specific event reason code
fun sciter_post_event = SciterPostEvent(he : Helement, app_event_code : Uint, he_source : Helement, reason : UintPtr) : Int
    # SciterFireEvent - sends or posts sinking/bubbling event to the child/parent chain of specified element.
  #     First event will be send in SINKING mode (with SINKING flag) - from root to element itself.
  #     Then from element to its root on parents chain without SINKING flag (bubbling phase).
  # \param[in] evt \b BEHAVIOR_EVENT_PARAMS, pointer to event param block
  # \param[in] post \b SBOOL, \c TRUE to post event asynchronously, \c FALSE otherwise
  # \param[out] handled \b SBOOL*, variable to receive TRUE if any handler handled it, FALSE otherwise.
fun sciter_fire_event = SciterFireEvent(evt : BehaviorEventParams*, post : Sbool, handled : Sbool*) : Int
    # SciterCallMethod - calls behavior specific method.
  # \param[in] he \b HELEMENT, element - source of the event.
  # \param[in] params \b METHOD_PARAMS, pointer to method param block
fun sciter_call_behavior_method = SciterCallBehaviorMethod(he : Helement, params : MethodParams*) : Int
    # SciterRequestElementData  - request data download for the element.
  # \param[in] he \b HELEMENT, element to deleiver data to.
  # \param[in] url \b LPCWSTR, url to download data from.
  # \param[in] dataType \b UINT, data type, see SciterResourceType.
  # \param[in] hInitiator \b HELEMENT, element - initiator, can be NULL.
  # 
  #   event handler on the he element (if any) will be notified
  #   when data will be ready by receiving HANDLE_DATA_DELIVERY event.
fun sciter_request_element_data = SciterRequestElementData(he : Helement, url : Lpcwstr, data_type : Uint, initiator : Helement) : Int
  fun sciter_http_request = SciterHttpRequest(he : Helement, url : Lpcwstr, data_type : Uint, request_type : Uint, request_params : RequestParam*, n_params : Uint) : Int
    # SciterGetScrollInfo  - get scroll info of element with overflow:scroll or auto.
  # \param[in] he \b HELEMENT, element.
  # \param[out] scrollPos \b LPPOINT, scroll position.
  # \param[out] viewRect \b LPRECT, position of element scrollable area, content box minus scrollbars.
  # \param[out] contentSize \b LPSIZE, size of scrollable element content.
fun sciter_get_scroll_info = SciterGetScrollInfo(he : Helement, scroll_pos : Lppoint, view_rect : Lprect, content_size : Lpsize) : Int
    # SciterSetScrollPos  - set scroll position of element with overflow:scroll or auto.
  # \param[in] he \b HELEMENT, element.
  # \param[in] scrollPos \b POINT, new scroll position.
  # \param[in] smooth \b SBOOL, TRUE - do smooth scroll.
fun sciter_set_scroll_pos = SciterSetScrollPos(he : Helement, scroll_pos : Point, smooth : Sbool) : Int
    # SciterGetElementIntrinsicWidths  - get min-intrinsic and max-intrinsic widths of the element.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pMinWidth \b INT*, calculated min-intrinsic width.
  # \param[out] pMaxWidth \b INT*, calculated max-intrinsic width.
fun sciter_get_element_intrinsic_widths = SciterGetElementIntrinsicWidths(he : Helement, p_min_width : Int*, p_max_width : Int*) : Int
    # SciterGetElementIntrinsicHeight  - get min-intrinsic height of the element calculated for forWidth.
  # \param[in] he \b HELEMENT, element.
  # \param[in] forWidth \b INT*, width to calculate intrinsic height for.
  # \param[out] pHeight \b INT*, calculated min-intrinsic height.
fun sciter_get_element_intrinsic_height = SciterGetElementIntrinsicHeight(he : Helement, for_width : Int, p_height : Int*) : Int
    # SciterIsElementVisible - deep visibility, determines if element visible - has no visiblity:hidden and no display:none defined
  #     for itself or for any its parents.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pVisible \b LPBOOL, visibility state.
fun sciter_is_element_visible = SciterIsElementVisible(he : Helement, p_visible : Sbool*) : Int
    # SciterIsElementEnabled - deep enable state, determines if element enabled - is not disabled by itself or no one
  #     of its parents is disabled.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pEnabled \b LPBOOL, enabled state.
fun sciter_is_element_enabled = SciterIsElementEnabled(he : Helement, p_enabled : Sbool*) : Int
    # SciterSortElements - sort children of the element.
  # \param[in] he \b HELEMENT, element which children to be sorted.
  # \param[in] firstIndex \b UINT, first child index to start sorting from.
  # \param[in] lastIndex \b UINT, last index of the sorting range, element with this index will not be included in the sorting.
  # \param[in] cmpFunc \b ELEMENT_COMPARATOR, comparator function.
  # \param[in] cmpFuncParam \b LPVOID, parameter to be passed in comparator function.
fun sciter_sort_elements = SciterSortElements(he : Helement, first_index : Uint, last_index : Uint, cmp_func : (Helement, Helement, Lpvoid -> Int), cmp_func_param : Lpvoid) : Int
    # SciterSwapElements - swap element positions.
  # Function changes "insertion points" of two elements. So it swops indexes and parents of two elements.
  # \param[in] he1 \b HELEMENT, first element.
  # \param[in] he2 \b HELEMENT, second element.
fun sciter_swap_elements = SciterSwapElements(he1 : Helement, he2 : Helement) : Int
    # SciterTraverseUIEvent - traverse (sink-and-bubble) MOUSE or KEY event.
  # \param[in] evt \b EVENT_GROUPS, either HANDLE_MOUSE or HANDLE_KEY code.
  # \param[in] eventCtlStruct \b LPVOID, pointer on either MOUSE_PARAMS or KEY_PARAMS structure.
  # \param[out] bOutProcessed \b LPBOOL, pointer to SBOOL receiving TRUE if event was processed by some element and FALSE otherwise.
fun sciter_traverse_ui_event = SciterTraverseUIEvent(evt : Uint, event_ctl_struct : Lpvoid, b_out_processed : Sbool*) : Int
    # CallScriptingMethod - calls scripting method defined for the element.
  # \param[in] he \b HELEMENT, element which method will be callled.
  # \param[in] name \b LPCSTR, name of the method to call.
  # \param[in] argv \b SCITER_VALUE[], vector of arguments.
  # \param[in] argc \b UINT, number of arguments.
  # \param[out] retval \b SCITER_VALUE*, pointer to SCITER_VALUE receiving returning value of the function.
fun sciter_call_scripting_method = SciterCallScriptingMethod(he : Helement, name : Lpcstr, argv : Value*, argc : Uint, retval : Value*) : Int
    # CallScriptingFunction - calls scripting function defined in the namespace of the element (a.k.a. global function).
  # \param[in] he \b HELEMENT, element which namespace will be used.
  # \param[in] name \b LPCSTR, name of the method to call.
  # \param[in] argv \b SCITER_VALUE[], vector of arguments.
  # \param[in] argc \b UINT, number of arguments.
  # \param[out] retval \b SCITER_VALUE*, pointer to SCITER_VALUE receiving returning value of the function.
  # 
  # SciterCallScriptingFunction allows to call functions defined on global level of main document or frame loaded in it.
fun sciter_call_scripting_function = SciterCallScriptingFunction(he : Helement, name : Lpcstr, argv : Value*, argc : Uint, retval : Value*) : Int
  fun sciter_eval_element_script = SciterEvalElementScript(he : Helement, script : Lpcwstr, script_length : Uint, retval : Value*) : Int
    # Attach HWINDOW to the element.
  # \param[in] he \b #HELEMENT
  # \param[in] hwnd \b HWINDOW, window handle to attach
  # \return \b #SCDOM_RESULT SCAPI
fun sciter_attach_hwnd_to_element = SciterAttachHwndToElement(he : Helement, hwnd : GtkWidget*) : Int
    # SciterControlGetType - get type of control - type of behavior assigned to the element.
  # \param[in] he \b HELEMENT, element.
  # \param[out] pType \b UINT*, pointer to variable receiving control type,
  # for list of values see CTL_TYPE.
fun sciter_control_get_type = SciterControlGetType(he : Helement, p_type : Uint*) : Int
    # SciterGetValue - get value of the element. 'value' is value of correspondent behavior attached to the element or its text.
  # \param[in] he \b HELEMENT, element which value will be retrieved.
  # \param[out] pval \b VALUE*, pointer to VALUE that will get elements value.
  # ATTN: if you are not using json::value wrapper then you shall call ValueClear aginst the returned value
  # otherwise memory will leak.
fun sciter_get_value = SciterGetValue(he : Helement, pval : Value*) : Int
    # SciterSetValue - set value of the element.
  # \param[in] he \b HELEMENT, element which value will be changed.
  # \param[in] pval \b VALUE*, pointer to the VALUE to set.
fun sciter_set_value = SciterSetValue(he : Helement, pval : Value*) : Int
    # SciterGetExpando - get 'expando' of the element. 'expando' is a scripting object (of class Element)
  # that is assigned to the DOM element. 'expando' could be null as they are created on demand by script.
  # \param[in] he \b HELEMENT, element which expando will be retrieved.
  # \param[out] pval \b VALUE*, pointer to VALUE that will get value of type T_OBJECT/UT_OBJECT_NATIVE or null.
  # \param[in] forceCreation \b SBOOL, if there is no expando then when forceCreation==TRUE the function will create it.
  # ATTN: if you are not using json::value wrapper then you shall call ValueClear aginst the returned value
  # otherwise it will leak memory.
fun sciter_get_expando = SciterGetExpando(he : Helement, pval : Value*, force_creation : Sbool) : Int
  fun sciter_get_highlighted_element = SciterGetHighlightedElement(hwnd : GtkWidget*, phe : Helement*) : Int
  fun sciter_set_highlighted_element = SciterSetHighlightedElement(hwnd : GtkWidget*, he : Helement) : Int
  fun sciter_node_add_ref = SciterNodeAddRef(hn : Hnode) : Int
  fun sciter_node_release = SciterNodeRelease(hn : Hnode) : Int
  fun sciter_node_cast_from_element = SciterNodeCastFromElement(he : Helement, phn : Hnode*) : Int
  fun sciter_node_cast_to_element = SciterNodeCastToElement(hn : Hnode, he : Helement*) : Int
  fun sciter_node_first_child = SciterNodeFirstChild(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_last_child = SciterNodeLastChild(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_next_sibling = SciterNodeNextSibling(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_prev_sibling = SciterNodePrevSibling(hn : Hnode, phn : Hnode*) : Int
  fun sciter_node_parent = SciterNodeParent(hnode : Hnode, phe_parent : Helement*) : Int
  fun sciter_node_nth_child = SciterNodeNthChild(hnode : Hnode, n : Uint, phn : Hnode*) : Int
  fun sciter_node_children_count = SciterNodeChildrenCount(hnode : Hnode, pn : Uint*) : Int
  fun sciter_node_type = SciterNodeType(hnode : Hnode, p_node_type : Uint*) : Int
  fun sciter_node_get_text = SciterNodeGetText(hnode : Hnode, rcv : (Lpcwstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Int
  fun sciter_node_set_text = SciterNodeSetText(hnode : Hnode, text : Lpcwstr, text_length : Uint) : Int
  fun sciter_node_insert = SciterNodeInsert(hnode : Hnode, where : Uint, what : Hnode) : Int
  fun sciter_node_remove = SciterNodeRemove(hnode : Hnode, finalize : Sbool) : Int
  fun sciter_create_text_node = SciterCreateTextNode(text : Lpcwstr, text_length : Uint, phnode : Hnode*) : Int
  fun sciter_create_comment_node = SciterCreateCommentNode(text : Lpcwstr, text_length : Uint, phnode : Hnode*) : Int
    # ValueInit - initialize VALUE storage
  # This call has to be made before passing VALUE* to any other functions
fun value_init = ValueInit(pval : Value*) : Uint
    # ValueClear - clears the VALUE and deallocates all assosiated structures that are not used anywhere else.
fun value_clear = ValueClear(pval : Value*) : Uint
    # ValueCompare - compares two values, returns HV_OK_TRUE if val1 == val2.
fun value_compare = ValueCompare(pval1 : Value*, pval2 : Value*) : Uint
    # ValueCopy - copies src VALUE to dst VALUE. dst VALUE must be in ValueInit state.
fun value_copy = ValueCopy(pdst : Value*, psrc : Value*) : Uint
    # ValueIsolate - converts T_OBJECT value types to T_MAP or T_ARRAY.
  # use this method if you need to pass values between different threads.
  # The fanction is applicable for the Sciter
fun value_isolate = ValueIsolate(pdst : Value*) : Uint
    # ValueType - returns VALUE_TYPE and VALUE_UNIT_TYPE flags of the VALUE
fun value_type = ValueType(pval : Value*, p_type : Uint*, p_units : Uint*) : Uint
    # ValueStringData - returns string data for T_STRING type
  # For T_FUNCTION returns name of the fuction.
fun value_string_data = ValueStringData(pval : Value*, p_chars : Lpcwstr*, p_num_chars : Uint*) : Uint
    # ValueStringDataSet - sets VALUE to T_STRING type and copies chars/numChars to
  # internal refcounted buffer assosiated with the value.
fun value_string_data_set = ValueStringDataSet(pval : Value*, chars : Lpcwstr, num_chars : Uint, units : Uint) : Uint
    # ValueIntData - retreive integer data of T_INT, T_LENGTH and T_BOOL types
fun value_int_data = ValueIntData(pval : Value*, p_data : Int*) : Uint
    # ValueIntDataSet - sets VALUE integer data of T_INT and T_BOOL types 
  # Optionally sets units field too.
fun value_int_data_set = ValueIntDataSet(pval : Value*, data : Int, type : Uint, units : Uint) : Uint
    # ValueInt64Data - retreive 64bit integer data of T_CURRENCY and T_DATE values.
fun value_int64_data = ValueInt64Data(pval : Value*, p_data : Int64*) : Uint
    # ValueInt64DataSet - sets 64bit integer data of T_CURRENCY and T_DATE values.
fun value_int64_data_set = ValueInt64DataSet(pval : Value*, data : Int64, type : Uint, units : Uint) : Uint
    # ValueFloatData - retreive FLOAT_VALUE (double) data of T_FLOAT and T_LENGTH values.
fun value_float_data = ValueFloatData(pval : Value*, p_data : LibC::Double*) : Uint
    # ValueFloatDataSet - sets FLOAT_VALUE data of T_FLOAT and T_LENGTH values.
fun value_float_data_set = ValueFloatDataSet(pval : Value*, data : LibC::Double, type : Uint, units : Uint) : Uint
    # ValueBinaryData - retreive integer data of T_BYTES type
fun value_binary_data = ValueBinaryData(pval : Value*, p_bytes : Lpcbyte*, pn_bytes : Uint*) : Uint
    # ValueBinaryDataSet - sets VALUE to sequence of bytes of type T_BYTES 
  # 'type' here must be set to T_BYTES. Optionally sets units field too.
  # The function creates local copy of bytes in its own storage.
fun value_binary_data_set = ValueBinaryDataSet(pval : Value*, p_bytes : Lpcbyte, n_bytes : Uint, type : Uint, units : Uint) : Uint
    # ValueElementsCount - retreive number of sub-elements for:
  # - T_ARRAY - number of elements in the array; 
  # - T_MAP - number of key/value pairs in the map;
  # - T_FUNCTION - number of arguments in the function;
fun value_elements_count = ValueElementsCount(pval : Value*, pn : Int*) : Uint
    # ValueNthElementValue - retreive value of sub-element at index n for:
  # - T_ARRAY - nth element of the array; 
  # - T_MAP - value of nth key/value pair in the map;
  # - T_FUNCTION - value of nth argument of the function;
fun value_nth_element_value = ValueNthElementValue(pval : Value*, n : Int, pretval : Value*) : Uint
    # ValueNthElementValueSet - sets value of sub-element at index n for:
  # - T_ARRAY - nth element of the array; 
  # - T_MAP - value of nth key/value pair in the map;
  # - T_FUNCTION - value of nth argument of the function;
  # If the VALUE is not of one of types above then it makes it of type T_ARRAY with 
  # single element - 'val_to_set'.
fun value_nth_element_value_set = ValueNthElementValueSet(pval : Value*, n : Int, pval_to_set : Value*) : Uint
    # ValueEnumElements - enumeartes key/value pairs of T_MAP, T_FUNCTION and T_OBJECT values
  # - T_MAP - key of nth key/value pair in the map;
  # - T_FUNCTION - name of nth argument of the function (if any);
fun value_nth_element_key = ValueNthElementKey(pval : Value*, n : Int, pretval : Value*) : Uint
  fun value_enum_elements = ValueEnumElements(pval : Value*, penum : (Lpvoid, Value*, Value* -> Sbool), param : Lpvoid) : Uint
    # ValueSetValueToKey - sets value of sub-element by key:
  # - T_MAP - value of key/value pair with the key;
  # - T_FUNCTION - value of argument with the name key;
  # - T_OBJECT (tiscript) - value of property of the object
  # If the VALUE is not of one of types above then it makes it of type T_MAP with 
  # single pair - 'key'/'val_to_set'.
  # 
  # key usually is a value of type T_STRING
fun value_set_value_to_key = ValueSetValueToKey(pval : Value*, pkey : Value*, pval_to_set : Value*) : Uint
    # ValueGetValueOfKey - retrieves value of sub-element by key:
  # - T_MAP - value of key/value pair with the key;
  # - T_FUNCTION - value of argument with the name key;
  # - T_OBJECT (tiscript) - value of property of the object
  # Otherwise *pretval will have T_UNDEFINED value.
fun value_get_value_of_key = ValueGetValueOfKey(pval : Value*, pkey : Value*, pretval : Value*) : Uint
    # ValueToString - converts value to T_STRING inplace:
  # - CVT_SIMPLE - parse/emit terminal values (T_INT, T_FLOAT, T_LENGTH, T_STRING)
  # - CVT_JSON_LITERAL - parse/emit value using JSON literal rules: {}, [], "string", true, false, null 
  # - CVT_JSON_MAP - parse/emit MAP value without enclosing '{' and '}' brackets.
fun value_to_string = ValueToString(pval : Value*, how : Uint) : Uint
    # ValueFromString - parses string into value:
  # - CVT_SIMPLE - parse/emit terminal values (T_INT, T_FLOAT, T_LENGTH, T_STRING), "guess" non-strict parsing
  # - CVT_JSON_LITERAL - parse/emit value using JSON literal rules: {}, [], "string", true, false, null 
  # - CVT_JSON_MAP - parse/emit MAP value without enclosing '{' and '}' brackets.
  # Returns:
  # Number of non-parsed characters in case of errors. Thus if string was parsed in full it returns 0 (success)
fun value_from_string = ValueFromString(pval : Value*, str : Lpcwstr, str_length : Uint, how : Uint) : Uint
    # ValueInvoke - function invocation (Sciter/TIScript).
  # - VALUE* pval is a value of type T_OBJECT/UT_OBJECT_FUNCTION
  # - VALUE* pthis - object that will be known as 'this' inside that function.
  # - UINT argc, const VALUE* argv - vector of arguments to pass to the function. 
  # - VALUE* pretval - parse/emit MAP value without enclosing '{' and '}' brackets.
  # - LPCWSTR url - url or name of the script - used for error reporting in the script.
  # Returns:
  # HV_OK, HV_BAD_PARAMETER or HV_INCOMPATIBLE_TYPE
fun value_invoke = ValueInvoke(pval : Value*, pthis : Value*, argc : Uint, argv : Value*, pretval : Value*, url : Lpcwstr) : Uint
    # ValueNativeFunctorSet - set reference to native function
  # - VALUE* pval - value to be initialized 
  # - NATIVE_FUNCTOR_INVOKE* pinvoke - reference to native functor implementation.
  # - NATIVE_FUNCTOR_RELEASE* prelease - reference to native functor dtor implementation.
  # - VOID* tag - optional tag, passed as it is to pinvoke and prelease
  # Returns:
  # HV_OK, HV_BAD_PARAMETER
fun value_native_functor_set = ValueNativeFunctorSet(pval : Value*, pinvoke : (Void*, Uint, Value*, Value* -> Void), prelease : (Void* -> Void), tag : Void*) : Uint
  fun value_is_native_functor = ValueIsNativeFunctor(pval : Value*) : Sbool
  fun sciter_proc_x = SciterProcX(hwnd : GtkWidget*, p_msg : SciterXMsg*) : Sbool
  fun sciter_atom_value = SciterAtomValue(name : LibC::Char*) : SomAtomT
  fun sciter_atom_name_cb = SciterAtomNameCB(atomv : Uint64, rcv : (Lpcstr, Uint, Lpvoid -> Void), rcv_param : Lpvoid) : Uint64
  fun sciter_set_global_asset = SciterSetGlobalAsset(pass : SomAssetT*) : Sbool
  fun sciter_element_unwrap = SciterElementUnwrap(pval : Value*, pp_element : Helement*) : Uint
  fun sciter_element_wrap = SciterElementWrap(pval : Value*, p_element : Helement) : Uint
  fun sciter_node_unwrap = SciterNodeUnwrap(pval : Value*, pp_node : Hnode*) : Uint
  fun sciter_node_wrap = SciterNodeWrap(pval : Value*, p_node : Hnode) : Uint
end
