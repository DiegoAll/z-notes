# Linux sysrq


    echo m > /proc/sysrq-trigger

    2024-10-05T02:15:56.068006-05:00 ubuntu-test kernel: sysrq: Show Memory
    2024-10-05T02:15:56.068028-05:00 ubuntu-test kernel: Mem-Info:
    2024-10-05T02:15:56.068029-05:00 ubuntu-test kernel: active_anon:159282 inactive_anon:0 isolated_anon:0
    2024-10-05T02:15:56.068029-05:00 ubuntu-test kernel:  active_file:156049 inactive_file:119821 isolated_file:0
    2024-10-05T02:15:56.068030-05:00 ubuntu-test kernel:  unevictable:4 dirty:0 writeback:0
    2024-10-05T02:15:56.068030-05:00 ubuntu-test kernel:  slab_reclaimable:12274 slab_unreclaimable:30062
    2024-10-05T02:15:56.068031-05:00 ubuntu-test kernel:  mapped:81919 shmem:8712 pagetables:4875
    2024-10-05T02:15:56.068032-05:00 ubuntu-test kernel:  sec_pagetables:0 bounce:0
    2024-10-05T02:15:56.068033-05:00 ubuntu-test kernel:  kernel_misc_reclaimable:0
    2024-10-05T02:15:56.068033-05:00 ubuntu-test kernel:  free:495862 free_pcp:12660 free_cma:0
    2024-10-05T02:15:56.068034-05:00 ubuntu-test kernel: Node 0 active_anon:637128kB inactive_anon:0kB active_file:624196kB