using Documenter
import DataStructures: OrderedDict
using SiennaTemplate

pages = OrderedDict(
    "Welcome Page" => "index.md",
    "Tutorials" =>  Any["stub" => "tutorials/stub.md"],
    "How to..." =>  Any["stub" => "how_to_guides/stub.md"],
    "Explanation" => Any["stub" => "explanation/stub.md"],
    "Reference" =>
            Any["Public API" => "reference/public.md",
            "Internals" => "reference/internal.md"]
)

makedocs(
    modules=[SiennaTemplate],
    format=Documenter.HTML(prettyurls=haskey(ENV, "GITHUB_ACTIONS")),
    sitename="github.com/NREL-Sienna/SiennaTemplate.jl",
    authors="Freddy Mercury, Nikola Tesla, Leonard Bernestein",
    pages=Any[p for p in pages],
)

deploydocs(
    repo="github.com/NREL-Sienna/SiennaTempalte.jl",
    target="build",
    branch="gh-pages",
    devbranch="master",
    devurl="dev",
    push_preview=true,
    versions=["stable" => "v^", "v#.#"],
)


