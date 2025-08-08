module MyModule::LuckyDraw {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;

    /// Stores all participants for the lucky draw
    struct Draw has key {
        participants: vector<address>,
    }

    /// Initialize the lucky draw
    public fun init_draw(admin: &signer) {
        let draw = Draw { participants: vector::empty<address>() };
        move_to(admin, draw);
    }

    /// Enter the lucky draw by paying a fixed amount
    public fun enter_draw(player: &signer, admin_addr: address, entry_fee: u64) acquires Draw {
        let draw = borrow_global_mut<Draw>(admin_addr);

        // Transfer entry fee to admin
        let payment = coin::withdraw<AptosCoin>(player, entry_fee);
        coin::deposit<AptosCoin>(admin_addr, payment);

        // Add participant
        vector::push_back(&mut draw.participants, signer::address_of(player));
    }
}
