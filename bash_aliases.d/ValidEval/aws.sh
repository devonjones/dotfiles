alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
