function addContentFolder( path )
        local files, folders = file.Find( path .. "/*", "GAME" )
        for k, v in pairs( files ) do
                resource.AddFile( path .. "/" .. v )
        end

        for k, v in pairs( folders ) do
                addContentFolder( path .. "/" .. v )
        end
end

addContentFolder( "sound/sfx" )
addContentFolder( "materials/ui" )
addContentFolder( "materials/models" )
