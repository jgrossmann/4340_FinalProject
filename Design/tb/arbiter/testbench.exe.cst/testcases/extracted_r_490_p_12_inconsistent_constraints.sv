class c_490_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_490_12;
    c_490_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0xx1zz11zz100z0z1x0zz0101z01z10xzzzzzxzzxxzzzxzzzxxxzxzzxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
