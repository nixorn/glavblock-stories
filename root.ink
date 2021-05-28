
-> start_as

=== start_as ===
    LIST start_as_ = military, outlaw 
    { LIST_RANDOM(start_as_):
    - military: -> start_as_military
    - outlaw:  -> start_as_outlaw
    }

=== start_as_military ===
    you are solder!
    -> END
    

=== start_as_outlaw ===
    you are criminal!
    -> END

