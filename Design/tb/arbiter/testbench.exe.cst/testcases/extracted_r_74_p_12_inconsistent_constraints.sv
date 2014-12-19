class c_74_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_74_12;
    c_74_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx00x110xx1x1zx0z10xz1xx011zx00zxxzxzzxzzzzxxxzxzxzzzzxzzxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
