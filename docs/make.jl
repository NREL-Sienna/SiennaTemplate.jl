using Documenter
import DataStructures: OrderedDict
using SiennaTemplate

pages = OrderedDict(
    "Welcome Page" => "index.md",
    "Tutorials" => Any["stub" => "tutorials/stub.md"],
    "How to..." => Any["stub" => "how_to_guides/stub.md"],
    "Explanation" => Any["stub" => "explanation/stub.md"],
    "Reference" => Any[
        "Developer Guidelines" => "reference/developers/developer_guidelines.md",
        "Public API" => "reference/developers/public.md",
        "Internals" => "reference/internal.md",
        "Stub" => "reference.stud.md"
    ],
)

makedocs(
    modules = [SiennaTemplate],
    format = Documenter.HTML(
        prettyurls = haskey(ENV, "GITHUB_ACTIONS"),
        size_threshold = nothing,),
    sitename = "github.com/NREL-Sienna/SiennaTemplate.jl",
    authors = "Freddy Mercury",
    pages = Any[p for p in pages],
    draft = false,
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

