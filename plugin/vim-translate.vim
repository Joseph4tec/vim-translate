function! VimTranslate()
	"待查词语
	let s:word = expand("<cWORD>")
	echo s:word . "\n"
	"生成查询语句
	let s:query = "curl \"http://fanyi.youdao.com/openapi.do?keyfrom=" . g:keyfrom . "&key=" . g:key . "&type=data&doctype=json&version=1.1&q=" . s:word . "&only=dict\""
	"获得curl结果
	let s:get = system(s:query)
	"对字符串进行处理
	let s:result = substitute(s:get,'.*explains":\[\(.*\)\]},"query.*','\1','')
	if s:result != s:get
		"有词典翻译的情况
		echo s:result
	else
		let s:result = substitute(s:get,'.*web":\[{"value":\[','','')
		let s:result = substitute(s:result,'\],"key.*','','')
		if s:result != s:get
			"有网络释义的情况
			echo "网络释义\n"
			echo s:result
		else
			echo "无翻译结果"
		endif
	endif
endfunction

nnoremap <F12> :call VimTranslate()<CR>

