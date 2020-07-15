def common_chars(s1, s2):
    s1_dict = {}
    for c in s1:
        if s1_dict.get(c) is None:
            s1_dict[c] = 1
        else:
            s1_dict[c] += 1
    
    s2_dict = {}
    for c in s2:
        if s2_dict.get(c) is None:
            s2_dict[c] = 1
        else:
            s2_dict[c] += 1
    
    common_count = 0
    for k in s2_dict.keys():
        if k in s1_dict.keys():
            common_count += min(s2_dict[k], s1_dict[k])

    return common_count

print(common_chars('aabcc', 'adcaa'))