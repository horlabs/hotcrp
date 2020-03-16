<?php
// formulas/f_conflict.php -- HotCRP helper class for formula expressions
// Copyright (c) 2009-2020 Eddie Kohler; see LICENSE.

class Conflict_Fexpr extends Fexpr {
    private $ispc;
    function __construct($ispc) {
        $this->ispc = is_object($ispc) ? $ispc->kwdef->is_pc : $ispc;
        $this->_format = self::FBOOL;
    }
    function inferred_index() {
        return Fexpr::IDX_PC;
    }
    function compile(FormulaCompiler $state) {
        // XXX the actual search is different
        $idx = $state->loop_cid();
        if ($state->looptype === Fexpr::IDX_MY) {
            $rt = "\$prow->has_conflict($idx)";
        } else {
            $rt = "!!(" . $state->_add_conflicts() . "[" . $idx . "] ?? false)";
            if ($this->ispc) {
                $rt = "(" . $state->_add_pc() . "[" . $idx . "] ?? false ? $rt : null)";
            }
        }
        return $rt;
    }
}
