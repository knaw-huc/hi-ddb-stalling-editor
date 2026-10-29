# Data-envelope ID review

The IDs of the records listed in `ENTITY-PROFILES-DISCREPANCY.md` of the data-envelope-checker repository (table A, plus the records without an `ID`), checked against the pattern in that repository's README (section "Identifiers and parents"): a parent is `<institute>_<name>` and a child is `<parent-id>_<suffix>`, with `NL-AsdHI` as institute. The related parent is the longest existing ID that the child's ID starts with, followed by `_` (`—`: none, it is a parent or has no parent part). Sorted alphabetically.

## Breaks the pattern (36 records)

| Data-envelope ID | Related parent ID | Pattern issue |
| --- | --- | --- |
| (no ID, records 96–100) | — | no `ID`: set one, `<institute>_<name>` or `<parent-id>_<suffix>` |
| `hi-diplo` | — | no `_`, institute `hi`: rename `NL-AsdHI_<name>` |
| `hi-rep_ent` | — | institute `hi-rep` is not `NL-AsdHI`: rename e.g. `NL-AsdHI_rep_ent` |
| `hi-test` | — | no `_`, institute `hi`: rename `NL-AsdHI_<name>` |
| `NL-Asd_bronnenpublicaties_capaccini` | — | institute `NL-Asd` is a typo: rename `NL-AsdHI_bronnenpublicaties_capaccini` |
| `NL-Asd_HI_bronnenpublicaties_diarium-alting` | — | institute split by `_` (`NL-Asd_HI`): rename `NL-AsdHI_bronnenpublicaties_diarium-alting` |
| `NL-AsdHI-APZH` | — | no `_`: rename `NL-AsdHI_APZH` |
| `NL-AsdHI-bdvcvdev` | — | no `_`: rename `NL-AsdHI_bdvcvdev` |
| `NL-AsdHI-dhbvdev` | — | no `_`: rename `NL-AsdHI_dhbvdev` |
| `NL-AsdHI-hthvdev` | — | no `_`: rename `NL-AsdHI_hthvdev` |
| `NL-AsdHI-rmvdev` | — | no `_`: rename `NL-AsdHI_rmvdev` |
| `NL-AsdHI_bronnenpublicaties_actazh-1-ks3` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_1-ks3` |
| `NL-AsdHI_bronnenpublicaties_actazh-2-ks5` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_2-ks5` |
| `NL-AsdHI_bronnenpublicaties_actazh-3-ks8` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_3-ks8` |
| `NL-AsdHI_bronnenpublicaties_actazh-4-ks11` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_4-ks11` |
| `NL-AsdHI_bronnenpublicaties_actazh-5-ks15` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_5-ks15` |
| `NL-AsdHI_bronnenpublicaties_actazh-6-ks16` | `NL-AsdHI_bronnenpublicaties_actazh` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_actazh_6-ks16` |
| `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken-ks81` | `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken_ks81` |
| `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken-ks82` | `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken_ks82` |
| `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken-ks83` | `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken_ks83` |
| `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken-ks84` | `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken_ks84` |
| `NL-AsdHI_bronnenpublicaties_relazioni-veneziane-gs7` | `NL-AsdHI_bronnenpublicaties_relazioni-veneziane` | child built with `-`: rename `NL-AsdHI_bronnenpublicaties_relazioni-veneziane_gs7` |
| `NL-AsdHI_diplo` (7 records, 74–80) | — | same `ID` on 7 records: make each unique; the `institute` field holds the likely intended ID (`NLAsd-HI_test-07`, …) |
| `NL-AsdHI_republic/data/republic_annotations` | — | `/` is not allowed: use `_`, e.g. `NL-AsdHI_republic_annotations` |
| `NL-AsdHI_republic/data/republic_paragraphs` | — | `/` is not allowed: use `_`, e.g. `NL-AsdHI_republic_paragraphs` |
| `NL-AsdHI_republic/data/republic_print` | — | `/` is not allowed: use `_`, e.g. `NL-AsdHI_republic_print` |

## Unsure (8 records)

| Data-envelope ID | Related parent ID | Pattern issue |
| --- | --- | --- |
| `NL-AsdHI_aaaaaaaaaaaaaaaa_bbbbbbbbbbbbbbbbbbbbbbb_bronnenpublicaties_actazh` | `NL-AsdHI_aaaaaaaaaaaaaaaa_bbbbbbbbbbbbbbbbbbbbbbb` (missing) | unsure: reads as a child of a parent that doesn't exist; if it is a test record, delete it, else create that parent first |
| `NL-AsdHI_bronnenpublicaties_acta-london` | — | unsure: hyphen in the name, probably a plain name; ok if intended |
| `NL-AsdHI_bronnenpublicaties_Archiefgids-gelre` | `NL-AsdHI_bronnenpublicaties_Archiefgids` (missing) | unsure: `-` may be the legacy child delimiter; if so create the parent and rename `NL-AsdHI_bronnenpublicaties_Archiefgids_gelre`, else ok |
| `NL-AsdHI_bronnenpublicaties_Archiefgids-overheid` | `NL-AsdHI_bronnenpublicaties_Archiefgids` (missing) | unsure: `-` may be the legacy child delimiter; if so create the parent and rename `NL-AsdHI_bronnenpublicaties_Archiefgids_overheid`, else ok |
| `NL-AsdHI_bronnenpublicaties_MiddenMolukken-midden-molukken` | `NL-AsdHI_bronnenpublicaties_MiddenMolukken` (missing) | unsure: `-` may be the legacy child delimiter; if so create the parent and rename `NL-AsdHI_bronnenpublicaties_MiddenMolukken_midden-molukken`, else ok |
| `NL-AsdHI_bronnenpublicaties_relazioni-veneziane` | — | unsure: hyphen in the name, probably a plain name; ok if intended |
| `NL-AsdHI_bronnenpublicaties_vroedschap-amsterdam` | — | unsure: hyphen in the name, probably a plain name; ok if intended |
| `NL-AsdHI_republic-WIP` | — | unsure: hyphen in the name, probably a plain name; ok if intended |

## Fine (30 records)

| Data-envelope ID | Related parent ID | Pattern issue |
| --- | --- | --- |
| `NL-AsdHI_bronnenpublicaties_actazh` | — | ok |
| `NL-AsdHI_bronnenpublicaties_AFC` | — | ok |
| `NL-AsdHI_bronnenpublicaties_archangel` | — | ok |
| `NL-AsdHI_bronnenpublicaties_cuper` | — | ok |
| `NL-AsdHI_bronnenpublicaties_falck` | — | ok |
| `NL-AsdHI_bronnenpublicaties_iersekeroord` | — | ok |
| `NL-AsdHI_bronnenpublicaties_inboedelsoranje` | — | ok |
| `NL-AsdHI_bronnenpublicaties_kloosterrade` | — | ok |
| `NL-AsdHI_bronnenpublicaties_lidt` | — | ok |
| `NL-AsdHI_bronnenpublicaties_lidt_ks95` | `NL-AsdHI_bronnenpublicaties_lidt` | ok |
| `NL-AsdHI_bronnenpublicaties_lidt_ks96` | `NL-AsdHI_bronnenpublicaties_lidt` | ok |
| `NL-AsdHI_bronnenpublicaties_plott` | — | ok |
| `NL-AsdHI_bronnenpublicaties_schouburg` | — | ok |
| `NL-AsdHI_bronnenpublicaties_slingelandt` | — | ok |
| `NL-AsdHI_bronnenpublicaties_snouck` | — | ok |
| `NL-AsdHI_bronnenpublicaties_snouck_1` | `NL-AsdHI_bronnenpublicaties_snouck` | ok |
| `NL-AsdHI_bronnenpublicaties_snouck_2` | `NL-AsdHI_bronnenpublicaties_snouck` | ok |
| `NL-AsdHI_bronnenpublicaties_snouck_3` | `NL-AsdHI_bronnenpublicaties_snouck` | ok |
| `NL-AsdHI_bronnenpublicaties_wenen` | — | ok |
| `NL-AsdHI_bronnenpublicaties_witsen` | — | ok |
| `NL-AsdHI_bronnenpublicaties_zending` | — | ok |
| `NL-AsdHI_portals_bpn` | — | ok |
| `NL-AsdHI_teksteditie_brievencorrespondenten` | — | ok |
| `NL-AsdHI_teksteditie_lennep` | — | ok |
| `NL-AsdHI_teksteditie_pierson` | — | ok |
| `NL-AsdHI_teksteditie_rijmkroniek` | — | ok |
| `NL-AsdHI_teksteditie_walewein` | — | ok |
| `NL-AsdHI_teksteditie_ystroom` | — | ok |
| `NL-AsdHI_test` | — | ok |
| `NL-AsdHI_test_07` | `NL-AsdHI_test` | ok |
