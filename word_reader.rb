class WordReader
    def read_from_file(file_name)

        #if File.exist?(file_name)
        begin
            f = File.new(file_name, 'r:UTF-8')
            lines = f.readlines
            f.close
            return lines.sample.chomp
        #else
    rescue SystemCallError
        abort "Файл со словами не найден!"
        end
        #end
    end
end
    