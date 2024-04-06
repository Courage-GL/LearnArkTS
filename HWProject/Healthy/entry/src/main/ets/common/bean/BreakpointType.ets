declare interface BreakpointTypeOptions {
  sm?: any,
  lg?: any,
  md?: any
}

// 自定义返回类型
export default class BreakpointType {
  options: BreakpointTypeOptions

  constructor(options: BreakpointTypeOptions) {
    this.options = options
  }

  getValue(currentBreakpoint: string) {
    return this.options[currentBreakpoint]
  }
}