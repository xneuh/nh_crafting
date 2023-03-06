function Craft(weaponType) {
    $( ".container" ).animate({
        opacity: 0,
    }, 450, function() {
        $.post('https://nh_crafting/CraftWeapon', JSON.stringify({weapon: weaponType}));
    });
}

function Close() {
    $( ".container" ).animate({
        opacity: 0
    }, 450, function() {
        $.post("https://nh_crafting/CloseNUI", JSON.stringify({}));
    })
}

$(document).on('keyup', function (e) {
    if (e.key == 'Escape') {
      Close();
    }
});

$(document).ready (function() {
    window.addEventListener('message', function(event) {
        let data = event.data
        switch (data.action) {
            case "ShowNUI":
                $( ".container" ).animate({
                    opacity: 1
                }, 450)
                break;
            case "CloseNUI":
                Close();
                break;
        }
    });
});