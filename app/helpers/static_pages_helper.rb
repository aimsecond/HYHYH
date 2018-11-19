module StaticPagesHelper
    def convert_link(link)
        unless link.to_s.empty?
            if link.include? 'watch?v='
                'https://www.youtube.com/embed/' + link.split('watch?v=')[1]
            end 
        end
    end

    def get_thumbnail(link)
        'https://img.youtube.com/vi/' + link.split('watch?v=')[1] + '/default.jpg'
    end

    def get_title(link)
        video = VideoInfo.new(link)
        video.title
    end
end
