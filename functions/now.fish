function now
    set --local DateColumn 34
    set --local TimeColumn 61
    curl "wttr.in/Tamshui?0" --silent --max-time 3 | read -z aWeather
    if string match -q "Weather report*" $aWeather
        echo $aWeather
    else
        echo "+============================+"
        echo "| Weather unavailable now!!! |"
        echo "| Check reason with command: |"
        echo "|                            |"
        echo "| curl \"wttr.in/Tamshui?0\"   |" # Replace Edmonton with your city
        echo "|   --silent --max-time 3    |"
        echo "+============================+"
        echo " "
    end
    echo " "
    tput sc
    # move up 9 line
    for i in (seq 9)
        tput cuu1
    end

    # tput cuf $DateColumn
    set_color green
    set --local Cal (cal)
    set --local Today (date +"%e")
    for i in (seq (count $Cal))
        tput cuf $DateColumn
        set --local Test (echo $Cal[$i] | tr -cd '\11\12\15\40\60-\136\140-\176')
        echo -n $Test
        if [ $i -gt 3 ]
            tput cub 22
            for j in (seq 1 3 19)
                if test (string sub -s $j -l 2 $Test) = $Today
                    set_color -r
                    echo -n $Today
                    set_color normal
                    set_color green
                    tput cuf 1
                else
                    tput cuf 3
                end

            end
        end
        tput cud1
    end

    tput rc

    for i in (seq 8)
        tput cuu1
    end
    set_color cyan
    set --local Date (date +"%I:%M %P" | toilet -f future --filter border)
    for i in (seq (count $Cal))
        tput cuf $TimeColumn
        echo $Date[$i]
    end
    tput rc

end
