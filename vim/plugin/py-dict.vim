python<<EOF
import re
import urllib
import urllib2
from xml.etree import ElementTree
from HTMLParser import HTMLParser
import vim
import webbrowser

def strip_tags(html):
  html = html.strip()
  html = html.strip("\n")
  result = []
  parse = HTMLParser()
  parse.handle_data = result.append
  parse.feed(html)
  parse.close()
  return "".join(result)

def youdao_crawl_xml(queryword):
    return urllib2.urlopen("http://dict.yodao.com/search?keyfrom=dict.python&q="
            + urllib.quote_plus(queryword) + "&xmlDetail=true&doctype=xml").read();

def trans_ce( dom ):
  txts = [ u" "*4 + s.text for s in dom.findall('translation/content') ] 
  return u"\n".join( txts )

def trans_dict( dom ):
  rtns = []
  wts  = dom.findall( 'web-translation' )
  for w in wts:
    key = w.find('key').text
    tmp = []
    for t in w.findall('trans'):
      txt = " "*4 + t.find('value').text + "; " + strip_tags( t.find('summary').text )
      tmp.append( txt )
    rtns.append( " " + key + "\n" + "\n".join(tmp) )
  return "\n".join( rtns )

def youdao_translations(xml):
  tree = ElementTree.fromstring( xml )
  original = tree.find('original-query').text
  """ custom-translation type ec, youdao """
  customs = []
  srcs = {}
  customs = tree.findall('custom-translation')
  for custom in customs:
    tp  = custom.find('type').text
    src = custom.find('source/name').text
    if tp in [ 'ec' , 'ce' ]:
      srcs[ src ] =  trans_ce( custom )
     #else
     #  srcs[ src ] = trans_ee( custom )
  rtn = [] 
  link = tree.find('yodao-link').text
  rtn.append( "[dict: " + original + " "*4 + link + "]" )
  for (key, trans) in srcs.items():
    rtn.append( u"Translations from "+ key )
    rtn.append( trans )

    #if tree.find('youdao-web-dict'):
    rtn.append( u"Translation from youdao" )
    wt = trans_dict( tree.find('yodao-web-dict') )
    rtn.append( wt )
  p = u"\n".join(rtn)
  return ( link ,  p.encode('utf-8').strip() )

def do_trans( word ):
  word = str(word)
  if len(word) <= 0:
    return
  xml = youdao_crawl_xml( word );
  ( link , p ) = youdao_translations( xml )
  p = p + "\n pass <g> to google or pass <y> to youdao by webbrowser "
  goto = vim.eval("input('" + p  + "')")
  if goto == 'y' :
    webbrowser.open( link )
    print "Youdao: %s" % word
  elif goto == 'g':
    do_google( word )

def do_google( word ):
  word = str(word)
  if len(word) <= 0:
    return
  webbrowser.open( "http://www.google.com/search?q=" + word.encode('utf-8').strip())
  print "Google: %s" % word
EOF

map <leader>y :py do_trans(vim.eval('expand("<cword>")'))<CR>
map <leader>g :py do_google(vim.eval('expand("<cword>")'))<CR>
