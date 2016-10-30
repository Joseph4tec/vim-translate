# **vim-translate**

## **English**

*Language:pure VimL*

Translate plugin for vim, from english to other language.

**Temporary for chinese!!**

Many other plugins rely on Python, while Python is not supported by the default Vim binary.

I don't want to compile Vim myself. So here comes this plugin.

### Dependencies
1. curl

	For Windows you need to install "curl" (or you can use Cygwin)
2. Youdao API key

	You need an API key from youdao.

	You should appply for it by yourself. [APPLY HERE](http://fanyi.youdao.com/openapi?path=data-mode)
3. You must be online!

### Install
1. Download and install
2. Add _keys.vim_ (or any filename you like) to "plugin" directory.

	It should contain these lines:
	````viml
	let g:keyfrom = "你自己的keyfrom"
	let g:key = "你自己的key"
	````
3. Map a key

	Example:
	````viml
	nnoremap <F12> :call VimTranslate()<CR>
	````
### How to use

Move the cursor to a word you want to translate and press the key you mapped.

### Version

#### v0.1
First release.

Use Youdao translate engine.

Only support English to Chinese.

Still not very good. But it works!

### todo

- [ ] Other language support
- [ ] Function than can accept a var
- [ ] Other translate engine support

## **简体中文**:cn:

*语言：纯VimL*

Vim翻译插件

很多翻译插件依赖Python特性，然而Vim的官方可执行版并不包含Python特性。

我不想编译Vim，所以有了这个插件。

### 依赖项
1. curl

	Windows上需要安装curl命令（或Cygwin）

2. 有道API key

	需要自己申请，[申请页面](http://fanyi.youdao.com/openapi?path=data-mode)

3. 能上网的环境

### 安装
1. 下载安装插件

2. 自己添加 _keys.vim_（或你喜欢的文件名） 文件到plugin目录下

	内容如下：
	````viml
	let g:keyfrom = "你自己的keyfrom"
	let g:key = "你自己的key"
	````
3. 在vimrc中加入键位绑定

	例如(绑定到F12)：
	````viml
	nnoremap <F12> :call VimTranslate()<CR>
	````
### 使用

光标移到需要翻译的单词，按下绑定的按键。

### 版本

#### v0.1

初步完成程序。

使用有道翻译API，目前只支持英文翻译到中文。

虽然还很不完美，但基本可用了~:smile:

### todo

- [ ] 英文到其他语言的翻译
- [ ] 可带参数的翻译函数
- [ ] 其他翻译API支持
