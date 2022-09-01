const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0C1031", /* black   */
  [1] = "#123c84", /* red     */
  [2] = "#175ea1", /* green   */
  [3] = "#1c57c4", /* yellow  */
  [4] = "#e44871", /* blue    */
  [5] = "#1a98b8", /* magenta */
  [6] = "#20c5df", /* cyan    */
  [7] = "#c2c5c7", /* white   */

  /* 8 bright colors */
  [8]  = "#87898b",  /* black   */
  [9]  = "#123c84",  /* red     */
  [10] = "#175ea1", /* green   */
  [11] = "#1c57c4", /* yellow  */
  [12] = "#e44871", /* blue    */
  [13] = "#1a98b8", /* magenta */
  [14] = "#20c5df", /* cyan    */
  [15] = "#c2c5c7", /* white   */

  /* special colors */
  [256] = "#0C1031", /* background */
  [257] = "#c2c5c7", /* foreground */
  [258] = "#c2c5c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
