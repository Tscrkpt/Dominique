
local HttpService = game:GetService("HttpService")

local function REQ(...)
    local arg = {...}
    local tick_req = tick()
    local data_req = ''
    local success, errorMsg = pcall(function()
        data_req = REQ(arg[1])
        -- Verifica se a requisição foi bem-sucedida e se o status é 200
        if data_req.StatusCode ~= 200 or not data_req.Success or not data_req.Headers then
            -- Substitui a lógica de remover chave e expulsar jogador por uma mensagem de erro
            print("Requisição falhou: Bad request")
            return
        end
    end)
    if not success or tick() - tick_req < 0.001 then
        print("Requisição falhou: Bad request")
        return
    end

    local decode_response
    local success, errorMsg = pcall(function()
        decode_response = HttpService:JSONDecode(data_req.Body)
    end)
    if not success then
        print("Erro ao decodificar a resposta: " .. tostring(errorMsg))
        return
    end

    if decode_response.error ~= 0 then
        print("Erro na resposta: " .. decode_response.message)
        return false
    end
    return data_req
end

-- Lógica principal do script, que usa a função REQ sem lidar com chaves
local function Main()
    -- Coloque aqui a lógica principal do seu script
    print("Script executado sem lidar com chaves")
end

Main()
