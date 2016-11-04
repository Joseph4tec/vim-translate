"文件域变量
if !exists("s:source")
	let s:source = "english"
endif
if !exists("s:target")
	let s:target = "chinese"
endif

"通用翻译函数
function! VimTranslate()
	"获得待查词语
	let word = expand("<cWORD>")
	"调用翻译API
	call JTranslateYoudao(word)
endfunction

function! JTranslateYoudao(word)
	"生成查询语句
	let query = "curl \"http://fanyi.youdao.com/openapi.do?keyfrom=" . g:keyfrom . "&key=" . g:key . "&type=data&doctype=json&version=1.1&q=" . a:word . '"'
	"获得curl查询结果
	let get = system(query)
	"调试用
	"echo get
	"提取errorCode
	let error = substitute(get,'.*"errorCode":\([0-9]*\).*','\1','')
	"调试用
	"echo 'errorCode:' . error
	"对errorCode进行处理
	if error == 0
		"翻译成功的情况
		echo a:word . "\n"
		"提取词典结果
		let result = substitute(get,'.*explains":\[\(.*\)\]},"query.*','\1','')
		if result != get
			echo result
		else
			"提取网络词典
			let result = substitute(get,'.*web":\[{"value":\[','','')
			let result = substitute(result,'\],"key.*','','')
			if result != get
				echo result
			else
				"提取翻译结果
				let result = substitute(get,'.*translation":\["','','')
				let result = substitute(result,'"\],"query.*','','')
				echo result
			endif
		endif
	elseif error == 20
		echo 'The source text in one request is too long'
	elseif error == 30
		echo 'The server is down'
	elseif error == 40
		echo 'Not support language code'
	elseif error == 50
		echo 'Invalid key'
	elseif error == 60
		echo 'No dictionary result'
	else
		echo 'unknow error!'
	endif
	"对字符串进行处理
endfunction

