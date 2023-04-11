if [ -d "$HOME/.aws/config" ] ; then
    if command -v aws &> /dev/null
    then
        if command -v fxf &> /dev/null
        then
            alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
        fi
    fi
fi
