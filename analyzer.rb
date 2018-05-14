
@total_hits_by_ip = Hash.new(0)
@total_hits_by_url = Hash.new(0)
@secret_hits_by_ip = Hash.new(0)
@error_count = 0

def analyze (file_name)
    
    ip_regex  = /(([0-9](?!\d)|[1-9][0-9](?!\d)|1[0-9]{2}(?!\d)|2[0-4][0-9](?!\d)|25[0-5](?!\d))[.]?){4}/
    url_regex = /[^\s\\]*.html/
    
    File.foreach(file_name).each do |line|
        count_hits(line.match(ip_regex), line.match(url_regex), line.match(/secret/) == 'secret', line.match(/200/) != '200' )
    end
    
    print_hits()
    
end

def count_hits(ip, url, secret, error)
    
    @total_hits_by_ip["#{ip}"] += 1
    @total_hits_by_url["#{url}"] += 1
    
    if secret
      @secret_hits_by_ip["#{ip}"] += 1
    end
    
    if error 
      @error_count += 1
    end
    
end

def print_hits()
  @total_hits_by_ip.sort.each do |ip, val|
        secret = @secret_hits_by_ip["#{ip}"]
        puts("IP #{ip} hit #{val} times. Secret requested #{secret} time(s).")
  end
    puts("#{@error_count} Error(s).")
end

ARGV.each do |a|
    analyze(a)
end
