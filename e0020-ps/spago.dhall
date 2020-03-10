{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, backend = "psgo"
, dependencies =
    [ "arrays"
    , "bigints"
    , "console"
    , "effect"
    , "foldable-traversable"
    , "psci-support"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
