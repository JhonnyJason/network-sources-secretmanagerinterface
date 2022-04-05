import { postData } from "thingy-network-base"

############################################################
#region checkResponse
checkOKResponse = (response, route) ->
    if response.ok then return
    if response.error then throw new Error(response.error)
    msg = route+" - Unexpected Response: "+JSON.stringify(response) 
    throw new Error(msg)
    return

checkReturnedSecret = (response, route) ->
    if response.referencePoint? and response.encryptedContent? then return
    if response.error then throw new Error(response.error)
    msg = route+" - Unexpected Response: "+JSON.stringify(response) 
    throw new Error(msg)
    return

#endregion

############################################################
export addNodeId = (serverURL, publicKey, timestamp, signature) ->
    route = "/addNodeId"
    payload = {publicKey, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

############################################################
export getSecretSpace = (serverURL, publicKey, timestamp, signature) ->
    route = "/getSecretSpace"
    payload = {publicKey, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkReturnedSecret(response, route)
    return response

export getSecret = (serverURL, publicKey, secretId, timestamp, signature) ->
    route = "/getSecret"
    payload = {publicKey, secretId, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkReturnedSecret(response, route)
    return response

############################################################
export setSecret = (serverURL, publicKey, secretId, secret, timestamp, signature) ->
    route = "/setSecret"
    payload = {publicKey, secretId, secret, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

export deleteSecret = (serverURL, publicKey, secretId, timestamp, signature) ->
    route = "/deleteSecret"
    payload = {publicKey, secretId, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

############################################################
export startAcceptingSecretsFrom = (serverURL, publicKey, fromId, timestamp, signature) ->
    route = "/startAcceptingSecretsFrom"
    payload = {publicKey, fromId, timestamp, signature}
    url = serverURL+route
    response =  await postData(url, payload)
    checkOKResponse(response, route)
    return

export stopAcceptingSecretsFrom = (serverURL, publicKey, fromId, timestamp, signature) ->
    route = "/stopAcceptingSecretsFrom"
    payload = {publicKey, fromId, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

############################################################
export shareSecretTo = (serverURL, publicKey, shareToId, secretId, secret, timestamp, signature) ->
    route = "/shareSecretTo"
    payload = {publicKey, shareToId, secretId, secret, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

 export deleteSharedSecret = (serverURL, publicKey, sharedToId, secretId, timestamp, signature) ->
    route = "/deleteSharedSecret"
    payload = {publicKey, sharedToId, secretId, timestamp, signature}
    url = serverURL+route
    response = await postData(url, payload)
    checkOKResponse(response, route)
    return

#endregion