# -*- mode:org -*-

* Org Drawer and Property Identifiers
** Drawers
*** Drawer Predicates
    - ~(org-at-property-drawer-p)~
      - "Non-nil  when  point is  at  the  first  line of  a  property
        drawer."
	
    - ~(org-at-property-p)~
      - "Non-nil when point is inside a property drawer.
      - See `org-property-re' for match data, if applicable."

*** Drawer Getters
    - ~(org-get-property-block &optional BEG FORCE)~
      - "Return the  (beg .  end) range  of the  body of  the property
        drawer."
      - "BEG is the beginning of  the current subtree or the beginning
        of the  document if before the  first headline.  If it  is not
        given, it will be found."
      - "If the drawer does not exist,  create it if FORCE is non-nil,
        or return nil.

*** Drawer Setters
  - ~(org-insert-drawer &optional ARG DRAWER)~
    - "Insert a drawer at point."
    - "When  optional  argument  ARG  is non-nil,  insert  a  property
      drawer."

  - ~(org-insert-property-drawer)~
    - "Insert a property drawer into the current entry."
    - "Do nothing if drawer already exists."

** Properties
*** Property Predicates
    - ~(org-entry-member-in-multivalued-property POM PROPERTY VALUE)~
      - "Is  VALUE  one of  the  words  in  the  PROPERTY in  entry  at
	point-or-marker POM?"

    - ~(org--valid-property-p PROPERTY)~
      - "Non-nil when string PROPERTY is a valid property name."
	
*** Property Getters
    - ~(org-entry-properties &optional POM WHICH)~
      - "Get all properties of the current entry."
      - "When POM  is a buffer  position, get all properties  from the
        entry there instead."
      - "This includes  the TODO keyword,  the tags, time  strings for
        deadline,   scheduled,  and   clocking,  and   any  additional
        properties defined in the entry."
      - "If WHICH  is nil or `all',  get all properties.  If  WHICH is
        `special' or `standard', only get  that subclass.  If WHICH is
        a string, only get that property."
      - "Return value  is an alist.   Keys are properties,  as upcased
        strings."

    - ~(org-buffer-property-keys &optional SPECIALS DEFAULTS COLUMNS)~
      - "Get all property keys in the current buffer."

    - ~(org-property-values KEY)~
      - "List all non-nil values of property KEY in current buffer."

    - ~(org-find-property PROPERTY &optional VALUE)~
      - "Find first entry in buffer that sets PROPERTY."

    - ~(org-read-property-name)~
      - "Read a property name."
      - Used once by  ~org-set-property~

    - ~(org-read-property-value PROPERTY &optional POM)~
      - "Read value for PROPERTY, as a string."

    - ~(org-entry-get POM PROPERTY &optional INHERIT LITERAL-NIL)~
      - "Get value of PROPERTY for  entry or content at point-or-marker
	POM."
      - "If  INHERIT  is  non-nil  and  the entry  does  not  have  the
	property, then also check higher levels of the hierarchy."
      - "If the property is present but  empty, the return value is the
	empty string."
      - "If the property is not present at all, nil is returned."
      - "In any other case, return the value as a string."

    - ~(org-entry-get-with-inheritance PROPERTY &optional LITERAL-NIL)~
      - "Get  PROPERTY of  entry  or content  at  point, search  higher
	levels if needed."
      - The  search will  stop  at  the first  ancestor  which has  the
	property defined.
      - If the  value found  is \"nil\",  return nil  to show  that the
	property should be considered as undefined

    - ~(org-entry-get-multivalued-property POM PROPERTY)~
      - "Return a list of values in a multivalued property."

    - ~(org-property-or-variable-value VAR &optional INHERIT)~
      - "Check if there is a property fixing the value of VAR."

    - ~(org-compute-property-at-point)~
      - "Compute the property at point."

    - ~(org-property-get-allowed-values POM PROPERTY &optional TABLE)~
      - "Get allowed values for the property PROPERTY."
      - "When TABLE  is non-nil, return  an alist that can  directly be
	used for completion."

    - ~(org-property-next-allowed-value &optional PREVIOUS)~
      - "Switch to the next allowed value for this property."

    - ~(org--property-global-or-keyword-value PROPERTY LITERAL-NIL)~
      - "Return value for PROPERTY as  defined by global properties or
        by keyword."
      - "Return value is a string".
      - "Return nil if property is not set globally or by keyword."

    - ~(org--property-local-values PROPERTY LITERAL-NIL)~
      - "Return value for PROPERTY in current entry."
      - "Value is a list whose car  is the base value for PROPERTY and
        cdr a list of accumulated values."
      - "Return nil if neither is found in the entry."

*** Property Setters
   - ~(org-property-action)!
     - "Do an action on properties."
     - "Property actions:"
       - =[s]et= :: #'org-set-property
       - =[d]elete= :: #'org-delete-property
       - =[D]elete globally= :: #'org-delete-property-globally
       - =[c]ompute= :: #'org-compute-property-at-point

   - ~(org-set-property PROPERTY VALUE)~
     - "In the current entry, set PROPERTY to VALUE."
      
   - ~(rg-set-property-and-value USE-LAST)~
     - "Allow to set [PROPERTY]: [value] direction from prompt."

   - ~(org-delete-property PROPERTY)~
     - "In the current entry, delete PROPERTY."

   - ~(org-delete-property-globally PROPERTY)~
     - "Remove PROPERTY globally, from all entries."
     - "Ignores narrowing."

   - ~(org-entry-put POM PROPERTY VALUE)~
     - "Set PROPERTY to VALUE for entry at point-or-marker POM."

   - ~(org-entry-put-multivalued-property POM PROPERTY &rest VALUES)~
     - "Set multivalued PROPERTY at point-or-marker POM to VALUES."
     - "VALUES should be a list of strings.  Spaces will be protected."

   - ~(org-entry-remove-from-multivalued-property POM PROPERTY VALUE)~
     - "Remove  VALUE   from  words  in   the  PROPERTY  in   entry  at
       point-or-marker POM."

   - ~(org-entry-add-to-multivalued-property POM PROPERTY VALUE)~
     - "Add  VALUE   to  the  words   in  the  PROPERTY  in   entry  at
       point-or-marker POM."

   - ~(org-entry-delete POM PROPERTY)~
     - "Delete PROPERTY from entry at point-or-marker POM."
     - "Accumulated properties, i.e. PROPERTY+, are also removed."
     - "Return non-nil when a property was removed."

   - ~(org-set-property-function PROPERTY)~
     - "Get the function that should be used to set PROPERTY."

   - ~(org-property-set-functions-alist)~
     - "Property set function alist."

   - ~(org--update-property-plist KEY VAL PROPS)~
     - "Associate KEY to VAL in alist PROPS."
     - "Modifications are made by side-effect.  Return new alist."

*** Property Variables
    - ~org-entry-property-inherited-from (make-marker)~
      - "Marker  pointing  to  the  entry from  where  a  property  was
	inherited."
      - "Each  call to  `org-entry-get-with-inheritance' will  set this
	marker  to the  location  of the  entry  where the  inheritance
	search matched."
      - "If there was no match, the marker will point nowhere."
      - "Note  that also  `org-entry-get' calls  this function,  if the
	INHERIT flag is set."

    - ~org-last-set-property-value~
    - ~org-last-set-property~

    - org-default-properties
      - "Some  properties  that  are  used by  Org  mode  for  various
        purposes."
	- ARCHIVE
	- CATEGORY
	- SUMMARY
	- DESCRIPTION
	- CUSTOM_ID
	- LOCATION
	- LOGGING
	- COLUMNS
	- VISIBILITY
	- TABLE_EXPORT_FORMAT
	- TABLE_EXPORT_FILE
	- EXPORT_OPTIONS
	- EXPORT_TEXT
	- EXPORT_FILE_NAME
	- EXPORT_TITLE
	- EXPORT_AUTHOR
	- EXPORT_DATE
	- UNNUMBERED
	- ORDERED
	- NOBLOCKING
	- COOKIE_DATA
	- LOG_INTO_DRAWER
	- REPEAT_TO_STATE
	- CLOCK_MODELINE_TOTAL
	- STYLE
	- HTML_CONTAINER_CLASS

    - org-special-properties
      - "The special properties valid in Org mode."
      - "These are  properties that  are not  defined in  the property
        drawer, but in some other way."
        - ALLTAGS
        - BLOCKED
        - CLOCKSUM
        - CLOCKSUM_T
        - CLOSED
        - DEADLINE
        - FILE
        - ITEM
        - PRIORITY
        - SCHEDULED
        - TAGS
        - TIMESTAMP
        - TIMESTAMP_IA
        - TODO

*** Property Hooks
    - ~org-property-changed-functions~
      - "Hook called when the value of a property has changed."

    - ~org-property-allowed-value-functions~
      - "Hook  for functions  supplying allowed  values for  a specific
	property."

* Org Element Functions
** Org Element Accessors
   - ~(org-element-type ELEMENT)~
     "Return type of ELEMENT."
   - ~(org-element-property PROPERTY ELEMENT)~
     - "Extract the value from the PROPERTY of an ELEMENT."
   - ~(org-element-contents ELEMENT)~
     - "Extract contents from an ELEMENT."
   - ~(org-element-restriction ELEMENT)~
     - "Return restriction associated to ELEMENT.""
   - ~(org-element-class DATUM &optional PARENT)~
     - "Return class for ELEMENT, as a symbol."
** Org Element Setters
   - ~(org-element-put-property ELEMENT PROPERTY VALUE)~
     - "In ELEMENT set PROPERTY to VALUE."
   - ~(org-element-set-contents ELEMENT &rest CONTENTS)~
     - "Set ELEMENT's contents to CONTENTS."
   - ~(org-element-adopt-elements PARENT &rest CHILDREN)~
     - "Append elements to the contents of another element."
   - ~(org-element-extract-element ELEMENT)~
     - "Extract ELEMENT from parse tree."
   - ~(org-element-insert-before ELEMENT LOCATION)~
     - "Insert ELEMENT before LOCATION in parse tree."
   - ~(org-element-set-element OLD NEW)~
     - "Replace element or object OLD with element or object NEW."
   - ~(org-element-create TYPE &optional PROPS &rest CHILDREN)~
     - "Create a new element of type TYPE."
   - ~(org-element-copy DATUM)~
     - "Return a copy of DATUM."
** Org Element Predicates
   - ~(org-element-secondary-p OBJECT)~
** Org Elements---Parsers and Interpreters
   - ~(org-element-TYPE-parser)~
   - ~(org-element-TYPE-interpreter ELEMENT CONTENTS)~
   - ~(org-element--current-element LIMIT &optional GRANULARITY MODE STRUCTURE)~
     - the core  function; it returns  the Lisp representation  of the
       element starting at point.
     - "Parse the element starting at point."
     - GRANULATITY :: determines the depth of the recursion
       - headline
       - greater-element
       - element
       - object
       - nil
     - MODE ::
       - first-section
       - item
       - node-property
       - planning
       - property-drawer
       - section
       - table-row
       - top-comment
*** Greater Elements
    - ~org-element-all-elements~
      - "Complete list of element types."
    - ~org-element-greater-elements~
      - "List of recursive element types aka Greater Elements."
**** Center Block
**** Drawer
**** Dynamic Block
**** Footnoe Definition
**** Headline
     - ~(org-element--get-node-properties)~
       - "Return node properties associated to headline at point."
     - ~(org-element--get-time-properties)~
       - "Return time properties associated to headline at point."
     - ~(org-element-headline-parser LIMIT &optional RAW-SECONDARY-P)~
       - "Parse a headline."
     - Headline Properties
       - :raw-value
       - :title
       - :begin
       - :end
       - :pre-blank
       - :contents-begin
       - :contents-end
       - :level
       - :priority
       - :tags
       - :todo-keyword
       - :todo-type
       - :scheduled
       - :deadline
       - :closed
       - :archivedp
       - :commentedp
       - :footnote-section-p
       - :post-blank
       - :post-affiliated
     - The  plist  also contains  any  property  set in  the  property
       drawer, with  its name in upper  cases and colons added  at the
       beginning
**** Inline Task
**** Item
**** Plain List
**** Property Drawer
**** Quote Block
**** Section
**** Special Block
*** Elements
**** Babel Call
**** Clock
**** Comment
**** Comment Block
**** Diary Sexp
**** Example Block
**** Export Block
**** Fixed Width
**** Horizontal Rule
**** Keyword
**** LaTeX Environment
**** Node Property
**** Paragraph
**** Planning
**** Src Block
**** Table
**** Table Row
**** Version Block
*** Objects
    - ~org-element-all-objects~
      - "Complete list of object types."
    - ~org-element-recursive-objects~
      - "List of recursive object types."
    - ~org-element-object-containers~
      - "List of  object or  element types  that can  directly contain
        objects."
**** Bold
**** Code
**** Entity
**** Export Snippet
**** Footnote Section
**** Inline Babel Call
**** Inline Src Block
**** Italic
**** Latex Fragment
**** Line Break
**** Link
**** Macro
**** Radio Target
**** Statistics Cookie
**** Strike-Through
**** Subscript
**** Superscript
**** Table Cell
**** Target
**** Timestamp
**** Underline
**** Verbatim
*** Keywords
    - ~org-element-affiliated-keywords~
      - "List of affiliated keywords as strings."
    - ~(org-element--collect-affiliated-keywords LIMIT PARSE)~
      - "Collect affiliated keywords from point down to LIMIT."
** Org Element Parser
   - ~(org-element-parse-buffer &optional GRANULARITY VISIBLE-ONLY)~
     - "Recursively parse the buffer and return structure."
     - "An element or object is represented as a list with the pattern
       (TYPE PROPERTIES CONTENTS)"
   - ~(org-element-parse-secondary-string STRING RESTRICTION &optional PARENT)~
     - "Recursively parse objects in STRING and return structure."
   - ~(org-element-map
       DATA TYPES FUN &optional INFO FIRST-MATCH NO-RECURSION WITH-AFFILIATED)~
     - "Map a function on selected elements or objects."
*** Internal Parsing Functions
   - ~(org-element--parse-elements
       BEG END MODE STRUCTURE GRANULARITY VISIBLE-ONLY ACC)~
     - Acts at the element's level.
     - "Parse elements between BEG and END positions."
   - ~(org-element--object-lex RESTRICTION)~
     - Applies to  all objects of  a paragraph or a  secondary string.
       It calls  ~org-element--object-lex~ to find the  next object in
       the current container.
     - "Return next object in current buffer or nil."
     - "This  function  assumes that  the  buffer  is narrowed  to  an
       appropriate container (e.g., a paragraph)."
   - ~(org-element--parse-objects BEG END ACC RESTRICTION &optional PARENT)~
     - "Parse  objects  between  BEG  and  END  and  return  recursive
       structure."
   - ~(org-element-interpret-data DATA)~
     - "Interpret DATA as Org syntax."
     - "Return Org syntax as a string."
   - ~(org-element--interpret-affiliated-keywords ELEMENT)~
     - "Return ELEMENT's affiliated keywords as Org syntax."
*** Org Element  White Spaces
    - ~(org-element-normalize-string S)~
      - "Ensure string S ends with a single newline character."
    - ~(org-element-normalize-contents ELEMENT &optional IGNORE-FIRST)~
      - removes  global indentation  from the  contents of  the current
	element.
      - "Normalize plain text in ELEMENT's contents."
** Org Element Public Tools
  - ~(org-element-at-point~
    - "Determine closest element around point."
    - "Return value is a list like  (TYPE PROPS) where TYPE is the type
      of the element and PROPS a plist of properties associated to the
      element."
  - ~(org-element-context &optional ELEMENT)~
    - "Return smallest element or object around point."
    - "Return value is a list like (TYPE PROPS) where TYPE is the type
      of  the  element or  object  and  PROPS  a plist  of  properties
      associated to it."
  - ~(org-element-lineage DATUM &optional TYPES WITH-SELF)~
    - "List all ancestors of a given element or object."
  - ~(org-element-nested-p ELEM-A ELEM-B)~
    - "Non-nil when elements ELEM-A and ELEM-B are nested."
  - ~(org-element-swap-A-B ELEM-A ELEM-B)~
    - "Swap elements ELEM-A and ELEM-B."
* Org Time
** LISP TIMESTAMPS
 seconds as integer pairs to represent absolute time: seconds since the epoch
 use time-convert to obtain a specific form
 3 forms:
    1. integer
    2. pair of integers '(TICKS . HZ)
    3. list of four integers '(HIGH LOW MICRO PICO)

** LISP TIME OF DAY: as TIMESTAMP
 - ~current-time~ => timestamp
 - ~float-time TIME~ => floating-point number of seconds
 - ~time-to-seconds~ (alias)
 - ~encode-time TIME~ => calendrical information into timestamp

** LISP TIME CONVERSION: convert time values to Lisp timestamps
 - ~time-convert TIME &opt FORM~
   - FORM: 'integer integer t 'list

** LISP HUMAN-READABLE TIME STRINGS
 - ~current-time-string TIME~ => timestamp into string
 - ~format-time-string FORMAT &opt TIME ZONE~ => pick your format

** LISP CALENDRICAL INFORMATION
 - ~decode-time &opt TIME ZONE FORM~ => convert TIME value into calendrical information (list)
   - (SEC MINUTE HOUR DAY MONTH YEAR DOW DST UTCOFF)
   - possible forms of TIME value => see ~format-time-string~
   - FORM
     - 'integer
     - t
     - nil
 - accessor decoded-time functions
   - ~decoded-time-second~
   - ~decoded-time-minute~
   - ~decoded-time-hour~
   - ~decoded-time-day~
   - ~decoded-time-month~
   - ~decoded-time-year~
   - ~decoded-time-weekday~
   - ~decoded-time-dst~
   - ~decoded-time-zone~
    
 - ~decoded-time-add TIME DELTA~ => add decoded-time structures
 - ~make-decoded-time &key SECOND MINUTE HOUR DAY MONTH YEAR DST ZONE~
   - second
   - minute
   - hour
   - day
   - month
   - year
   - dst
   - zone

** TIME PARSING: convert time values to text and vice versa
 - ~date-to-time STRING~ => parse STRING into Lisp timestamp
 - ~parse-time-string STRING~ => parse STRING into calendrical information
   - (SEC MIN HOUR DAY MON YEAR DOW DST TZ)
   - STRING should be an ISO8601 string or RFC 822 date-time
   - Unknown DST is returned as -1
 - iso8601-parse STRING
 - iso8601-parse-duration STRING
   - Parse ISO 8601 durations on the form P3Y6M4DT12H30M5S.
   - https://www.digi.com/resources/documentation/digidocs/90001437-13/reference/r_iso_8601_duration_format.htm
 - iso8601-parse-interval STRING
   - Start and end, such as "2007-03-01T13:00:00Z/2008-05-11T15:30:00Z"
   - Start and duration, such as "2007-03-01T13:00:00Z/P1Y2M10DT2H30M"
   - Duration and end, such as "P1Y2M10DT2H30M/2008-05-11T15:30:00Z"
   - Duration only, such as "P1Y2M10DT2H30M", with additional context information

 - ~org-parse-time-string STRING &opt NODEFAULT~
   - parse Org time string; should be faster than parse-time-string
 - ~org-time-string-to-time STRING~
   - convert timestamp string S into internal time
   - first parses STRING, then runs #'encode-time
 - ~org-time-string-to-seconds STRING~
   - convert timestamp string S into a number of seconds
   - uses #'float-time on org-time-string-to-time
 - ~org-time-string-to-absolute STRING &opt~ ...
   - convert timestamp S to an absolute day number
 - ~org-time-from-absolute DATE~
   - return time corresponding to DATE

** TIME CALCULATIONS
 - time-less-p   T1 T2
 - time-equal-p  T1 T2
 - time-subtract T1 T2
 - time-add      T1 T2
 - time-to-days TIME-VALUE
 - time-to-day-in-year TIME-VALUE
 - date-leap-year-p YEAR
 - date-days-in-month YEAR MONTH
 - date-ordinal-to-time YEAR ORDINAL

** ORG TIME CALCULATIONS
 - org-2ft S
 - org-time=  A B
 - org-time<  A B
 - org-time<= A B
 - org-time>  A B
 - org-time>= A B
 - org-time<> A B
 - org-duration-to-minutes DURATION &optional CANONICAL
   - "Return number of minutes of DURATION string."

** ORG TIMESTAMP CHANGES
 - org-timestamp-change
      n &optional what updown suppress-tmp-delay
   - N :: how much
   - WHAT :: what to change
     - day
     - month
     - year
     - hour
     - minute
   - UPDOWN :: when non-nil, round minutes by: 
     `org-time-stamp-rounding-minutes'
 - org-timestamp-up
 - org-timestamp-down
 - org-timestamp-up-day
 - org-timestamp-down-day

** ORG DURATIONS
   ** Org-Duration.el
   - see ~org-duration.el~
     - This library provides tools to manipulate durations.  A duration
       can have multiple formats:
       - 3:12
       - 1:23:45
       - 1y 3d 3h 4min
       - 1d3h5min
       - 3d 13:35
       - 2.35h

*** Pubic Duration Identifies
   - org-duration-canonical-units
   - org-duration-units
   - org-duration-format
   - org-duration-set-regexps
   - org-duration-p
   - org-duration-to-minutes
   - org-duration-from-minutes
   - org-duration-h:mm-only-p

*** Internal Duration Identifiers  
   - org-duration--h:mm-re
   - org-duration--h:mm:ss-re
   - org-duration--unit-re
   - org-duration--full-re
   - org-duration--mixed-re
   - org-duration--modifier

** PREDICATES
 - org-at-timestamp-p &optional EXTENDED
   - "Non-nil if point is inside a timestamp."
 - org-at-clock-log-p
   - "Non-nil if point is on a clock log line."
 - org-duration-p S
   - "Non-nil when string S is a time duration."
  
** ORG-CALENDAR
 - org-goto-calendar
 - org-get-date-from-calendar
 - org-date-from-calendar

** ORG-CLOCK
 - org-clock-get-last-clock-out-time
      get the last clock-out time for the current subtree
 - org-clock-sum => sum the times for each subtree
 - org-clock-display
 - org-clock-report
 - org-clock-get-table-data

 - org-evaluate-time-range

** Org RE TIMESTAMPS
 - org-re-timestamp
 - org-ts--internal-regexp
 - org-ts-regexp => Regular expression for fast time stamp matching.
 - org-ts-regexp-inactive => Regular expression for fast inactive time stamp matching.
 - org-ts-regexp-both => Regular expression for fast time stamp matching.
 - org-ts-regexp0 => Regular expression matching time strings for analysis.
       - "\\(\\([0-9]\\{4\\}\\)-\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\)
          \\( +[^]+0-9>\r\n -]+\\)?
          \\( +\\([0-9]\\{1,2\\}\\):\\([0-9]\\{2\\}\\)\\)?\\)"
 - org-ts-regexp1 => Regular expression matching time strings for analysis.
 - org-ts-regexp2 =>
 - org-ts-regexp3 =>
 - org-tr-regexp  => Regular expression matching a time stamp range.
 - org-tr-regexp-both =>
 - org-tsr-regexp => Regular expression matching a time stamp or time stamp range.
 - org-tsr-regexp-both =>
 - org-repeat-re =>
 - org-time-stamp-formats => Formats for `format-time-string' which are used for time stamps.
       - "<%Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M>"


  <2021-04-09 Fri>
  <2021-04-09 Fri 09:38>

  [2021-04-09 Fri]
  [2021-04-09 Fri 12:15]
  [2021-04-09 Fri 01:05]
  [2021-04-09 Fri 07:24]--[2021-04-09 Fri 17:00]

  [2021-04-09 Fri 12:15]
  [2021-04-09]
  [2021-04-09 12:15]

  - org-duration--h:mm-re
    - "Regexp  matching  a  duration  expressed with  H:MM  or  H:MM:SS
      format."
  - org-duration--h:mm:ss-re
    - "Regexp matching a duration expressed H:MM:SS format."
  - org-duration--unit-re
    - "Regexp matching a duration with an unit."
  - org-duration--full-re

