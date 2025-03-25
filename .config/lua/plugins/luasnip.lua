local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

-- Adiciona os snippets de C#
luasnip.add_snippets("cs", {
    s("basicsharp", {
        t({"using System;", ""}),
        t({"", "namespace "}),
        i(1, "HelloWorld"),
        t({"", "{"}),
        t({"", "    public class Program"}),
        t({"", "    {"}),
        t({"", "        public static void Main()"}),
        t({"", "        {"}),
        t({"", '            Console.WriteLine("Hello World!");'}),
        t({"", "        }"}),
        t({"", "    }"}),
        t({"", "}"}),
    }),
    s("cwl", {
        t({"Console.WriteLine("}),
        i(1, "Hello, World!"),
        t({");"})
    }),
})
luasnip.add_snippets("c", {
    s("basic", {
        t({"#include <stdio.h>"}),
        t({"", "", "int main()"}),
        t({"", "{"}),
        t({"", '    printf("Hello, World");'}),
        t({"", "}"})
    })
})
