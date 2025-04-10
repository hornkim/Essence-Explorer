swipl -f prolog/semat_server.pl -g "translate_competency_types" -g halt > comp.txt
swipl -f prolog/semat_server.pl -g "translate_practice(architecture)" -g halt > architecture.txt
swipl -f prolog/semat_server.pl -g "translate_practice(scrum)" -g halt > scrum.txt
swipl -f prolog/semat_server.pl -g "translate_practice(kernel)" -g halt > kernel.txt
swipl -f prolog/semat_server.pl -g "translate_practice(user_stories)" -g halt > user_stories.txt
swipl -f prolog/semat_server.pl -g "translate_practice(tdd)" -g halt > tdd.txt
swipl -f prolog/semat_server.pl -g "translate_practice(architecture_governance)" -g halt > arch_governance.txt


