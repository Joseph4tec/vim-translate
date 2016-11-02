function! VimTranslate()
	"待查词语
	let s:word = expand("<cWORD>")
	"生成查询语句
	let s:query = "curl \"http://fanyi.youdao.com/openapi.do?keyfrom=" . g:keyfrom . "&key=" . g:key . "&type=data&doctype=json&version=1.1&q=" . s:word . '"'
	"获得curl查询结果
	let s:get = system(s:query)
	"调试用
	"echo s:get
	"提取errorCode
	let s:error = substitute(s:get,'.*"errorCode":\([0-9]*\).*','\1','')
	"调试用
	"echo 'errorCode:' . s:error
	"对errorCode进行处理
	if s:error == 0
		"翻译成功的情况
		echo s:word . "\n"
		"提取词典结果
		let s:result = substitute(s:get,'.*explains":\[\(.*\)\]},"query.*','\1','')
		if s:result != s:get
			echo s:result
		else
			"提取网络词典
			let s:result = substitute(s:get,'.*web":\[{"value":\[','','')
			let s:result = substitute(s:result,'\],"key.*','','')
			if s:result != s:get
				echo s:result
			else
				"提取翻译结果
				let s:result = substitute(s:get,'.*translation":\["','','')
				let s:result = substitute(s:result,'"\],"query.*','','')
				echo s:result
			endif
		endif
	elseif s:error == 20
		echo 'The source text in one request is too long'
	elseif s:error == 30
		echo 'The server is down'
	elseif s:error == 40
		echo 'Not support language code'
	elseif s:error == 50
		echo 'Invalid key'
	elseif s:error == 60
		echo 'No dictionary result'
	else
		echo 'unknow error!'
	endif
	"对字符串进行处理
endfunction


