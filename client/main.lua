local ox_inventory = exports.ox_inventory

RegisterNetEvent('nbs_item_tags:client:wrightTag', function(slot, data)
	ox_inventory:closeInventory()

	local input = lib.inputDialog('Item Tag', {
		{ type = 'input', label = 'Tag Text', description = 'Définir un nom, min 3 et max 30 caractères', required = true, min = 3, max = 30 },
	})

    if input then
        lib.callback('nbs_item_tags:server:addTag', false, function(player)
            ox_inventory:openInventory('player', player)
        end, slot, data, input[1])
    end
end)

RegisterNetEvent('nbs_item_tags:client:removeTag', function(slot, data)
	ox_inventory:closeInventory()

	lib.callback('nbs_item_tags:server:removeTag', false, function(player)
        ox_inventory:openInventory('player', player)
    end, slot, data)
end)
