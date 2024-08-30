# Custom Rules

    customRules:
    my_rules: |-
        - rule: Unauthorized mount process
        desc: There is an unauthorized mount process running
        condition: evt.type=execve and proc.name=mount
        output: Unauthorized process (%proc.cmdline) running
        priority: WARNING
        tags: [process, mount]

    
helm upgrade falco falcosecurity/falco -n falco --reuse-values --version 4.0.0 -f my_rules.yaml


mount --version

kubectl logs --selector app.kubernetes.io/name=falco -n falco -c falco | grep mount



Falco macros
It is common to reuse conditions (or part of them) multiple times across a rules file. Macros allow you to define conditions and reuse them wherever you want.



## Macros are defined by:

macro: Name of the macro.
condition: Filtering expression, same as used in rules.
Macros have three main benefits:

code reuse
avoid long strings of conditions
rules are easier to understand



    customRules:
    my_rules: |-
        - rule: Unauthorized mount process
        desc: There is an unauthorized mount process running
        condition: mount_process
        output: Unauthorized process (%proc.cmdline) running
        priority: WARNING
        tags: [process, mount]

        - macro: mount_process
        condition: evt.type=execve and proc.name=mount


mount --version


Falco lists
Lists are named collections of items that you can include in rules, macros, or even other lists. Lists help you organize your rules files with naming and segmentation. Each list node has the following keys:

list: Name of the List.
items: List of values (inside square brackets and separated by comma).


Update your custom macro to use a list as part of the condition:

Name the list forbidden_processes.
The list contains the following forbidden processes: mount, sudo, su
Use the new list as part of the macro condition.


    customRules:
    my_rules: |-
        - rule: Unauthorized mount process
        desc: There is an unauthorized mount process running
        condition: mount_process
        output: Unauthorized process (%proc.cmdline) running
        priority: WARNING
        tags: [process, mount]

        - macro: mount_process
        condition: evt.type=execve and proc.name in (forbidden_processes)

        - list: forbidden_processes
        items: [mount, sudo, su]


sudo ls
kubectl logs --selector app.kubernetes.io/name=falco -n falco -c falco | grep sudo


Falco default rules, macros, and lists
Falco ships with an extensive set of default rules, macros, and lists. The default falco rules file:

is installed at /etc/falco/falco_rules.yaml.
contains a predefined set of rules designed to provide good coverage in a variety of situations.
should not be modified.
is replaced with each new software version.
Run falco -L to show the name and description of all rules.




FALCO_POD=$(kubectl get pods -n falco | sed -n -e 's/^\(falco-[[:alnum:]]*\).*/\1/p')
kubectl exec ${FALCO_POD} -n falco -- falco -L

kubectl exec -it ${FALCO_POD} -n falco -- /bin/bash

    Notice A shell was spawned in a container with an attached terminal

kubectl logs --selector app.kubernetes.io/name=falco -n falco -c falco | grep shell


Appending to lists, rules, and macros
You can extend a list, a macro, or even a rule by using the append feature. Append has two main use cases:

Tune noisy rules that generate false positives.
Add additional items to lists or macros that are custom to your environment.


    - rule: Create Symlink Over Sensitive Files
    condition: >
        create_symlink and
        (evt.arg.target in (sensitive_file_names) or evt.arg.target in (sensitive_directory_names))
    ...

    - list: sensitive_directory_names
    items: [/, /etc, /etc/, /root, /root/]

    - list: sensitive_file_names
    items: [/etc/shadow, /etc/sudoers, /etc/pam.conf, /etc/security/pwquality.conf]



CORREGIDA


customRules:
  my_rules: |-
    - rule: Create Symlink Over Sensitive Files
      condition: >
        create_symlink and
        (evt.arg.target in (sensitive_file_names) or evt.arg.target in (sensitive_directory_names))

    - list: sensitive_directory_names
      items: [/, /etc, /etc/, /root, /root/]

    - list: sensitive_file_names
      items: [/etc/shadow, /etc/sudoers, /etc/pam.conf, /etc/security/pwquality.conf]

    - list: sensitive_directory_names
      items: [/mnt]
      override:
        items: append



Rules Maturity Framework
Falco 0.36 introduces the rules maturity framework to facilitate the adoption of non-custom rules. The Falco rules maturity framework introduces a structured way to classify security rules into categories like: stable, incubating, sandbox, and deprecated; enabling adopters to better assess the applicability and engineering effort needed for integration.

The rules maturity framework makes it easy for adopters to understand each rule and also gain an understanding of how beneficial it can be under various circumstances. Additionally, due to this framework, adopters should find themselves with a clearer understanding of which rules can likely be adopted as-is versus which rules may require significant engineering efforts to evaluate and adopt.



co default rules have at least one tag. These are the main tags:

filesystem: The rule relates to reading/writing files.
software_mgmt: The rule relates to any software/package management tool like rpm, dpkg, etc.
process: The rule relates to starting a new process or changing the state of a current process.
database: The rule relates to databases.
host: The rule only works outside of containers.
shell: The rule specifically relates to starting shells.
container: The rule only works inside containers.
cis: The rule is related to the CIS Docker benchmark.
users: The rule relates to management of users or changing the identity of a running process.
network: The rule relates to network activity.


kubectl exec -n falco falco-4nt72 -- falco --support | jq '.["engine_info"]'